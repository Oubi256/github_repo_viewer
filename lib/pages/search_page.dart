import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        middleTitle: "Github repo list",
        trailing: CustomCupertinoAppBarButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.go('/search/favorite'),
          icon: SvgPicture.asset(
            "assets/icons/favorite_active.svg",
            height: Constants.appBarButtonIconHeight,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(toString()),
          ],
        ),
      ),
    );
  }
}
