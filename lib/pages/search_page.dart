import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repo_viewer/constants.dart';
import 'package:github_repo_viewer/widgets/custom_cupertino_app_bar.dart';
import 'package:github_repo_viewer/widgets/custom_search_field.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_svg_item_button.dart';

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
          children: [
            Padding(
              padding: Constants.verticalTextFieldPadding,
              child: SizedBox(
                height: Constants.searchFieldHeight,
                child: const CustomSearchField()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
