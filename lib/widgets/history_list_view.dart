import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repo_viewer/widgets/search_card.dart';

import '../bloc/content_bloc/content_bloc.dart';
import '../constants.dart';
import 'halfscreen_info_text.dart';

class HistoryListView extends StatelessWidget {
  final SearchQueries history;

  const HistoryListView({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const HalfscreenInfoText("Nothing was find for your search.\nPlease check the spelling");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Search History", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Constants.accentPrimaryColor)),
        SizedBox(height: Constants.headerBottomSeparatorHeight),
        SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: history.length,
            itemBuilder: (context, index) {
              return SearchCard(onCheckboxChanged: (value) {}, title: history[index]);
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: Constants.verticalItemSeparatorHeight,
            ),
          ),
        ),
      ],
    );
  }
}
