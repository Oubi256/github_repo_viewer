import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../widgets/custom_cupertino_app_bar/custom_cupertino_app_bar.dart';
import '../widgets/custom_cupertino_app_bar/custom_cupertino_app_bar_button.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCupertinoAppBar(
        height: Constants.appBarHeight,
        middleTitle: "Favorite repos list",
        leading: CustomCupertinoAppBarButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            "assets/icons/left.svg",
            height: Constants.appBarButtonIconHeight,
          ),
        ),
      ),
      body: Center(
        child: Text(toString()),
      ),
    );
  }
}
