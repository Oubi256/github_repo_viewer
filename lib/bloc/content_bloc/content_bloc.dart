import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer/extensions/search_queries_actions.dart';
import 'package:github_repo_viewer/repositories/github_api_repository.dart';
import 'package:github_repo_viewer/repositories/hive_repository.dart';
import 'package:meta/meta.dart';

import '../../models/github_repository.dart';

part 'content_event.dart';

part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  late final GithubApiRepository _githubApiRepository;
  late final HiveRepository _hiveRepository;
  final ValueNotifier<bool> isInitialized = ValueNotifier(false);

  ContentBloc({required GithubApiRepository githubApiRepository, required HiveRepository hiveRepository}) : super(const InitialContentState()) {
    print("bloc init start");
    _githubApiRepository = githubApiRepository;
    _hiveRepository = hiveRepository;

    isInitialized.addListener(onInitFinished);
    _hiveRepository.isInitialized.addListener(hiveInitListener);

    on<StartInitEvent>(_startInit);
    on<SearchGithubRepositoryEvent>(_searchGithubRepository);
    on<AddGithubRepositoryToFavoritesEvent>(_addGithubRepositoryToFavorites);
    on<RemoveGithubRepositoryFromFavoritesEvent>(_removeGithubRepositoryFromFavorites);
  }

  void hiveInitListener() {
    if (_hiveRepository.isInitialized.value) {
      isInitialized.value = true;
    } else {
      _hiveRepository.isInitialized.removeListener(hiveInitListener);
    }
  }
  void onInitFinished() {
    add(const StartInitEvent());
  }

  Future<void> _startInit(StartInitEvent event, Emitter<ContentState> emit) async {
    SearchQueries loadedSearchQueries = List.from(await _hiveRepository.getContent("history") ?? []);
    List<GithubRepository> loadedFavoritesRepositories = List<GithubRepository>.from(await _hiveRepository.getContent("favorites_repositories") ?? []);
    emit(LoadedContentState(
      githubRepositories: state.githubRepositories,
      favoritesRepositories: loadedFavoritesRepositories,
      searchHistory: loadedSearchQueries,
      favoritesHistory: state.favoritesHistory,
    ));
  }

  Future<void> _searchGithubRepository(SearchGithubRepositoryEvent event, Emitter<ContentState> emit) async {
    if (state.runtimeType == LoadingContentState) return;

    SearchQueries updatedSearchHistory = state.searchHistory.addAndShift(event.toSearch);
    emit(
      LoadingContentState(
        favoritesRepositories: state.favoritesRepositories,
        searchHistory: updatedSearchHistory,
        favoritesHistory: state.favoritesHistory,
      ),
    );

    _hiveRepository.saveContent("history", updatedSearchHistory);

    final List<GithubRepository> githubRepositories = await _githubApiRepository.gerRepositories(byName: event.toSearch);

    emit(
      LoadedContentState(
        githubRepositories: githubRepositories,
        favoritesRepositories: state.favoritesRepositories,
        searchHistory: state.searchHistory,
        favoritesHistory: state.favoritesHistory,
      ),
    );
  }

  Future<void> _addGithubRepositoryToFavorites(AddGithubRepositoryToFavoritesEvent event, Emitter<ContentState> emit) async {
    if (state.favoritesRepositories.contains(event.toAdd)) return;

    List<GithubRepository> updatedFavoritesRepositories = List.from(state.favoritesRepositories)..insert(0, event.toAdd);

    _hiveRepository.saveContent("favorites_repositories", updatedFavoritesRepositories);

    emit(
      LoadedContentState(
        githubRepositories: state.githubRepositories,
        favoritesRepositories: updatedFavoritesRepositories,
        searchHistory: state.searchHistory,
        favoritesHistory: state.favoritesHistory,
      ),
    );
  }

  Future<void> _removeGithubRepositoryFromFavorites(RemoveGithubRepositoryFromFavoritesEvent event, Emitter<ContentState> emit) async {
    if (!state.favoritesRepositories.contains(event.toRemove)) return;

    List<GithubRepository> updatedFavoritesRepositories = List.from(state.favoritesRepositories)..remove(event.toRemove);

    print(updatedFavoritesRepositories);
    _hiveRepository.saveContent("favorites_repositories", updatedFavoritesRepositories);

    emit(
      LoadedContentState(
        githubRepositories: state.githubRepositories,
        favoritesRepositories: updatedFavoritesRepositories,
        searchHistory: state.searchHistory,
        favoritesHistory: state.favoritesHistory,
      ),
    );
  }
}
