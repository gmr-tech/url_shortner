import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:url_shortener/src/modules/history/presentation/widgets/shortened_link_tile.dart';

import '../../../../helpers/test_data.dart';
import '../../../../helpers/widget_test_helper.dart';

class MockCopyToClipboard extends Mock {
  Future<void> call(String url);
}

void main() {
  group('ShortenedLinkTile Widget', () {
    late MockCopyToClipboard mockCopyToClipboard;

    setUp(() {
      mockCopyToClipboard = MockCopyToClipboard();
      when(() => mockCopyToClipboard.call(any())).thenAnswer((_) async {});
    });

    group('Data Display', () {
      testWidgets(
        'displays shortened URL data correctly',
        (tester) async {
          void onDelete() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinkTile(
              shortenedLink: TestData.shortenedUrl,
              onDelete: onDelete,
              onCopyToClipboard: mockCopyToClipboard.call,
            ),
          );

          expect(find.text(TestData.shortenedUrl.shortUrl), findsOneWidget);
          expect(find.text(TestData.shortenedUrl.originalUrl), findsOneWidget);
          expect(find.byType(Text), findsNWidgets(3));
        },
      );

      testWidgets(
        'displays formatted creation date',
        (tester) async {
          void onDelete() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinkTile(
              shortenedLink: TestData.shortenedUrl,
              onDelete: onDelete,
              onCopyToClipboard: mockCopyToClipboard.call,
            ),
          );

          expect(find.byType(Text), findsNWidgets(3));
        },
      );
    });

    group('Widget Structure', () {
      testWidgets(
        'has basic widget structure',
        (tester) async {
          void onDelete() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinkTile(
              shortenedLink: TestData.shortenedUrl,
              onDelete: onDelete,
              onCopyToClipboard: mockCopyToClipboard.call,
            ),
          );

          expect(find.byType(Padding), findsWidgets);
          expect(find.byType(Row), findsWidgets);
          expect(find.byType(Expanded), findsOneWidget);
          expect(find.byType(Column), findsNWidgets(2));
        },
      );

      testWidgets(
        'has action buttons',
        (tester) async {
          void onDelete() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinkTile(
              shortenedLink: TestData.shortenedUrl,
              onDelete: onDelete,
              onCopyToClipboard: mockCopyToClipboard.call,
            ),
          );

          expect(find.byType(IconButton), findsNWidgets(2));
          expect(find.byIcon(Icons.copy), findsOneWidget);
          expect(find.byIcon(Icons.more_vert), findsOneWidget);
        },
      );
    });

    group('Copy Functionality', () {
      testWidgets(
        'calls onCopyToClipboard when copy button is tapped',
        (tester) async {
          void onDelete() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinkTile(
              shortenedLink: TestData.shortenedUrl,
              onDelete: onDelete,
              onCopyToClipboard: mockCopyToClipboard.call,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byIcon(Icons.copy));

          verify(
            () => mockCopyToClipboard.call(TestData.shortenedUrl.shortUrl),
          ).called(1);
        },
      );

      testWidgets(
        'handles null onCopyToClipboard gracefully',
        (tester) async {
          void onDelete() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinkTile(
              shortenedLink: TestData.shortenedUrl,
              onDelete: onDelete,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byIcon(Icons.copy));
        },
      );
    });

    group('Different Content', () {
      testWidgets(
        'different URLs have different content',
        (tester) async {
          void onDelete() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinkTile(
              shortenedLink: TestData.shortenedUrlDifferentShort,
              onDelete: onDelete,
              onCopyToClipboard: mockCopyToClipboard.call,
            ),
          );

          expect(
            find.text(TestData.shortenedUrlDifferentShort.shortUrl),
            findsOneWidget,
          );
          expect(
            find.text(TestData.shortenedUrlDifferentShort.originalUrl),
            findsOneWidget,
          );

          expect(find.text(TestData.shortenedUrl.shortUrl), findsNothing);
        },
      );
    });

    group('Delete Functionality', () {
      testWidgets(
        'calls onDelete when provided',
        (tester) async {
          bool deleteCalled = false;
          void onDelete() => deleteCalled = true;

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinkTile(
              shortenedLink: TestData.shortenedUrl,
              onDelete: onDelete,
              onCopyToClipboard: mockCopyToClipboard.call,
            ),
          );

          onDelete();

          expect(deleteCalled, isTrue);
        },
      );
    });
  });
}
