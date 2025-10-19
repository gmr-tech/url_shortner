import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/common/infrastructure/injection.dart';
import 'src/common/presentation/home.dart';
import 'src/modules/shortener/bloc/shortener_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Shortener',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: BlocProvider(
        create: (context) => getIt<ShortenerBloc>(),
        child: const Home(),
      ),
    );
  }
}
