import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_shortener/src/modules/history/bloc/history_bloc.dart';

import '../../../../helpers/test_data.dart';

void main() {
  group('HistoryBloc', () {
    late HistoryBloc historyBloc;

    setUp(() {
      historyBloc = HistoryBloc();
    });

    tearDown(() {
      unawaited(historyBloc.close());
    });

    test('initial state should be HistoryState.initial()', () {
      expect(historyBloc.state, const HistoryState.initial());
    });

    group('HistoryEventAdd', () {
      blocTest<HistoryBloc, HistoryState>(
        'emits [HistoryState.updated] when first URL is added to empty history',
        build: () => historyBloc,
        act: (bloc) => bloc.add(
          HistoryEvent.add(TestData.shortenedUrl),
        ),
        expect: () => [
          predicate<HistoryState>((state) {
            return state is HistoryUpdated &&
                state.shortenedUrls.length == 1 &&
                state.shortenedUrls.first == TestData.shortenedUrl;
          }),
        ],
      );

      blocTest<HistoryBloc, HistoryState>(
        'adds new URL to the beginning of the list (newest first)',
        build: () => historyBloc,
        seed: () => HistoryState.updated(
          shortenedUrls: [TestData.shortenedUrl],
          lastUpdated: DateTime(2025),
        ),
        act: (bloc) => bloc.add(
          HistoryEvent.add(TestData.shortenedUrlDifferentId),
        ),
        expect: () => [
          predicate<HistoryState>((state) {
            return state is HistoryUpdated &&
                state.shortenedUrls.length == 2 &&
                state.shortenedUrls.first == TestData.shortenedUrlDifferentId &&
                state.shortenedUrls.last == TestData.shortenedUrl;
          }),
        ],
      );

      blocTest<HistoryBloc, HistoryState>(
        'adds duplicate URLs to history (no duplicate check)',
        build: () => historyBloc,
        seed: () => HistoryState.updated(
          shortenedUrls: [TestData.shortenedUrl],
          lastUpdated: DateTime(2025),
        ),
        act: (bloc) => bloc.add(
          HistoryEvent.add(TestData.shortenedUrl),
        ),
        expect: () => [
          predicate<HistoryState>((state) {
            return state is HistoryUpdated &&
                state.shortenedUrls.length == 2 &&
                state.shortenedUrls.first == TestData.shortenedUrl &&
                state.shortenedUrls.last == TestData.shortenedUrl;
          }),
        ],
      );
    });

    group('HistoryEventRemove', () {
      blocTest<HistoryBloc, HistoryState>(
        'emits [HistoryState.updated] when URL is removed from history',
        build: () => historyBloc,
        seed: () => HistoryState.updated(
          shortenedUrls: [
            TestData.shortenedUrl,
            TestData.shortenedUrlDifferentId,
          ],
          lastUpdated: DateTime(2025),
        ),
        act: (bloc) => bloc.add(
          HistoryEvent.remove(TestData.shortenedUrl),
        ),
        expect: () => [
          predicate<HistoryState>((state) {
            return state is HistoryUpdated &&
                state.shortenedUrls.length == 1 &&
                !state.shortenedUrls.contains(TestData.shortenedUrl);
          }),
        ],
      );

      blocTest<HistoryBloc, HistoryState>(
        'emits [HistoryState.initial] when last URL is removed from history',
        build: () => historyBloc,
        seed: () => HistoryState.updated(
          shortenedUrls: [TestData.shortenedUrl],
          lastUpdated: DateTime(2025),
        ),
        act: (bloc) => bloc.add(
          HistoryEvent.remove(TestData.shortenedUrl),
        ),
        expect: () => [
          const HistoryState.initial(),
        ],
      );

      blocTest<HistoryBloc, HistoryState>(
        'emits updated state even when trying to remove non-existent URL',
        build: () => historyBloc,
        seed: () => HistoryState.updated(
          shortenedUrls: [TestData.shortenedUrl],
          lastUpdated: DateTime(2025),
        ),
        act: (bloc) => bloc.add(
          HistoryEvent.remove(TestData.shortenedUrlDifferentShort),
        ),
        expect: () => [
          predicate<HistoryState>((state) {
            return state is HistoryUpdated &&
                state.shortenedUrls.length == 1 &&
                state.shortenedUrls.contains(TestData.shortenedUrl);
          }),
        ],
      );

      blocTest<HistoryBloc, HistoryState>(
        'does not emit when trying to remove from initial state',
        build: () => historyBloc,
        act: (bloc) => bloc.add(
          HistoryEvent.remove(TestData.shortenedUrl),
        ),
        expect: () => <HistoryState>[],
      );
    });

    group('State transitions', () {
      blocTest<HistoryBloc, HistoryState>(
        'handles multiple add operations correctly',
        build: () => historyBloc,
        act: (bloc) async {
          bloc.add(HistoryEvent.add(TestData.shortenedUrl));
          await Future<void>.delayed(Duration.zero);
          bloc.add(HistoryEvent.add(TestData.shortenedUrlDifferentTime));
        },
        expect: () => [
          predicate<HistoryState>((state) {
            return state is HistoryUpdated && state.shortenedUrls.length == 1;
          }),
          predicate<HistoryState>((state) {
            return state is HistoryUpdated && state.shortenedUrls.length == 2;
          }),
        ],
      );
    });
  });
}
