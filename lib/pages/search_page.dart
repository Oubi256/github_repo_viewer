import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer/bloc/content_bloc/content_bloc.dart';
import 'package:github_repo_viewer/constants.dart';
import 'package:github_repo_viewer/widgets/custom_cupertino_app_bar.dart';
import 'package:github_repo_viewer/widgets/custom_search_field.dart';
import 'package:github_repo_viewer/widgets/search_card.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_svg_item_button.dart';
import '../widgets/halfscreen_info_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                    onSubmitted: (query) => query.isNotEmpty ? context.read<ContentBloc>().add(SearchGithubRepositoryEvent(query)) : null,
                  )),
            ),
            Text("Search History", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Constants.accentPrimaryColor)),
            SizedBox(height: Constants.headerBottomSeparatorHeight),
            BlocBuilder<ContentBloc, ContentState>(
              builder: (context, state) {
                if (state.runtimeType == LoadingContentState) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (state.runtimeType == LoadedContentState) {
                  if (state.searchHistory.isEmpty) {
                    return const HalfscreenInfoText("Nothing was find for your search.\nPlease check the spelling");
                  }
                  return SingleChildScrollView(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.searchHistory.length,
                      itemBuilder: (context, index) {
                        return SearchCard(onCheckboxChanged: (value) {}, title: state.searchHistory[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) => SizedBox(
                        height: Constants.verticalItemSeparatorHeight,
                      ),
                    ),
                  );
                }

                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
