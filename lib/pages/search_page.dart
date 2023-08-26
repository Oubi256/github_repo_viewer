import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer/bloc/content_bloc/content_bloc.dart';
import 'package:github_repo_viewer/constants.dart';
import 'package:github_repo_viewer/widgets/custom_cupertino_app_bar.dart';
import 'package:github_repo_viewer/widgets/custom_search_field.dart';
import 'package:github_repo_viewer/widgets/search_cards_list_view.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_svg_item_button.dart';
import '../widgets/search_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode searchFocusNode = FocusNode();
  bool showContent = true;

  void showingHistoryFocusHandler() {
    if (searchFocusNode.hasFocus && showContent == true) {
      setState(() {
        showContent = false;
      });
    } else if (!searchFocusNode.hasFocus && showContent == false) {
      setState(() {
        showContent = true;
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
            Expanded(
              child: BlocBuilder<ContentBloc, ContentState>(
                builder: (context, state) {
                  if (state.runtimeType == LoadingContentState) {
                    return const Align(
                      alignment: Alignment.topCenter,
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  if (state.runtimeType == LoadedContentState && showContent) {
                    return SearchCardsListView(searchCards: state.githubRepositories, itemBuilder: (context, index) {
                      return SearchCard(onCheckboxChanged: (value) {}, title: state.githubRepositories[index].name);
                    }, emptyLabel: "You have no favorites.\nClick on star while searching to add first favorite", headerLabel: "Search History",);
                  }
                  if (state.runtimeType == LoadedContentState && showContent) {
                    return SearchCardsListView(searchCards: state.searchHistory, itemBuilder: (context, index) {
                      return SearchCard(onCheckboxChanged: (value) {}, title: state.searchHistory[index]);
                    }, emptyLabel: "Nothing was find for your search.\nPlease check the spelling", headerLabel: "What we found",);
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
