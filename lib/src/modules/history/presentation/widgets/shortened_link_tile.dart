import 'package:flutter/material.dart';

import '../../../../common/domain/shortened_url.dart';

class ShortenedLinkTile extends StatelessWidget {
  const ShortenedLinkTile({
    required this.shortenedLink,
    super.key,
  });

  final ShortenedUrl shortenedLink;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shortenedLink.shortUrl,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              shortenedLink.originalUrl,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              shortenedLink.createdAt.toLocal().toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
