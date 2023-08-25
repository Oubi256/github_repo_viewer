import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CustomSvgIconButton extends StatefulWidget {
  final String svgIconAssetPath;
  final VoidCallback onPressed;

  const CustomSvgIconButton({super.key, required this.svgIconAssetPath, required this.onPressed});

  @override
  State<CustomSvgIconButton> createState() => _CustomSvgIconButtonState();
}

class _CustomSvgIconButtonState extends State<CustomSvgIconButton> {
  final MaterialStatesController materialStatesController = MaterialStatesController();
  late Color iconColor;

  void _updateIconColor(BuildContext context, {bool forceRender = true}) {
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
