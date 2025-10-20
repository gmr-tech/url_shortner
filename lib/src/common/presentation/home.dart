import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/history/bloc/history_bloc.dart';
import '../../modules/history/presentation/widgets/empty_history.dart';
import '../../modules/history/presentation/widgets/shortened_links_list.dart';
import '../../modules/shortener/bloc/shortener_bloc.dart';
import '../../modules/shortener/presentation/widgets/shorten_url_button.dart';
import '../../modules/shortener/presentation/widgets/url_input_field.dart';
import '../domain/input_url.dart';
import '../domain/input_url_validator.dart';
import 'present_constants.dart';
import 'ui_strings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
          title: const Text(UIStrings.appTitle),
          elevation: 2,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 48 + DSSpace.medium * 2 + DSSpace.small + 12,
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.all(DSSpace.medium),
                  child: BlocConsumer<ShortenerBloc, ShortenerState>(
                    listener: handleShortenerListener,
                    builder: (context, state) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: DSSpace.small,
                      children: [
                        Expanded(
                          child: UrlInputField(
                            state: state,
                            onChanged: (value) => onChanged(context, value),
                            onFieldSubmitted: (value) => onFieldSubmitted(
                              context,
                              state,
                            ),
                          ),
                        ),
                        ShortenUrlButton(
                          onPressed: state is ShortenerHasInput
                              ? () => onFieldSubmitted(
                                  context,
                                  state,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) => switch (state) {
                  HistoryInitial _ => const Center(
                    child: EmptyHistory(),
                  ),
                  final HistoryUpdated updated => ShortenedLinksList(
                    links: updated.shortenedUrls,
                    onItemDelete: (link) => context.read<HistoryBloc>().add(
                      HistoryEvent.remove(link),
                    ),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onChanged(BuildContext context, String value) {
    final input = InputUrl(value);
    if (input.isValid()) {
      context.read<ShortenerBloc>().add(
        ShortenerEvent.addInput(inputUrl: input),
      );
    } else {
      context.read<ShortenerBloc>().add(
        const ShortenerEvent.reset(),
      );
    }
  }

  void onFieldSubmitted(BuildContext context, ShortenerState state) {
    final InputUrl? input = state is ShortenerHasInput ? state.inputUrl : null;
    if (input?.isValid() ?? false) {
      context.read<ShortenerBloc>().add(
        const ShortenerEvent.shorten(),
      );
    } else {
      FocusScope.of(context).unfocus();
    }
  }

  Future<void> handleShortenerListener(
    BuildContext context,
    ShortenerState state,
  ) async {
    switch (state) {
      case final ShortenerFailure _:
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: DSColors.red.shade700,
              content: const Text(UIStrings.failureMessage),
            ),
          );
        }
        await Future.delayed(PresentConstants.resetDuration);
        if (context.mounted) {
          context.read<ShortenerBloc>().add(const ShortenerEvent.reset());
        }
        break;
      case final ShortenerSuccess success:
        context.read<HistoryBloc>().add(
          HistoryEvent.add(state.shortenedUrl),
        );
        await Clipboard.setData(
          ClipboardData(text: success.shortenedUrl.shortUrl),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: DSColors.green.shade700,
              content: Text(
                '${UIStrings.successMessage}\n${state.shortenedUrl.shortUrl}',
              ),
            ),
          );
        }
        break;
      default:
        break;
    }
  }
}
