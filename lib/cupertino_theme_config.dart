part of 'main.dart';

CupertinoThemeData _cupertinoThemeConfig = CupertinoThemeData(
  applyThemeToAll: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF9F9F9),
  barBackgroundColor: const Color(0xFFF9F9F9),
  textTheme: CupertinoTextThemeData(
    textStyle: GoogleFonts.raleway(
      textStyle: TextStyle(
        color: Color(0xFF211814),
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 20.sp / 14.sp,
        letterSpacing: 0,
      ),
    ),
    navTitleTextStyle: GoogleFonts.raleway(
      textStyle: TextStyle(
        inherit: false,
        color: Color(0xFF211814),
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 19.sp / 16.sp,
        letterSpacing: 0,
      ),
    ),
  ),
);