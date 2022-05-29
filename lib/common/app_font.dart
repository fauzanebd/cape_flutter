import 'package:flutter/material.dart';

class AppFont {
  static const String fontName = "Inter";

  static TextTheme textTheme = TextTheme(
    headline1: title1(),
    headline2: title2(),
    headline3: title3(),
    headlineLarge: titleX(),
    bodyLarge: body2(),
    bodyMedium: body1(),
    bodySmall: body3(),
    subtitle1: small(),
    subtitle2: tiny(),
  );

  static TextStyle title1({fontSize = 32.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle title2({fontSize = 24.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle title3({fontSize = 18.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle titleX({fontSize = 64.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w800,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle body1({fontSize = 16.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle body2({fontSize = 16.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle body3({fontSize = 13.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle small({fontSize = 14.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle tiny({fontSize = 12.0, fontColor = Colors.black}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: fontColor,
    );
  }
}
