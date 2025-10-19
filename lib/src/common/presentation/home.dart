import 'package:flutter/material.dart';

import '../../modules/history/presentation/widgets/shortened_links_list.dart';
import '../../modules/shortener/presentation/widgets/send_input_button.dart';
import '../../modules/shortener/presentation/widgets/url_input_field.dart';
import '../domain/shortened_link.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
          title: const Text('URL Shortener App'),
          elevation: 2,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  spacing: 8,
                  children: [
                    const Expanded(child: UrlInputField()),
                    SendLinkToShortenerButton(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ShortenedLinksList(
                shortenedLinks: List.generate(
                  20,
                  (index) => ShortenedLink(
                    aliasId: index,
                    originalUrl: 'https://example.com/original/$index',
                    shortUrl: 'https://short.ly/$index',
                    createdAt: DateTime.now().subtract(
                      Duration(hours: index),
                    ),
                  ),
                ).toSet(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
