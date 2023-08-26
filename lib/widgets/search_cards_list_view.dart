import 'package:flutter/material.dart';

import '../constants.dart';
import 'halfscreen_info_text.dart';

class SearchCardsListView extends StatelessWidget {
  final List<dynamic> searchCards;
  final NullableIndexedWidgetBuilder itemBuilder;
  final String emptyLabel;
  final String? headerLabel;

  const SearchCardsListView({super.key, required this.searchCards, required this.itemBuilder, required this.emptyLabel, this.headerLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headerLabel != null) ...[
          Text(headerLabel!, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Constants.accentPrimaryColor)),
          SizedBox(height: Constants.headerBottomSeparatorHeight),
        ],
        if (searchCards.isEmpty) ...[
          Flexible(
            child: HalfscreenInfoText(emptyLabel),
          ),
        ] else ...[
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: searchCards.length,
              itemBuilder: itemBuilder,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: Constants.verticalItemSeparatorHeight,
              ),
            ),
          ),
        ]
      ],
    );
  }
}
