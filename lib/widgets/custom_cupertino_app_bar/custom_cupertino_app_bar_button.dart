import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_repo_viewer/constants.dart';

class CustomCupertinoAppBarButton extends StatelessWidget {
  final Widget icon;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const CustomCupertinoAppBarButton({
    super.key,
    required this.icon,
    required this.padding,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      padding: padding,
      onPressed: onPressed,
      borderRadius: Constants.appBarButtonBorderRadius,
      child: icon,
    );
  }
}
