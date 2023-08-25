import 'package:flutter/material.dart';
import 'package:github_repo_viewer/widgets/search_card.dart';

import '../constants.dart';
import '../models/github_repository.dart';
import 'halfscreen_info_text.dart';

class RepositoriesListView extends StatelessWidget {
  final List<GithubRepository> repositories;
  const RepositoriesListView({super.key, required this.repositories});

  @override
  Widget build(BuildContext context) {
    if (repositories.isEmpty) {
      return const HalfscreenInfoText("You have no favorites.\nClick on star while searching to add first favorite");
    }

    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          return SearchCard(onCheckboxChanged: (value) {}, title: repositories[index].name);
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: Constants.verticalItemSeparatorHeight,
        ),
      ),
    );
  }
}
