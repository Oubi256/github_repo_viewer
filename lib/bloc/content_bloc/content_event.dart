part of 'content_bloc.dart';

@immutable
abstract class ContentEvent {
  const ContentEvent();
}

class SearchGithubRepositoryEvent extends ContentEvent {
  final String toSearch;

  const SearchGithubRepositoryEvent(this.toSearch);
}

class AddGithubRepositoryToFavoritesEvent extends ContentEvent {
  final GithubRepository toAdd;

  const AddGithubRepositoryToFavoritesEvent(this.toAdd);
}

class RemoveGithubRepositoryFromFavoritesEvent extends ContentEvent {
  final GithubRepository toRemove;

  const RemoveGithubRepositoryFromFavoritesEvent(this.toRemove);
}
