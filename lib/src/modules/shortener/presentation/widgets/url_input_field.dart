import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

class UrlInputField extends StatelessWidget {
  const UrlInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter URL to shorten',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(DSProperty.radius),
        ),
        prefixIcon: const Icon(Icons.link),
        contentPadding: const EdgeInsets.symmetric(
          vertical: DSSpace.xSmall,
          horizontal: DSSpace.medium,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(DSProperty.radiusXXLarge),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(DSProperty.radiusXXLarge),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: DSSize.borderThicknessLarge,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(DSProperty.radiusXXLarge),
          borderSide: BorderSide(
            color: Theme.of(context).disabledColor,
          ),
        ),
      ),
      keyboardType: TextInputType.url,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a URL';
        }
        final uri = Uri.tryParse(value);
        if (uri == null || !uri.hasAbsolutePath) {
          return 'Please enter a valid URL';
        }
        return null;
      },
    );
  }
}
