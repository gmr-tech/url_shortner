import 'package:flutter/material.dart';

import '../../../design_system_export.dart';

/// {@template DSBoxSpace}
/// A class to simplify the usage of:
/// ```dart
/// SizedBox(height: value, width: value)
/// ````
/// with:
/// ```dart
/// DSBoxSpace.dimension()
/// ````
/// {@endtemplate}
class DSBoxSpace extends SizedBox {
  ///{@macro DSBoxSpace}
  const DSBoxSpace({super.key}) : super.square(dimension: DSSpace.medium);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xxxSmall({super.key})
    : super.square(dimension: DSSpace.xxxSmall);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xxSmall({super.key})
    : super.square(dimension: DSSpace.xxSmall);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xSmall({super.key})
    : super.square(dimension: DSSpace.xSmall);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.small({super.key}) : super.square(dimension: DSSpace.small);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.large({super.key}) : super.square(dimension: DSSpace.large);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xLarge({super.key})
    : super.square(dimension: DSSpace.xLarge);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xxLarge({super.key})
    : super.square(dimension: DSSpace.xxLarge);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xxxLarge({super.key})
    : super.square(dimension: DSSpace.xxxLarge);
}
