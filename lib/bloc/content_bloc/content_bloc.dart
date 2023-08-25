import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer/extensions/search_queries_actions.dart';
import 'package:github_repo_viewer/repositories/github_api_repository.dart';
import 'package:meta/meta.dart';

import '../../models/github_repository.dart';

part 'content_event.dart';

part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  late final GithubApiRepository _githubApiRepository;

  ContentBloc({required GithubApiRepository githubApiRepository}) : super(const InitialContentState()) {
    _githubApiRepository = githubApiRepository;
    on<StartInitEvent>(_startInit);
    on<SearchGithubRepositoryEvent>(_searchGithubRepository);
    on<AddGithubRepositoryToFavoritesEvent>(_addGithubRepositoryToFavorites);
    on<RemoveGithubRepositoryFromFavoritesEvent>(_removeGithubRepositoryFromFavorites);
  }

  Future<void> _startInit(StartInitEvent event, Emitter<ContentState> emit) async {
    emit(LoadedContentState(
      githubRepositories: state.githubRepositories,
      favoritesRepositories: state.favoritesRepositories,
      searchHistory: state.searchHistory,
      favoritesHistory: state.favoritesHistory,
    ));
  }

  Future<void> _searchGithubRepository(SearchGithubRepositoryEvent event, Emitter<ContentState> emit) async {
    if(state.runtimeType == LoadingContentState) return;

    emit(
      LoadingContentState(
        favoritesRepositories: state.favoritesRepositories,
        searchHistory: state.searchHistory.addAndShift(event.toSearch),
        favoritesHistory: state.favoritesHistory,
      ),
    );

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

  Future<void> _addGithubRepositoryToFavorites(AddGithubRepositoryToFavoritesEvent event, Emitter<ContentState> emit) async {}

  Future<void> _removeGithubRepositoryFromFavorites(RemoveGithubRepositoryFromFavoritesEvent event, Emitter<ContentState> emit) async {}
}
