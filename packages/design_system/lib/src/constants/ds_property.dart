import 'package:flutter/material.dart';

/// Wrapper for all the app properties that are not directly theme related.
///
/// Use this class to store properties such as aspect ratios, [Radius],
/// [BoxConstraints], etc.
abstract class DSProperty {
  static const double squareAspectRatio = 1;
  static const double wideAspectRatio = 16 / 9;
  static const double threeQuarterAspectRatio = 4 / 3;

  static const Radius radiusXXSmall = Radius.circular(2);
  static const Radius radiusXSmall = Radius.circular(4);
  static const Radius radiusSmall = Radius.circular(8);
  static const Radius radius = Radius.circular(12);
  static const Radius radiusLarge = Radius.circular(16);
  static const Radius radiusXLarge = Radius.circular(24);
  static const Radius radiusXXLarge = Radius.circular(32);

  static const double n10percent = 0.1;
  static const double n20percent = 0.2;
  static const double n50percent = 0.5;
  static const double n80percent = 0.8;
  static const double n100percent = 1;
}
