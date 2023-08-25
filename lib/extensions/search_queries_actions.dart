import 'package:github_repo_viewer/bloc/content_bloc/content_bloc.dart';

extension SearchQueriesActions on SearchQueries {
  SearchQueries addAndShift(String searchQuery, {int maxQueriesLength = 5}) {
    SearchQueries updatedSearchQueries = List.from(this);
    updatedSearchQueries.insert(0, searchQuery);
    if (updatedSearchQueries.length > 5) updatedSearchQueries.removeLast();
    return updatedSearchQueries;
  }
}