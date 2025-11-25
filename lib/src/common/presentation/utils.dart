import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../infrastructure/injection.dart';
import '../services/clipboard_service.dart';
import 'present_constants.dart';
import 'ui_strings.dart';

// ignore: avoid_classes_with_only_static_members
abstract class UIUtils {
  static void handleCopyToClipboard(BuildContext context, String text) async {
    await getIt<ClipboardService>().setText(text);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(UIStrings.urlCopiedToClipboard),
          duration: PresentConstants.snackBarFastDuration,
          backgroundColor: DSColors.green.shade700,
        ),
      );
    }
  }
}
