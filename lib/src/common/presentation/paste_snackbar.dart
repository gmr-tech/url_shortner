import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';
import 'present_constants.dart';
import 'ui_strings.dart';

class PasteSnackbar extends SnackBar {
  PasteSnackbar({
    required Function() onPaste,
    required BuildContext context,
    super.key,
  }) : super(
         backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
         duration: PresentConstants.snackLongDuration,
         content: Column(
           spacing: DSSpace.small,
           children: [
             Text(
               UIStrings.wantToPasteUrl,
               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                 color: Theme.of(context).colorScheme.onSurface,
               ),
             ),
             Row(
               spacing: DSSpace.medium,
               children: [
                 Expanded(
                   child: OutlinedButton.icon(
                     icon: const Icon(Icons.arrow_downward_rounded),
                     onPressed: () =>
                         ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                     label: const Text(UIStrings.dismiss),
                   ),
                 ),
                 Expanded(
                   child: ElevatedButton.icon(
                     icon: const Icon(Icons.paste),
                     onPressed: onPaste,
                     label: const Text(UIStrings.paste),
                   ),
                 ),
               ],
             ),
             const LinearTimerBar(duration: PresentConstants.snackLongDuration),
           ],
         ),
       );
}
