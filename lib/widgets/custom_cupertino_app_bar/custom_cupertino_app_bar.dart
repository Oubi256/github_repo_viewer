import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_repo_viewer/widgets/custom_cupertino_app_bar/custom_cupertino_app_bar_button.dart';

class CustomCupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final CustomCupertinoAppBarButton? leading;
  final CustomCupertinoAppBarButton? trailing;
  final String? middleTitle;
  final EdgeInsetsDirectional? contentPadding;

  const CustomCupertinoAppBar({
    super.key,
    required this.height,
    this.leading,
    this.trailing,
    this.middleTitle,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SizedBox(
        height: height,
        child: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          padding: contentPadding,
          middle: middleTitle != null ? Text("$middleTitle", style: Theme.of(context).textTheme.titleMedium) : null,
          trailing: trailing,
          leading: Container(width: 44.r, height: 44.r, alignment: Alignment.centerLeft, child: leading,), // TODO: Fix it
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
