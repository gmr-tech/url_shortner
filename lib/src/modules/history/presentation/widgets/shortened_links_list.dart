import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/shortened_url.dart';
import '../../../../common/presentation/ui_strings.dart';
import 'empty_history.dart';
import 'shortened_link_tile.dart';

class ShortenedLinksList extends StatelessWidget {
  const ShortenedLinksList({
    required this.links,
    super.key,
  });

  final List<ShortenedUrl> links;

  @override
  Widget build(BuildContext context) {
    if (links.isEmpty) {
      return const EmptyHistory();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: DSSpace.small,
      children: [
        Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DSSpace.medium,
            ),
            child: Text(
              UIStrings.recentlyShortenedUrls,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: links.length,
            itemBuilder: (context, index) => ShortenedLinkTile(
              shortenedLink: links[index],
            ),
            separatorBuilder: (context, index) => const Divider(
              height: DSSize.borderThicknessSmall,
              thickness: DSSize.borderThicknessSmall,
              indent: DSSpace.medium,
              endIndent: DSSpace.medium,
            ),
          ),
        ),
      ],
    );
  }
}
