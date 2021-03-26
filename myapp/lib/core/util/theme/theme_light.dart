import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  LightTheme._();

  static final theme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.red[900],
    accentColor: Colors.red,
    brightness: Brightness.light,
    textTheme: GoogleFonts.geoTextTheme().copyWith(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 96,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 60,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 48,
        letterSpacing: 0.0,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 34,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        letterSpacing: 0.0,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 1.25,
      ),
      caption: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        letterSpacing: 1.5,
      ),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Colors.red[900],
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      brightness: Brightness.dark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.red[900],
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: Colors.red[900],
    ),
    switchTheme: SwitchThemeData(
      overlayColor:
          MaterialStateProperty.resolveWith((states) => Colors.red[900]),
      thumbColor:
          MaterialStateProperty.resolveWith((states) => Colors.red[900]),
      trackColor: MaterialStateProperty.resolveWith((states) => Colors.red),
    ),
  );
}
