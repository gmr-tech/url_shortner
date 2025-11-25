import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/shortened_url.dart';
import 'empty_history.dart';
import 'shortened_link_tile.dart';

class ShortenedLinksList extends StatelessWidget {
  const ShortenedLinksList({
    required this.links,
    required this.onItemDelete,
    this.onCopyToClipboard,
    super.key,
  });

  final List<ShortenedUrl> links;
  final Function(ShortenedUrl) onItemDelete;
  final Future<void> Function(String)? onCopyToClipboard;

  @override
  Widget build(BuildContext context) {
    if (links.isEmpty) {
      return const EmptyHistory();
    }

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        DSSpace.medium,
        DSSpace.medium,
        DSSpace.medium,
        MediaQuery.paddingOf(context).bottom + DSSpace.medium,
      ),
      itemCount: links.length,
      itemBuilder: (context, index) => ShortenedLinkTile(
        shortenedLink: links[index],
        onDelete: () => onItemDelete(links[index]),
        onCopyToClipboard: onCopyToClipboard,
      ),
      separatorBuilder: (context, index) => const Divider(
        height: DSSize.borderThicknessSmall,
        thickness: DSSize.borderThicknessSmall,
        indent: DSSpace.medium,
        endIndent: DSSpace.medium,
      ),
    );
  }
}
