import 'package:flutter/material.dart';

/// [getOneLineTextSize] is the function that based on a text, style
/// and context can return the size that the text widget is
/// occupying with a maximum of 1 line
Size getOneLineTextSize(String text, TextStyle? style, BuildContext context) {
  return (TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textScaler: MediaQuery.of(context).textScaler,
    textDirection: TextDirection.ltr,
  )..layout()).size;
}
