import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController controller = TextEditingController(text: "");
  final FocusNode focusNode = FocusNode();
  Color? fillColor;
  bool clearButtonEnabled = false;

  void searchBackgroundColorFocusHandler() {
    if (focusNode.hasFocus && fillColor == null) {
      setState(() {
        fillColor = Constants.accentSecondaryColor;
      });
    } else if (!focusNode.hasFocus && fillColor != null) {
      setState(() {
        fillColor = null;
        print("COLAPS");
      });
    }
  }

  void searchClearButtonHandler() {
    if (controller.value.text.isNotEmpty && !clearButtonEnabled) {
      setState(() {
        clearButtonEnabled = true;
      });
    } else if (controller.value.text.isEmpty && clearButtonEnabled) {
      setState(() {
        clearButtonEnabled = false;
      });
    }
  }

  @override
  void initState() {
    focusNode.addListener(searchBackgroundColorFocusHandler);
    controller.addListener(searchClearButtonHandler);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      key: const ValueKey("search_field"),
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        fillColor: fillColor,
        prefixIcon: Container(
          width: Constants.searchFieldHeight,
          height: Constants.searchFieldHeight,
          padding: Constants.searchFieldPrefixIconPadding,
          child: ElevatedButton(
            onPressed: () {  },
            style: TextButton.styleFrom(padding: EdgeInsets.zero, backgroundColor: Colors.transparent),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
          ),
        ),
        suffixIcon: Container(
          width: Constants.searchFieldHeight,
          height: Constants.searchFieldHeight,
          padding: Constants.searchFieldPrefixIconPadding,
          child: clearButtonEnabled ? ElevatedButton(
            onPressed: () {  },
            style: TextButton.styleFrom(padding: EdgeInsets.zero, backgroundColor: Colors.transparent),
            child: SvgPicture.asset(
              "assets/icons/close.svg",
            ),
          ) : null,
        ),
      ),
    );
  }
}
