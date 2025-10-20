import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../bloc/shortener_bloc.dart';

/// A custom styled button to send the URL to be shortened.
///
/// It uses custom [InkWell] inside a [Material] widget to provide a custom:
///
///   - Enabled design
///   - Disabled design
///   - Icon balancing with padding

class ShortenUrlButton extends StatelessWidget {
  const ShortenUrlButton({
    required this.onPressed,
    required this.state,
    super.key,
  });

  final Function() onPressed;
  final ShortenerState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DSSize.iconSizeXLarge,
      width: DSSize.iconSizeXLarge + DSSpace.xSmall * 2,
      child: Material(
        shape: const StadiumBorder(),
        color: state is ShortenerHasInput
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.surfaceContainerHigh,
        child: InkWell(
          borderRadius: const BorderRadius.all(DSProperty.radiusXXLarge),
          onTap: (state is ShortenerHasInput) ? onPressed : null,
          child: Transform.translate(
            // HACK: Move the icon a bit to "balance" the padding visually
            offset: const Offset(DSSpace.xxSmall, 0),
            child: Icon(
              Icons.send_rounded,
              color: state is ShortenerHasInput
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).disabledColor,
            ),
          ),
        ),
      ),
    );
  }
}
