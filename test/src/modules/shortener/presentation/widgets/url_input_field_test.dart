import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:url_shortener/src/common/domain/failure.dart';
import 'package:url_shortener/src/modules/shortener/bloc/shortener_bloc.dart';
import 'package:url_shortener/src/modules/shortener/presentation/widgets/url_input_field.dart';

import '../../../../../helpers/test_data.dart';
import '../../../../../helpers/widget_test_helper.dart';

class MockClipboardService extends Mock {
  Future<String?> call();
}

void main() {
  group('UrlInputField Widget', () {
    late MockClipboardService mockClipboard;

    setUp(() {
      mockClipboard = MockClipboardService();

      when(() => mockClipboard.call()).thenAnswer((_) async => null);
    });

    group('Initial State', () {
      testWidgets(
        'renders correctly with initial state',
        (tester) async {
          const state = ShortenerState.initial();

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          expect(WidgetTestHelper.textFormField(), findsOneWidget);
          expect(find.byIcon(Icons.link), findsOneWidget);
          expect(find.text('Enter a URL to shorten'), findsOneWidget);
        },
      );

      testWidgets(
        'is enabled when state is initial',
        (tester) async {
          const state = ShortenerState.initial();

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          final textField = tester.widget<TextFormField>(
            WidgetTestHelper.textFormField(),
          );
          expect(textField.enabled, isTrue);
        },
      );
    });

    group('Text Input Behavior', () {
      testWidgets(
        'calls onChanged when text is entered',
        (tester) async {
          const state = ShortenerState.initial();
          String? changedText;
          void onChanged(String text) => changedText = text;

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              onChanged: onChanged,
              getClipboard: mockClipboard.call,
            ),
          );

          await WidgetTestHelper.enterText(
            tester,
            WidgetTestHelper.textFormField(),
            TestData.validInputUrl.url,
          );

          expect(changedText, equals(TestData.validInputUrl.url));
        },
      );

      testWidgets(
        'calls onFieldSubmitted when submitted',
        (tester) async {
          const state = ShortenerState.initial();
          String? submittedText;
          void onFieldSubmitted(String text) => submittedText = text;

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              onFieldSubmitted: onFieldSubmitted,
              getClipboard: mockClipboard.call,
            ),
          );

          await WidgetTestHelper.enterText(
            tester,
            WidgetTestHelper.textFormField(),
            TestData.validInputUrl.url,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pumpAndSettle();

          expect(submittedText, equals(TestData.validInputUrl.url));
        },
      );

      testWidgets(
        'validates input when autovalidate mode is enabled',
        (tester) async {
          const state = ShortenerState.initial();
          String? validator(String? value) {
            if (value == null || value.isEmpty) {
              return 'URL is required';
            }
            return null;
          }

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              validateInput: validator,
              getClipboard: mockClipboard.call,
            ),
          );

          await WidgetTestHelper.enterText(
            tester,
            WidgetTestHelper.textFormField(),
            'some text',
          );

          await WidgetTestHelper.enterText(
            tester,
            WidgetTestHelper.textFormField(),
            '',
          );

          await tester.pump();

          expect(find.text('URL is required'), findsOneWidget);
        },
      );
    });

    group('State-Based Behavior', () {
      testWidgets(
        'is disabled when state is loading',
        (tester) async {
          const state = ShortenerState.loading();

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          final textField = tester.widget<TextFormField>(
            WidgetTestHelper.textFormField(),
          );
          expect(textField.enabled, isFalse);
        },
      );

      testWidgets(
        'is enabled when state has input',
        (tester) async {
          const state = ShortenerState.hasInput(
            inputUrl: TestData.validInputUrl,
          );

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          final textField = tester.widget<TextFormField>(
            WidgetTestHelper.textFormField(),
          );
          expect(textField.enabled, isTrue);
        },
      );

      testWidgets(
        'is enabled when state is success',
        (tester) async {
          final state = ShortenerState.success(
            shortenedUrl: TestData.shortenedUrl,
          );

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          final textField = tester.widget<TextFormField>(
            WidgetTestHelper.textFormField(),
          );
          expect(textField.enabled, isTrue);
        },
      );

      testWidgets(
        'is enabled when state is failure',
        (tester) async {
          const state = ShortenerState.failure(
            failure: Failure.unexpected(),
          );

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          final textField = tester.widget<TextFormField>(
            WidgetTestHelper.textFormField(),
          );
          expect(textField.enabled, isTrue);
        },
      );
    });

    group('Clear Functionality', () {
      testWidgets(
        'shows clear button when state has input',
        (tester) async {
          const state = ShortenerState.hasInput(
            inputUrl: TestData.validInputUrl,
          );

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          expect(find.byIcon(Icons.clear), findsOneWidget);
        },
      );

      testWidgets(
        'calls onClear when clear button is tapped',
        (tester) async {
          const state = ShortenerState.hasInput(
            inputUrl: TestData.validInputUrl,
          );
          bool clearCalled = false;
          void onClear() => clearCalled = true;

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              onClear: onClear,
              getClipboard: mockClipboard.call,
            ),
          );

          await WidgetTestHelper.tap(tester, find.byIcon(Icons.clear));

          expect(clearCalled, isTrue);
        },
      );

      testWidgets(
        'clears text field when clear button is tapped',
        (tester) async {
          const state = ShortenerState.hasInput(
            inputUrl: TestData.validInputUrl,
          );

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          await WidgetTestHelper.enterText(
            tester,
            WidgetTestHelper.textFormField(),
            TestData.validInputUrl.url,
          );

          await WidgetTestHelper.tap(tester, find.byIcon(Icons.clear));

          final textField = tester.widget<TextFormField>(
            WidgetTestHelper.textFormField(),
          );
          expect(textField.controller?.text, isEmpty);
        },
      );
    });

    group('Clipboard Functionality', () {
      testWidgets(
        'calls onPasteFromClipboard when clipboard has content on init',
        (tester) async {
          const state = ShortenerState.initial();
          final clipboardText = TestData.validInputUrl.url;
          bool pasteCalled = false;

          when(() => mockClipboard.call()).thenAnswer(
            (_) async => clipboardText,
          );

          void onPasteFromClipboard(
            BuildContext context,
            String text,
            VoidCallback onPaste,
          ) {
            pasteCalled = true;
            expect(text, equals(clipboardText));
          }

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
              onPasteFromClipboard: onPasteFromClipboard,
            ),
          );

          await tester.pumpAndSettle();

          expect(pasteCalled, isTrue);
          verify(() => mockClipboard.call()).called(1);
        },
      );

      testWidgets(
        'does not call onPasteFromClipboard when clipboard is empty',
        (tester) async {
          const state = ShortenerState.initial();
          bool pasteCalled = false;

          when(() => mockClipboard.call()).thenAnswer((_) async => null);

          void onPasteFromClipboard(
            BuildContext context,
            String text,
            VoidCallback onPaste,
          ) {
            pasteCalled = true;
          }

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
              onPasteFromClipboard: onPasteFromClipboard,
            ),
          );

          await tester.pumpAndSettle();

          expect(pasteCalled, isFalse);
          verify(() => mockClipboard.call()).called(1);
        },
      );
    });

    group('Widget Properties', () {
      testWidgets(
        'has correct autovalidate mode',
        (tester) async {
          const state = ShortenerState.initial();

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          final textField = tester.widget<TextFormField>(
            WidgetTestHelper.textFormField(),
          );
          expect(
            textField.autovalidateMode,
            equals(AutovalidateMode.onUserInteraction),
          );
        },
      );

      testWidgets(
        'has prefix icon',
        (tester) async {
          const state = ShortenerState.initial();

          await WidgetTestHelper.pumpWidget(
            tester,
            UrlInputField(
              state: state,
              getClipboard: mockClipboard.call,
            ),
          );

          expect(find.byIcon(Icons.link), findsOneWidget);
        },
      );
    });
  });
}
