import 'package:flutter/material.dart';

class HalfscreenInfoText extends StatelessWidget {
  final String label;

  const HalfscreenInfoText(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0, right: 0,
          bottom: MediaQuery.of(context).size.height / 2,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
        ),
      ],
    );
  }
}
