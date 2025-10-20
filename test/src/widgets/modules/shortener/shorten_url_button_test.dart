import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_shortener/src/common/domain/failure.dart';
import 'package:url_shortener/src/modules/shortener/bloc/shortener_bloc.dart';
import 'package:url_shortener/src/modules/shortener/presentation/widgets/shorten_url_button.dart';

import '../../../../helpers/test_data.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('ShortenUrlButton Widget', () {
    group('Initial State', () {
      testWidgets(
        'renders correctly with initial state',
        (tester) async {
          const state = ShortenerState.initial();
          void onPressed() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          expect(find.byType(ShortenUrlButton), findsOneWidget);
          expect(find.byIcon(Icons.send_rounded), findsOneWidget);
          expect(find.byType(InkWell), findsOneWidget);

          expect(find.byType(Material), findsWidgets);
        },
      );

      testWidgets(
        'is disabled when state is initial',
        (tester) async {
          const state = ShortenerState.initial();
          bool buttonPressed = false;
          void onPressed() => buttonPressed = true;

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byType(InkWell));

          expect(buttonPressed, isFalse);
        },
      );

      testWidgets(
        'has correct styling when disabled (initial state)',
        (tester) async {
          const state = ShortenerState.initial();
          void onPressed() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          final inkWell = tester.widget<InkWell>(find.byType(InkWell));
          expect(inkWell.onTap, isNull);
        },
      );
    });

    group('Has Input State', () {
      testWidgets(
        'is enabled when state has input',
        (tester) async {
          const state = ShortenerState.hasInput(
            inputUrl: TestData.validInputUrl,
          );
          bool buttonPressed = false;
          void onPressed() => buttonPressed = true;

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byType(InkWell));

          expect(buttonPressed, isTrue);
        },
      );

      testWidgets(
        'has correct styling when enabled (has input state)',
        (tester) async {
          const state = ShortenerState.hasInput(
            inputUrl: TestData.validInputUrl,
          );
          void onPressed() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          final inkWell = tester.widget<InkWell>(find.byType(InkWell));
          expect(inkWell.onTap, isNotNull);
        },
      );
    });

    group('Loading State', () {
      testWidgets(
        'is disabled when state is loading',
        (tester) async {
          const state = ShortenerState.loading();
          bool buttonPressed = false;
          void onPressed() => buttonPressed = true;

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byType(InkWell));

          expect(buttonPressed, isFalse);
        },
      );

      testWidgets(
        'has correct styling when disabled (loading state)',
        (tester) async {
          const state = ShortenerState.loading();
          void onPressed() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          final inkWell = tester.widget<InkWell>(find.byType(InkWell));
          expect(inkWell.onTap, isNull);
        },
      );
    });

    group('Success State', () {
      testWidgets(
        'is disabled when state is success',
        (tester) async {
          final state = ShortenerState.success(
            shortenedUrl: TestData.shortenedUrl,
          );
          bool buttonPressed = false;
          void onPressed() => buttonPressed = true;

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byType(InkWell));

          expect(buttonPressed, isFalse);
        },
      );

      testWidgets(
        'has correct styling when disabled (success state)',
        (tester) async {
          final state = ShortenerState.success(
            shortenedUrl: TestData.shortenedUrl,
          );
          void onPressed() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          final inkWell = tester.widget<InkWell>(find.byType(InkWell));
          expect(inkWell.onTap, isNull);
        },
      );
    });

    group('Failure State', () {
      testWidgets(
        'is disabled when state is failure',
        (tester) async {
          const state = ShortenerState.failure(
            failure: Failure.unexpected(),
          );
          bool buttonPressed = false;
          void onPressed() => buttonPressed = true;

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byType(InkWell));

          expect(buttonPressed, isFalse);
        },
      );

      testWidgets(
        'has correct styling when disabled (failure state)',
        (tester) async {
          const state = ShortenerState.failure(
            failure: Failure.unexpected(),
          );
          void onPressed() {}

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          final inkWell = tester.widget<InkWell>(find.byType(InkWell));
          expect(inkWell.onTap, isNull);
        },
      );
    });

    group('Callback Behavior', () {
      testWidgets(
        'calls onPressed when tapped and enabled',
        (tester) async {
          const state = ShortenerState.hasInput(
            inputUrl: TestData.validInputUrl,
          );
          int callCount = 0;
          void onPressed() => callCount++;

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byType(InkWell));
          await WidgetTestHelper.tap(tester, find.byType(InkWell));

          expect(callCount, equals(2));
        },
      );

      testWidgets(
        'does not call onPressed when tapped and disabled',
        (tester) async {
          const state = ShortenerState.initial();
          int callCount = 0;
          void onPressed() => callCount++;

          await WidgetTestHelper.pumpWidget(
            tester,
            ShortenUrlButton(
              state: state,
              onPressed: onPressed,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byType(InkWell));
          await WidgetTestHelper.tap(tester, find.byType(InkWell));

          expect(callCount, equals(0));
        },
      );
    });
  });
}
