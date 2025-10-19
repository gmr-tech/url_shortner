import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/shortened_url.dart';

/// A custom tile of a shortened links with:
///
///   - Short URL
///   - Original URL
///   - Creation date
///
/// It uses a custom [InkWell] and WidgetTree layout because ListTile's
/// default behavior does not allow proper customization of paddings and
/// margins to match the design system specifications.

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
          horizontal: DSSpace.medium,
          vertical: DSSpace.small,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shortenedLink.shortUrl,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const DSBoxSpace.xSmall(),
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
