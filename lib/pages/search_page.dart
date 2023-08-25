import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer/bloc/content_bloc/content_bloc.dart';
import 'package:github_repo_viewer/constants.dart';
import 'package:github_repo_viewer/widgets/custom_cupertino_app_bar.dart';
import 'package:github_repo_viewer/widgets/custom_search_field.dart';
import 'package:github_repo_viewer/widgets/history_list_view.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_svg_item_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode searchFocusNode = FocusNode();
  bool showHistory = true;

  void showingHistoryFocusHandler() {
    if (searchFocusNode.hasFocus && showHistory == true) {
      print(false);
      setState(() {
        showHistory = false;
      });
    } else if (!searchFocusNode.hasFocus && showHistory == false) {
      print(true);
      setState(() {
        showHistory = true;
      });
    }
  }

  @override
  void initState() {
    searchFocusNode.addListener(showingHistoryFocusHandler);
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCupertinoAppBar(
        height: Constants.appBarHeight,
        middleTitle: "Github repos list",
        trailing: CustomSvgIconButton(
          onPressed: () => context.go('/search/favorite'),
          svgIconAssetPath: "assets/icons/favorite_active.svg",
        ),
      ),
      body: Padding(
        padding: Constants.horizontalPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Constants.verticalTextFieldPadding,
              child: SizedBox(
                height: Constants.searchFieldHeight,
                child: CustomSearchField(
                  focusNode: searchFocusNode,
                  onSubmitted: (query) => query.isNotEmpty ? context.read<ContentBloc>().add(SearchGithubRepositoryEvent(query)) : null,
                ),
              ),
            ),
            //if (showHistory) const SearchHistoryWidget(),
            Expanded(
              child: BlocBuilder<ContentBloc, ContentState>(
                builder: (context, state) {
                  if (state.runtimeType == LoadingContentState) {
                    return const Align(
                      alignment: Alignment.topCenter,
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  if (state.runtimeType == LoadedContentState && showHistory) {
                    return HistoryListView(history: state.searchHistory);
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
