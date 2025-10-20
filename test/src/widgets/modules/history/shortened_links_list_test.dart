import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_shortener/src/common/presentation/ui_strings.dart';
import 'package:url_shortener/src/modules/history/presentation/widgets/empty_history.dart';
import 'package:url_shortener/src/modules/history/presentation/widgets/shortened_link_tile.dart';
import 'package:url_shortener/src/modules/history/presentation/widgets/shortened_links_list.dart';

import '../../../../helpers/test_data.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('ShortenedLinksList Widget', () {
    group('Empty State', () {
      testWidgets(
        'shows EmptyHistory when links list is empty',
        (tester) async {
          // Arrange
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: const [],
              onItemDelete: (_) {},
            ),
          );

          // Assert
          expect(find.byType(EmptyHistory), findsOneWidget);
          expect(find.byType(ListView), findsNothing);
          expect(find.text(UIStrings.recentlyShortenedUrls), findsNothing);
        },
      );
    });

    group('Non-Empty State', () {
      testWidgets(
        'shows title and ListView when links list is not empty',
        (tester) async {
          // Arrange
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [TestData.shortenedUrl],
              onItemDelete: (_) {},
            ),
          );

          // Assert
          expect(find.byType(EmptyHistory), findsNothing);
          expect(find.text(UIStrings.recentlyShortenedUrls), findsOneWidget);
          expect(find.byType(ListView), findsOneWidget);
        },
      );

      testWidgets(
        'displays correct number of ShortenedLinkTile items',
        (tester) async {
          // Arrange
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: TestData.historyUrlList,
              onItemDelete: (_) {},
            ),
          );

          // Assert
          expect(find.byType(ShortenedLinkTile), findsNWidgets(3));
        },
      );

      testWidgets(
        'displays separators between items',
        (tester) async {
          // Arrange
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [
                TestData.shortenedUrl,
                TestData.shortenedUrlDifferentTime,
              ],
              onItemDelete: (_) {},
            ),
          );

          // Assert
          expect(find.byType(Divider), findsOneWidget); // n-1 separators
        },
      );
    });

    group('Widget Presence', () {
      testWidgets(
        'contains required widget types',
        (tester) async {
          // Arrange
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [TestData.shortenedUrl],
              onItemDelete: (_) {},
            ),
          );

          // Assert
          expect(find.byType(Material), findsWidgets);
          expect(find.byType(ListView), findsOneWidget);
        },
      );

      testWidgets(
        'title text is displayed correctly',
        (tester) async {
          // Arrange
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [TestData.shortenedUrl],
              onItemDelete: (_) {},
            ),
          );

          // Assert
          final titleWidget = tester.widget<Text>(
            find.text(UIStrings.recentlyShortenedUrls),
          );
          expect(titleWidget.data, equals(UIStrings.recentlyShortenedUrls));
        },
      );
    });

    group('Callback Functions', () {
      testWidgets(
        'accepts onItemDelete callback',
        (tester) async {
          // Arrange
          void onDelete(item) {}

          // Act
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [TestData.shortenedUrl],
              onItemDelete: onDelete,
            ),
          );

          // Assert - widget should render without issues
          expect(find.byType(ShortenedLinkTile), findsOneWidget);
        },
      );

      testWidgets(
        'accepts optional onCopyToClipboard callback',
        (tester) async {
          // Arrange
          Future<void> onCopyToClipboard(String text) async {}

          // Act
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [TestData.shortenedUrl],
              onItemDelete: (_) {},
              onCopyToClipboard: onCopyToClipboard,
            ),
          );

          // Assert - widget should render without issues
          expect(find.byType(ShortenedLinkTile), findsOneWidget);
        },
      );

      testWidgets(
        'works without onCopyToClipboard callback',
        (tester) async {
          // Arrange & Act
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [TestData.shortenedUrl],
              onItemDelete: (_) {},
              // onCopyToClipboard not provided
            ),
          );

          // Assert - should not throw
          expect(find.byType(ShortenedLinkTile), findsOneWidget);
        },
      );
    });

    group('List Behavior', () {
      testWidgets(
        'handles single item correctly',
        (tester) async {
          // Arrange
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [TestData.shortenedUrl],
              onItemDelete: (_) {},
            ),
          );

          // Assert
          expect(find.byType(ShortenedLinkTile), findsOneWidget);
          expect(
            find.byType(Divider),
            findsNothing,
          ); // No separators for single item
        },
      );

      testWidgets(
        'handles multiple items correctly',
        (tester) async {
          // Arrange
          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenedLinksList(
              links: [
                TestData.shortenedUrl,
                TestData.shortenedUrlDifferentTime,
                TestData.shortenedUrlDifferentId,
              ],
              onItemDelete: (_) {},
            ),
          );

          // Assert
          expect(find.byType(ShortenedLinkTile), findsNWidgets(3));
          expect(find.byType(Divider), findsNWidgets(2)); // n-1 separators
        },
      );
    });
  });
}
