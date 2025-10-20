import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../../../common/presentation/ui_strings.dart';
import '../../bloc/shortener_bloc.dart';
import 'input_field_suffix_icon.dart';

class UrlInputField extends StatefulWidget {
  const UrlInputField({
    required this.state,
    this.onChanged,
    this.onFieldSubmitted,
    this.onClear,
    this.getClipboard,
    this.validateInput,
    this.onPasteFromClipboard,
    super.key,
  });

  final ShortenerState state;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onClear;
  final Future<String?> Function()? getClipboard;
  final String? Function(String?)? validateInput;
  final void Function(
    BuildContext,
    String,
    VoidCallback,
  )?
  onPasteFromClipboard;

  @override
  State<UrlInputField> createState() => _UrlInputFieldState();
}

class _UrlInputFieldState extends State<UrlInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => handleClipboardPaste(context),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: UIStrings.enterUrlHint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(DSProperty.radius),
        ),
        suffixIcon: InputFieldSuffixIcon(
          state: widget.state,
          onClear: handleClear,
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
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(DSProperty.radiusXXLarge),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: DSSize.borderThicknessLarge,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(DSProperty.radiusXXLarge),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.state is! ShortenerLoading,
      keyboardType: TextInputType.url,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validateInput,
    );
  }

  void handleClear() {
    _controller.clear();
    widget.onClear?.call();
  }

  void handlePaste() async {
    final text = await widget.getClipboard?.call() ?? '';
    _controller.text = text;
    widget.onChanged?.call(text);
  }

  void handleClipboardPaste(BuildContext context) async {
    final text = await widget.getClipboard?.call();
    if (context.mounted && text != null) {
      widget.onPasteFromClipboard?.call(
        context,
        text,
        () {
          _controller.text = text;
          widget.onChanged?.call(text);
        },
      );
    }
  }
}
