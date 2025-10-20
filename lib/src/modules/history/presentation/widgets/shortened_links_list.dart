import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/shortened_url.dart';
import 'shortened_link_tile.dart';

class ShortenedLinksList extends StatelessWidget {
  const ShortenedLinksList({
    required this.shortenedLinks,
    super.key,
  });

  final Set<ShortenedUrl> shortenedLinks;

  @override
  Widget build(BuildContext context) {
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
              'Recently shortened URLs',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: shortenedLinks.length,
            itemBuilder: (context, index) => ShortenedLinkTile(
              shortenedLink: shortenedLinks.elementAt(index),
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
