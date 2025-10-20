import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../bloc/shortener_bloc.dart';

class InputFieldSuffixIcon extends StatelessWidget {
  const InputFieldSuffixIcon({
    required this.state,
    this.onClear,
    super.key,
  });

  final Function()? onClear;
  final ShortenerState state;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      ShortenerHasInput() || ShortenerSuccess() => IconButton(
        onPressed: onClear,
        icon: const Icon(Icons.clear),
      ),
      ShortenerLoading() => const Padding(
        padding: EdgeInsets.all(DSSpace.small),
        child: SizedBox(
          width: DSSize.iconSize,
          height: DSSize.iconSize,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: DSSize.borderThicknessSmall,
          ),
        ),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}
