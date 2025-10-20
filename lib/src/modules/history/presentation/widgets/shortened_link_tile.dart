import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/shortened_url.dart';

import '../../../../common/presentation/ui_strings.dart';
import '../../../../utils/date_time_extensions.dart';

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
    required this.onDelete,
    this.copyToClipboard,
    this.onCopySuccess,
    super.key,
  });

  final ShortenedUrl shortenedLink;
  final Function() onDelete;
  final Future<void> Function(String)? copyToClipboard;
  final void Function()? onCopySuccess;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCopy(context, shortenedLink.shortUrl),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          DSSpace.medium,
          0,
          DSSpace.small,
          DSSpace.small,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DSBoxSpace.small(),
                  Text(
                    shortenedLink.shortUrl,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const DSBoxSpace.small(),
                  Text(
                    shortenedLink.originalUrl,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const DSBoxSpace.xSmall(),
                  Text(
                    shortenedLink.createdAt.toUserFriendlyString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () => onCopy(context, shortenedLink.shortUrl),
                  icon: Icon(
                    Icons.copy,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).disabledColor,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'copy short',
                      padding: const EdgeInsets.symmetric(
                        horizontal: DSSpace.medium,
                        vertical: DSSpace.small,
                      ),
                      child: const Row(
                        spacing: DSSpace.small,
                        children: [
                          Icon(Icons.copy),
                          Text(UIStrings.copyShortUrl),
                        ],
                      ),
                      onTap: () => onCopy(context, shortenedLink.shortUrl),
                    ),
                    PopupMenuItem(
                      value: 'copy original',
                      padding: const EdgeInsets.symmetric(
                        horizontal: DSSpace.medium,
                        vertical: DSSpace.small,
                      ),
                      child: const Row(
                        spacing: DSSpace.small,
                        children: [
                          Icon(Icons.copy_rounded),
                          Text(UIStrings.copyOriginalUrl),
                        ],
                      ),
                      onTap: () => onCopy(context, shortenedLink.originalUrl),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      padding: const EdgeInsets.symmetric(
                        horizontal: DSSpace.medium,
                        vertical: DSSpace.small,
                      ),
                      onTap: onDelete,
                      child: const Row(
                        spacing: DSSpace.small,
                        children: [
                          Icon(Icons.delete),
                          Text(UIStrings.deleteFromHistory),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onCopy(BuildContext context, String url) async {
    await copyToClipboard?.call(url);
    onCopySuccess?.call();
  }
}
