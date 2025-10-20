import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_shortener/src/common/domain/failure.dart';
import 'package:url_shortener/src/modules/shortener/bloc/shortener_bloc.dart';
import 'package:url_shortener/src/modules/shortener/presentation/widgets/input_field_suffix_icon.dart';

import '../../../../helpers/test_data.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('InputFieldSuffixIcon Widget', () {
    group('Loading State', () {
      testWidgets(
        'shows CircularProgressIndicator when state is Loading',
        (tester) async {
          await WidgetTestHelper.pumpWidget(
            tester,
            const InputFieldSuffixIcon(
              state: ShortenerState.loading(),
            ),
          );

          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          expect(find.byType(IconButton), findsNothing);
        },
      );
    });

    group('HasInput State', () {
      testWidgets(
        'shows clear IconButton when state is HasInput',
        (tester) async {
          await WidgetTestHelper.pumpWidget(
            tester,
            InputFieldSuffixIcon(
              state: const ShortenerState.hasInput(
                inputUrl: TestData.validInputUrl,
              ),
              onClear: () {},
            ),
          );

          expect(find.byType(IconButton), findsOneWidget);
          expect(find.byIcon(Icons.clear), findsOneWidget);
        },
      );

      testWidgets(
        'calls onClear when clear button is tapped',
        (tester) async {
          bool clearCalled = false;
          void onClear() => clearCalled = true;

          await WidgetTestHelper.pumpWidget(
            tester,
            InputFieldSuffixIcon(
              state: const ShortenerState.hasInput(
                inputUrl: TestData.validInputUrl,
              ),
              onClear: onClear,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byIcon(Icons.clear));

          expect(clearCalled, isTrue);
        },
      );
    });

    group('Success State', () {
      testWidgets(
        'shows clear IconButton when state is Success',
        (tester) async {
          await WidgetTestHelper.pumpWidget(
            tester,
            InputFieldSuffixIcon(
              state: ShortenerState.success(
                shortenedUrl: TestData.shortenedUrl,
              ),
              onClear: () {},
            ),
          );

          expect(find.byType(IconButton), findsOneWidget);
          expect(find.byIcon(Icons.clear), findsOneWidget);
        },
      );
    });

    group('Other States', () {
      testWidgets(
        'shows SizedBox.shrink when state is Initial',
        (tester) async {
          await WidgetTestHelper.pumpWidget(
            tester,
            const InputFieldSuffixIcon(
              state: ShortenerState.initial(),
            ),
          );

          expect(find.byType(SizedBox), findsOneWidget);
          expect(find.byType(IconButton), findsNothing);
        },
      );

      testWidgets(
        'shows SizedBox.shrink when state is Failure',
        (tester) async {
          await WidgetTestHelper.pumpWidget(
            tester,
            const InputFieldSuffixIcon(
              state: ShortenerState.failure(
                failure: Failure.unexpected(),
              ),
            ),
          );

          expect(find.byType(SizedBox), findsOneWidget);
          expect(find.byType(IconButton), findsNothing);
        },
      );
    });

    group('Widget Properties', () {
      testWidgets(
        'IconButton has correct properties',
        (tester) async {
          await WidgetTestHelper.pumpWidget(
            tester,
            InputFieldSuffixIcon(
              state: const ShortenerState.hasInput(
                inputUrl: TestData.validInputUrl,
              ),
              onClear: () {},
            ),
          );

          final iconButton = tester.widget<IconButton>(find.byType(IconButton));
          expect(iconButton.icon, isA<Icon>());
          expect(iconButton.onPressed, isNotNull);

          final icon = iconButton.icon as Icon;
          expect(icon.icon, Icons.clear);
        },
      );

      testWidgets(
        'SizedBox.shrink has zero size',
        (tester) async {
          await WidgetTestHelper.pumpWidget(
            tester,
            const InputFieldSuffixIcon(
              state: ShortenerState.initial(),
            ),
          );

          final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
          expect(sizedBox.width, 0.0);
          expect(sizedBox.height, 0.0);
        },
      );
    });
  });
}
