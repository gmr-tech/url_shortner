import 'package:flutter/material.dart';

import '../../../design_system_export.dart';

part 'ds_divider_size.dart';

class DSDivider extends StatelessWidget {
  const DSDivider({super.key})
    : _height = DSSpace.xLarge,
      _indent = 0,
      _endIndent = 0;

  const DSDivider.double({super.key})
    : _height = DSSpace.xxLarge,
      _indent = 0,
      _endIndent = 0;

  const DSDivider.indented({super.key})
    : _height = DSSpace.xLarge,
      _indent = DSSpace.medium,
      _endIndent = DSSpace.medium;

  const DSDivider.shrinkWrapped({super.key})
    : _height = DSSize.borderThickness,
      _indent = 0,
      _endIndent = 0;

  const DSDivider.shrinkWrapedIndented({super.key})
    : _height = DSSize.dividerThickness,
      _indent = DSSpace.medium,
      _endIndent = DSSpace.medium;

  DSDivider.custom({
    required DSDividerSize height,
    DSDividerIndent indent = DSDividerIndent.zero,
    DSDividerIndent endIndent = DSDividerIndent.zero,
    super.key,
  }) : _height = height.size,
       _indent = indent.size,
       _endIndent = endIndent.size;

  final double _height;
  final double _indent;
  final double _endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: _height,
      indent: _indent,
      endIndent: _endIndent,
    );
  }
}
