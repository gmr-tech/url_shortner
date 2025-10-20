import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(DSSpace.xLarge),
        child: Column(
          spacing: DSSpace.medium,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.link_off_rounded,
              size: DSSize.iconSizeXLarge,
            ),
            Text(
              'No shortened URLs yet!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
