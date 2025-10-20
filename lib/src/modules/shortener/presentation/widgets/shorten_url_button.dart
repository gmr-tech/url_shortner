import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

/// A custom styled button to send the URL to be shortened.
///
/// It uses custom [InkWell] inside a [Material] widget to provide a custom:
///
///   - Enabled design
///   - Disabled design
///   - Icon balancing with padding

class ShortenUrlButton extends StatelessWidget {
  const ShortenUrlButton({
    this.onPressed,
    super.key,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DSSize.iconSizeXLarge,
      width: DSSize.iconSizeXLarge + DSSpace.xSmall * 2,
      child: Material(
        shape: const StadiumBorder(),
        color: onPressed != null
            ? Theme.of(context).primaryColor
            : Theme.of(context).disabledColor,
        child: InkWell(
          borderRadius: const BorderRadius.all(DSProperty.radiusXXLarge),
          onTap: onPressed,
          child: Transform.translate(
            // HACK: Move the icon a bit to "balance" the padding visually
            offset: const Offset(DSSpace.xxSmall, 0),
            child: Icon(
              Icons.send_rounded,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
            ),
          ),
        ),
      ),
    );
  }
}
