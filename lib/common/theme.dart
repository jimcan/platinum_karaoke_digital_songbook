import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  accentColor: Colors.lightGreenAccent,
  // primaryColor: Colors.white24,
  brightness: Brightness.light,
  // backgroundColor: Colors.blue,
  textTheme: TextTheme(
    subtitle1: TextStyle(
      fontFamily: 'Allan',
      color: Colors.grey,
      fontSize: 18,
    ),
    subtitle2: TextStyle(
      fontFamily: 'Allan',
      color: Colors.grey,
      fontSize: 20,
    ),
    bodyText2: TextStyle(
      color: Color(0xff11ff00),
      fontFamily: 'Allan',
      fontSize: 24,
    ),
    bodyText1: TextStyle(
      color: Colors.yellow,
      fontFamily: 'Quicksand',
      fontSize: 26,
      fontWeight: FontWeight.w700,
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: Color(0xff6622aa),
    textStyle: TextStyle(
      fontFamily: 'Allan',
      fontSize: 20,
      color: Color(0xff11ff00),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: Color.fromARGB(230, 10, 10, 60),
    brightness: Brightness.dark,
    elevation: 0,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 26,
        fontWeight: FontWeight.w900,
      ),
      headline5: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    unselectedLabelStyle: TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 16,
    ),
    labelStyle: TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Color(0xff6622aa),
    titleTextStyle: TextStyle(
      color: Color(0xff11ff00),
      fontFamily: 'Allan',
      fontSize: 24,
    ),
    contentTextStyle: TextStyle(
      color: Colors.white70,
      fontFamily: 'Allan',
      fontSize: 20,
    ),
  ),
);
