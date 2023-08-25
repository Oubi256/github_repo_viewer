part of 'main.dart';

ThemeData _themeConfig = ThemeData.light().copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Constants.backgroundColor,
  primaryColor: Constants.accentPrimaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0),
      iconColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Constants.buttonDisabledIconColor;
          }
          return Constants.buttonEnabledIconColor;
        },
      ),
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  width: 2.r,
                  color: Constants.buttonDisabledBorderColor,
                ));
          }
          return RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
        },
      ),
      fixedSize: MaterialStateProperty.all<Size>(Constants.appBarButtonSize),
      splashFactory: NoSplash.splashFactory,
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Constants.buttonDisabledColor;
          }
          if (states.contains(MaterialState.pressed)) {
            return Constants.accentSecondaryColor;
          }
          return Constants.accentPrimaryColor; // Use the component's default.
        },
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    ),
  ),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.raleway(
      textStyle: TextStyle(
        color: Constants.textPrimaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 19.sp / 16.sp,
        letterSpacing: 0,
      ),
    ),
    bodyMedium: GoogleFonts.raleway(
      textStyle: TextStyle(
        color: Constants.textPrimaryColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 20.sp / 14.sp,
        letterSpacing: 0,
      ),
    ),
  ),

);
