import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color purple = Color.fromARGB(255, 148, 156, 240);
  static const Color lightPink = Color.fromARGB(255, 207, 135, 248);
  static const Color amber = Color.fromARGB(255, 210, 165, 3);
  static const Color inactiveBlue = Color.fromARGB(255, 116, 170, 214);

  static const TextTheme textTheme = TextTheme(
      headline1: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0),
      headline2: TextStyle(
          fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 1.2), //
      headline3: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.2), //
      headline4: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0), //
      headline5: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0), //
      headline6: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.2), //
      subtitle1: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: -0.2), //
      subtitle2: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0), //
      bodyText1: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5), //
      bodyText2: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0), //
      caption: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0), //
      overline: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5));
}
