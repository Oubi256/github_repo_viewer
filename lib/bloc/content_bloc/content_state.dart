part of 'content_bloc.dart';

typedef SearchQueries = List<String>;

@immutable
abstract class ContentState {
  final List<GithubRepository> githubRepositories;
  final List<GithubRepository> favoritesRepositories;
  final SearchQueries searchHistory;
  final SearchQueries favoritesHistory;


  const ContentState({required this.githubRepositories, required this.favoritesRepositories, required this.searchHistory, required this.favoritesHistory});
}

class InitialContentState extends ContentState {
  const InitialContentState() : super(githubRepositories: const [], favoritesRepositories: const [], searchHistory: const [], favoritesHistory: const []);
}

class LoadingContentState extends ContentState {
  const LoadingContentState({required super.favoritesRepositories, required super.searchHistory, required super.favoritesHistory}) : super(githubRepositories: const []);
}

class LoadedContentState extends ContentState {
  const LoadedContentState({required super.githubRepositories, required super.favoritesRepositories, required super.searchHistory, required super.favoritesHistory});
}

class CriticalErrorState extends ContentState {
  const CriticalErrorState() : super(githubRepositories: const [], favoritesRepositories: const [], searchHistory: const [], favoritesHistory: const []);
}
