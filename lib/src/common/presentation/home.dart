import 'package:design_system/design_system_export.dart';
import 'package:flutter/material.dart';

import '../../modules/history/presentation/widgets/shortened_links_list.dart';
import '../../modules/shortener/presentation/widgets/shorten_url_button.dart';
import '../../modules/shortener/presentation/widgets/url_input_field.dart';
import '../domain/shortened_url.dart';

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
                padding: const EdgeInsets.all(DSSpace.medium),
                child: Row(
                  spacing: DSSpace.small,
                  children: [
                    const Expanded(child: UrlInputField()),
                    ShortenUrlButton(
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
                  (index) => ShortenedUrl(
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
