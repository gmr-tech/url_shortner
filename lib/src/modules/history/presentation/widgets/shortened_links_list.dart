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
      spacing: 8,
      children: [
        Material(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
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
              height: 1,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
          ),
        ),
      ],
    );
  }
}
