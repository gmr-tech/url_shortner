import 'package:flutter/material.dart';

class UrlInputField extends StatelessWidget {
  const UrlInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter URL to shorten',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: const Icon(Icons.link),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48 / 2),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48 / 2),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48 / 2),
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
