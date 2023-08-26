import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repo_viewer/constants.dart';

class FavoriteCheckButton extends StatelessWidget {
  final bool isFavorite;
  final void Function(bool value) onCheckboxChanged;

  const FavoriteCheckButton({super.key, required this.isFavorite, required this.onCheckboxChanged});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => onCheckboxChanged(!isFavorite),
        child: AnimatedCrossFade(
          firstChild: SvgPicture.asset(
            'assets/icons/favorite_active.svg',
            colorFilter: ColorFilter.mode(Constants.textPlaceholderColor, BlendMode.srcIn),
          ),
          secondChild: SvgPicture.asset(
            'assets/icons/favorite_active.svg',
            colorFilter: ColorFilter.mode(Constants.accentPrimaryColor, BlendMode.srcIn),
          ),
          crossFadeState: isFavorite ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(microseconds: 500),
        ),
      ),
    );
  }
}
