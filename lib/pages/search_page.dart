import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repo_viewer/constants.dart';
import 'package:github_repo_viewer/widgets/custom_cupertino_app_bar/custom_cupertino_app_bar.dart';
import 'package:github_repo_viewer/widgets/custom_cupertino_app_bar/custom_cupertino_app_bar_button.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCupertinoAppBar(
        height: Constants.appBarHeight,
        middleTitle: "Github repos list",
        trailing: CustomCupertinoAppBarButton(
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
                child: TextField()
              ),
            )
          ],
        ),
      ),
    );
  }
}
