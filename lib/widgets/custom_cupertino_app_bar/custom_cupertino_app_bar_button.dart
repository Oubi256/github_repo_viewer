import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repo_viewer/constants.dart';

class CustomCupertinoAppBarButton extends StatefulWidget {
  final String svgIconAssetPath;
  final VoidCallback onPressed;

  const CustomCupertinoAppBarButton({
    super.key,
    required this.svgIconAssetPath,
    required this.onPressed,
  });

  @override
  State<CustomCupertinoAppBarButton> createState() => _CustomCupertinoAppBarButtonState();
}

class _CustomCupertinoAppBarButtonState extends State<CustomCupertinoAppBarButton> {
  final MaterialStatesController materialStatesController = MaterialStatesController();
  late Color iconColor;

  void _updateIconColor(BuildContext context,{bool forceRender = true}) {
    iconColor = Theme.of(context).elevatedButtonTheme.style!.iconColor!.resolve(materialStatesController.value)!;

    if (forceRender) setState(() {});
  }

  @override
  void initState() {
    materialStatesController.addListener(() => _updateIconColor);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _updateIconColor(context, forceRender: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.appBarButtonSize.width,
      height: Constants.appBarButtonSize.height,
      child: ElevatedButton(
        statesController: materialStatesController,
        onPressed: widget.onPressed,
        child: SvgPicture.asset(
          widget.svgIconAssetPath,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
