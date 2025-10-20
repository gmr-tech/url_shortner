import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// ignore: avoid_classes_with_only_static_members
class WidgetTestHelper {
  static Widget createAppWrapper({
    required Widget child,
    ThemeData? theme,
    Locale locale = const Locale('en', 'US'),
  }) {
    return MaterialApp(
      title: 'Test App',
      theme: theme ?? ThemeData.light(),
      locale: locale,
      home: Scaffold(
        body: child,
      ),
    );
  }

  static Widget createAppWrapperWithProviders({
    required Widget child,
    required List<Provider> providers,
    ThemeData? theme,
    Locale locale = const Locale('en', 'US'),
  }) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Test App',
        theme: theme ?? ThemeData.light(),
        locale: locale,
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  static Future<void> pumpWidget(
    WidgetTester tester,
    Widget widget, {
    ThemeData? theme,
  }) async {
    await tester.pumpWidget(
      createAppWrapper(
        child: widget,
        theme: theme,
      ),
    );
  }

  static Future<void> pumpWidgetWithProviders(
    WidgetTester tester,
    Widget widget,
    List<Provider> providers, {
    ThemeData? theme,
  }) async {
    await tester.pumpWidget(
      createAppWrapperWithProviders(
        child: widget,
        providers: providers,
        theme: theme,
      ),
    );
  }

  static Finder byText(String text) => find.text(text);
  static Finder byKey(Key key) => find.byKey(key);
  static Finder byType<T>() => find.byType(T);
  static Finder byIcon(IconData icon) => find.byIcon(icon);

  static Finder firstByType<T>() => find.byType(T).first;
  static Finder lastByType<T>() => find.byType(T).last;

  static Finder textField() => find.byType(TextField);
  static Finder textFormField() => find.byType(TextFormField);
  static Finder elevatedButton() => find.byType(ElevatedButton);
  static Finder iconButton() => find.byType(IconButton);
  static Finder inkWell() => find.byType(InkWell);

  static Future<void> tap(WidgetTester tester, Finder finder) async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  static Future<void> enterText(
    WidgetTester tester,
    Finder finder,
    String text,
  ) async {
    await tester.enterText(finder, text);
    await tester.pumpAndSettle();
  }

  static Future<void> longPress(WidgetTester tester, Finder finder) async {
    await tester.longPress(finder);
    await tester.pumpAndSettle();
  }

  static Future<void> scroll(
    WidgetTester tester,
    Finder finder,
    Offset offset,
  ) async {
    await tester.drag(finder, offset);
    await tester.pumpAndSettle();
  }

  static Future<void> pumpAndSettle(WidgetTester tester) async {
    await tester.pumpAndSettle();
  }

  static Future<void> pump(WidgetTester tester, [Duration? duration]) async {
    await tester.pump(duration);
  }

  static void findsOneWidget(Finder finder) {
    expect(finder, findsOneWidget);
  }

  static void findsNothing(Finder finder) {
    expect(finder, findsNothing);
  }

  static void assertFindsNWidgets(Finder finder, int count) {
    expect(finder, findsNWidgets(count));
  }

  static void findsWidgets(Finder finder) {
    expect(finder, findsWidgets);
  }

  static void hasText(Finder finder, String expectedText) {
    final widget = find.descendant(
      of: finder,
      matching: find.text(expectedText),
    );
    expect(widget, findsOneWidget);
  }

  static void isEnabled(WidgetTester tester, Finder finder) {
    final widget = tester.widget(finder);
    if (widget is InkWell) {
      expect(widget.onTap, isNotNull);
    } else if (widget is ElevatedButton) {
      expect(widget.onPressed, isNotNull);
    } else if (widget is IconButton) {
      expect(widget.onPressed, isNotNull);
    } else if (widget is TextFormField) {
      expect(widget.enabled, isTrue);
    }
  }

  static void isDisabled(WidgetTester tester, Finder finder) {
    final widget = tester.widget(finder);
    if (widget is InkWell) {
      expect(widget.onTap, isNull);
    } else if (widget is ElevatedButton) {
      expect(widget.onPressed, isNull);
    } else if (widget is IconButton) {
      expect(widget.onPressed, isNull);
    } else if (widget is TextFormField) {
      expect(widget.enabled, isFalse);
    }
  }
}
