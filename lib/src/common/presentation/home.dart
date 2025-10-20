import 'package:flutter/material.dart';

import 'ui_strings.dart';

class Home extends StatelessWidget {
  const Home({
    required this.child,
    super.key,
  });

  final Widget child;

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
        body: child,
      ),
    );
  }
}
