import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/presentation/ui_strings.dart';
import '../../../../common/presentation/utils.dart';
import '../../bloc/history_bloc.dart';
import '../widgets/empty_history.dart';
import '../widgets/shortened_links_list.dart';

class RecentlyShortnedUrlsPage extends StatelessWidget {
  const RecentlyShortnedUrlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(DSSpace.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  bottom: false,
                  child: IconButton.filled(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                Text(
                  UIStrings.recentlyShortenedUrls,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
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
                  onCopyToClipboard: (text) async =>
                      UIUtils.handleCopyToClipboard(
                        context,
                        text,
                      ),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
