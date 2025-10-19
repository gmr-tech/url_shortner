import 'package:flutter/material.dart';

class DSColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF111214);

  static const int _blueStdValue = 0xFF236BD7;
  static const MaterialColor blue = MaterialColor(
    _blueStdValue,
    <int, Color>{
      300: Color(0xFF8FBFF8),
      500: Color(_blueStdValue),
      700: Color(0xFF0B3C82),
    },
  );

  static const int _greenStdValue = 0xFF65FF87;
  static const MaterialColor green = MaterialColor(
    _greenStdValue,
    <int, Color>{
      300: Color(0xFFB2FFC3),
      500: Color(_greenStdValue),
      700: Color(0xFF208108),
    },
  );

  static const int _redStdValue = 0xFFF20D0D;
  static const MaterialColor red = MaterialColor(
    _redStdValue,
    <int, Color>{
      300: Color(0xFFF76E6E),
      500: Color(_redStdValue),
      700: Color(0xFF910808),
    },
  );
}
