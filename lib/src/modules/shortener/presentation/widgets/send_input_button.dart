import 'package:flutter/material.dart';

class SendLinkToShortenerButton extends StatelessWidget {
  const SendLinkToShortenerButton({
    this.onPressed,
    super.key,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48 + 8,
      child: Material(
        shape: const StadiumBorder(),
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          borderRadius: BorderRadius.circular(56 / 2),
          onTap: onPressed,
          child: Transform.translate(
            offset: const Offset(2, 0),
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
