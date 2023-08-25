
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String appTitle = "Github repo viewer";

  static double appBarHeight = 117.h;
  static EdgeInsetsDirectional appBarContentPadding = EdgeInsetsDirectional.only(bottom: 11.h, end: 16.w, start: 16.w);
  static Size appBarButtonSize = Size(44.r, 44.r);
  static double appBarButtonIconHeight = 24.r;
  static BorderRadius appBarButtonBorderRadius = BorderRadius.circular(12.r);

  static EdgeInsets horizontalPagePadding = EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets verticalTextFieldPadding = EdgeInsets.only(top: 24.h, bottom: 16.h);
  static double verticalItemSeparatorHeight = 8.h;
  static double verticalHeaderSeparatorHeight = 8.h;
  static double headerBottomSeparatorHeight = 20.h;
  static double searchCardHeight = 55.h;
  static BorderRadius searchCardBorderRadius = BorderRadius.circular(10);
  static EdgeInsets searchCardHorizontalPadding = EdgeInsets.symmetric(horizontal: 16.w);
  
  static double searchFieldHeight = 56.h;
  static BorderRadius searchFieldBorderRadius = BorderRadius.circular(30);
  static double searchFieldBorderWidth = 2;
  static EdgeInsets searchFieldContentPadding = EdgeInsets.all(16.w);
  static EdgeInsets searchFieldPrefixIconPadding = EdgeInsets.only(left: 16.r, top: 16.r, bottom: 16.r, right: 10.r);
  static EdgeInsets searchFieldSuffixIconPadding = EdgeInsets.only(left: 10.r, top: 16.r, bottom: 16.r, right: 16.r);


  static Color backgroundColor = const Color(0xFFF9F9F9);
  static Color layerColor = const Color(0xFFF2F2F2);
  static Color accentPrimaryColor = const Color(0xFF1463F5);
  static Color accentSecondaryColor = const Color(0xFFE5EDFF);
  static Color textPrimaryColor = const Color(0xFF211814);
  static Color textPlaceholderColor = const Color(0xFFBFBFBF);
  static Color buttonDisabledColor = const Color(0xFFF2F2F2);
  static Color buttonDisabledBorderColor = const Color(0xFFBFBFBF);
  static Color buttonDisabledIconColor = const Color(0xFF939393);
  static Color buttonEnabledIconColor = const Color(0xFFFFFFFF);
}
