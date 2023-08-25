import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer/repositories/github_api_repository.dart';
import 'package:meta/meta.dart';

import '../../models/github_repository.dart';

part 'content_event.dart';

part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final GithubApiRepository githubApiRepository;

  ContentBloc({required this.githubApiRepository}) : super(const InitialContentState()) {
    on<SearchGithubRepositoryEvent>(_searchGithubRepository);
    on<AddGithubRepositoryToFavoritesEvent>(_addGithubRepositoryToFavorites);
    on<RemoveGithubRepositoryFromFavoritesEvent>(_removeGithubRepositoryFromFavorites);
  }

  Future<void> _searchGithubRepository(SearchGithubRepositoryEvent event, Emitter<ContentState> emit) async {
    emit(
      LoadingContentState(
        favoritesRepositories: state.favoritesRepositories,
        searchHistory: state.searchHistory,
        favoritesHistory: state.favoritesHistory,
      ),
    );

    final List<GithubRepository> githubRepositories = await githubApiRepository.gerRepositories(byName: event.toSearch);

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
