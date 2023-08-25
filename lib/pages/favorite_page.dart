import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer/widgets/repositories_list_view.dart';
import 'package:go_router/go_router.dart';

import '../bloc/content_bloc/content_bloc.dart';
import '../constants.dart';
import '../widgets/custom_cupertino_app_bar.dart';
import '../widgets/custom_svg_item_button.dart';
import '../widgets/halfscreen_info_text.dart';
import '../widgets/search_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCupertinoAppBar(
        height: Constants.appBarHeight,
        middleTitle: "Favorite repos list",
        leading: CustomSvgIconButton(
          onPressed: () => context.pop(),
          svgIconAssetPath: "assets/icons/left.svg",
        ),
      ),
      body: Padding(
        padding: Constants.horizontalPagePadding,
        child: Column(
          children: [
            SizedBox(height: Constants.headerBottomSeparatorHeight),
            Expanded(
              child: BlocBuilder<ContentBloc, ContentState>(
                builder: (context, state) {
                  if (state.runtimeType == LoadedContentState) {
                    return RepositoriesListView(repositories: state.favoritesRepositories);
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
