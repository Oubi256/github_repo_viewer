import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/content_bloc/content_bloc.dart';
import '../constants.dart';
import '../widgets/custom_cupertino_app_bar.dart';
import '../widgets/custom_svg_item_button.dart';
import '../widgets/search_card.dart';
import '../widgets/search_cards_list_view.dart';

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
                  return SearchCardsListView(
                      searchCards: state.favoritesRepositories,
                      itemBuilder: (context, index) {
                        return SearchCard(
                          key: ValueKey("favorite_${state.favoritesRepositories[index].id}"),
                          onCheckboxChanged: (value) {
                            context.read<ContentBloc>().add(
                              RemoveGithubRepositoryFromFavoritesEvent(state.favoritesRepositories[index]),
                            );
                          },
                          title: state.favoritesRepositories[index].fullName,
                          isFavorite: true,
                        );
                      },
                      emptyLabel: "You have no favorites.\nClick on star while searching to add first favorite");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
