import 'package:flutter/material.dart';

import 'app.dart';
import 'src/common/infrastructure/injection.dart';

void main() async {
  await Future.wait([
    Future.delayed(const Duration(seconds: 1)),
    _initDependencies(),
  ]);
  runApp(const App());
}

Future<void> _initDependencies() async {
  await configureInjection();
}
