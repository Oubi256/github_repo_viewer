import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../widgets/custom_cupertino_app_bar.dart';
import '../widgets/custom_svg_item_button.dart';

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
      body: Center(
        child: Text(toString()),
      ),
    );
  }
}
