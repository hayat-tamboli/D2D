import 'package:flutter/material.dart';

ThemeData buildThemeData(BuildContext context) {
  return ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 48),
      headline2: TextStyle(fontSize: 38),
      headline3: TextStyle(fontSize: 28),
      subtitle1: TextStyle(fontSize: 21),
      bodyText1: TextStyle(fontSize: 18),
      bodyText2: TextStyle(fontSize: 16),
      caption: TextStyle(fontSize: 14),
    ),
    primaryColor: Color(0xff0887FC),
    primaryColorLight: Color(0xffC7E4FE),
    accentColor: Color(0xff98E6C6),
    brightness: Brightness.light,
    fontFamily: 'Proxima Nova',
    colorScheme: ColorScheme(
      surface: Colors.white,
      onSurface: Color(0xff070018),
      onSecondary: Colors.white,
      onBackground: Color(0xff070018),
      error: Color(0xffE85B81),
      onError: Color(0xffFDEFF2),
      onPrimary: Colors.white,
      background: Color(0xffFAFCFE),
      brightness: Brightness.light,
      primary: Color(0xff0887FC),
      primaryVariant: Color(0xff4A74A8),
      secondary: Color(0xff66D9AB),
      secondaryVariant: Color(0xffDCF6EC),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: Color(0xffD6D8E7), width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: Color(0x00000000), width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: Color(0xff36C9C9), width: 2),
      ),
      hintStyle: TextStyle(
        color: Color(0xffA0A3BD),
        fontSize: 16,
      ),
      labelStyle: TextStyle(
        color: Color(0xff6E7191),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xffFAFCFE),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 48,
        letterSpacing: 1.5,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Color(0xffFAFCFE),
    popupMenuTheme: PopupMenuThemeData(
      color: Color(0xffEFF0F6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: null,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(color: Color(0xffd6d8e6), width: 2.0)),
    ),
    hoverColor: Color(0xffEFF0F6),
    cardColor: Colors.white,
    errorColor: Color(0xffE85B81),
    dividerColor: Color(0xffd6d8e6),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
