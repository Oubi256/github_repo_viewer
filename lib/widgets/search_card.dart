import 'package:flutter/material.dart';
import 'package:github_repo_viewer/constants.dart';

import 'favorite_check_button.dart';

class SearchCard extends StatelessWidget {
  final void Function(bool value) onCheckboxChanged;
  final bool isFavorite;
  final String title;

  const SearchCard({super.key, required this.onCheckboxChanged, required this.title, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.searchCardHeight,
      alignment: Alignment.centerLeft,
      padding: Constants.searchCardHorizontalPadding,
      decoration: BoxDecoration(
        borderRadius: Constants.searchCardBorderRadius,
        color: Constants.layerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          FavoriteCheckButton(isFavorite: isFavorite, onCheckboxChanged: onCheckboxChanged),
        ],
      ),
    );
  }
}
