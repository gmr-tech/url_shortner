part of 'ds_divider.dart';

enum DSDividerSize {
  thickness,
  medium,
  large;

  double get size => switch (this) {
    DSDividerSize.thickness => DSSize.borderThickness,
    DSDividerSize.medium => DSSpace.medium,
    DSDividerSize.large => DSSpace.large,
  };
}

enum DSDividerIndent {
  zero,
  medium;

  double get size => switch (this) {
    DSDividerIndent.zero => 0,
    DSDividerIndent.medium => DSSpace.medium,
  };
}
