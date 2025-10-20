import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/input_url.dart';
import '../../../../common/domain/input_url_validator.dart';
import '../../../../common/presentation/ui_strings.dart';
import '../../bloc/shortener_bloc.dart';

class UrlInputField extends StatelessWidget {
  const UrlInputField({
    required this.state,
    this.onChanged,
    this.onFieldSubmitted,
    super.key,
  });

  final ShortenerState state;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: UIStrings.enterUrlHint,
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
      enabled: state is! ShortenerLoading,
      keyboardType: TextInputType.url,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) => InputUrl(value ?? '').validate(),
    );
  }
}
