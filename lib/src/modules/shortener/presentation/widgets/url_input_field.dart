import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/input_url.dart';
import '../../../../common/domain/input_url_validator.dart';
import '../../../../common/presentation/paste_snackbar.dart';
import '../../../../common/presentation/ui_strings.dart';
import '../../bloc/shortener_bloc.dart';

class UrlInputField extends StatefulWidget {
  const UrlInputField({
    required this.state,
    this.onChanged,
    this.onFieldSubmitted,
    this.onClear,
    this.getClipboardText,
    super.key,
  });

  final ShortenerState state;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onClear;
  final Future<String?>? getClipboardText;

  @override
  State<UrlInputField> createState() => _UrlInputFieldState();
}

class _UrlInputFieldState extends State<UrlInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => handleInitialPaste(context),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final suffixIcon = switch (widget.state) {
      ShortenerHasInput() || ShortenerSuccess() => IconButton(
        onPressed: handleClear,
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
      _ => null,
    };

    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: UIStrings.enterUrlHint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(DSProperty.radius),
        ),
        suffixIcon: suffixIcon,
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
      validator: (value) => InputUrl(value ?? '').validate(),
    );
  }

  void handleClear() {
    _controller.clear();
    widget.onClear?.call();
  }

  void handlePaste() async {
    final text = await widget.getClipboardText ?? '';
    _controller.text = text;
    widget.onChanged?.call(text);
  }

  void handleInitialPaste(BuildContext context) async {
    final text = await widget.getClipboardText ?? '';
    final input = InputUrl(text);
    if (context.mounted && input.isValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        PasteSnackbar(
          context: context,
          onPaste: () {
            _controller.text = input.url;
            widget.onChanged?.call(input.url);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
    }
  }
}
