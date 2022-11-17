import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(
    subtitle1: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    bodyText1: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    bodyText2: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
    overline: TextStyle(
        fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
    headline1: TextStyle(
        fontSize: 96, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: TextStyle(
        fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black),
    headline3: TextStyle(
        fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black),
    headline4: TextStyle(
        fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black),
    headline5: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 32, 25, 25)),
    caption: TextStyle(fontSize: 12, color: Colors.white),
    button: TextStyle(fontSize: 14, color: Colors.white),
  ),
  cardColor: lightThemePrimaryColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: lightThemePrimaryColor,
    selectedItemColor: defaultAppColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
  ),
  primarySwatch: primarySwatchColor,
  scaffoldBackgroundColor: lightThemePrimaryColor,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: defaultAppColor,
    ),
    toolbarTextStyle: TextStyle(color: Colors.black),
    foregroundColor: defaultAppColor,
    backgroundColor: defaultAppColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: defaultAppColor,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    headline1: TextStyle(
        fontSize: 96,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    headline2: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    headline3: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    headline4: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: lightThemePrimaryColor),
    caption: TextStyle(fontSize: 12, color: lightThemePrimaryColor),
    button: TextStyle(fontSize: 14, color: lightThemePrimaryColor),
  ),
  cardColor: darkThemeSecondColor,
  scaffoldBackgroundColor: darkThemeSecondColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkThemeSecondColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
  ),
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    elevation: 0,
    foregroundColor: darkThemeSecondColor,
    toolbarTextStyle: TextStyle(
      color: darkThemeSecondColor,
    ),
    titleTextStyle: const TextStyle(
      color: lightThemePrimaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(color: lightThemePrimaryColor),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkThemeSecondColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: darkThemeSecondColor,
  ),
);
