// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:url_shortener/src/common/domain/failure.dart';
import 'package:url_shortener/src/modules/shortener/bloc/shortener_bloc.dart';
import 'package:url_shortener/src/modules/shortener/domain/shorten_url_usecase.dart';

import '../../../../helpers/test_data.dart';

class MockShortenUrlUseCase extends Mock implements ShortenUrlUseCase {}

void main() {
  group('ShortenerBloc', () {
    late MockShortenUrlUseCase mockShortenUrlUseCase;
    late ShortenerBloc shortenerBloc;

    setUp(() {
      mockShortenUrlUseCase = MockShortenUrlUseCase();
      shortenerBloc = ShortenerBloc(mockShortenUrlUseCase);
    });

    tearDown(() {
      unawaited(shortenerBloc.close());
    });

    test('initial state should be ShortenerState.initial()', () {
      // Assert
      expect(shortenerBloc.state, const ShortenerState.initial());
    });

    group('ShortenerEventReset', () {
      blocTest<ShortenerBloc, ShortenerState>(
        'emits [ShortenerState.initial()] when reset event is added',
        build: () => shortenerBloc,
        act: (bloc) => bloc.add(const ShortenerEvent.reset()),
        expect: () => [const ShortenerState.initial()],
      );

      blocTest<ShortenerBloc, ShortenerState>(
        'emits [ShortenerState.initial()] when reset from hasInput state',
        build: () => shortenerBloc,
        seed: () =>
            const ShortenerState.hasInput(inputUrl: TestData.validInputUrl),
        act: (bloc) => bloc.add(const ShortenerEvent.reset()),
        expect: () => [const ShortenerState.initial()],
      );
    });

    group('ShortenerEventAddInput', () {
      blocTest<ShortenerBloc, ShortenerState>(
        'emits [ShortenerState.hasInput] when valid input is added from initial state',
        build: () => shortenerBloc,
        act: (bloc) => bloc.add(
          const ShortenerEvent.addInput(inputUrl: TestData.validInputUrl),
        ),
        expect: () => [
          const ShortenerState.hasInput(inputUrl: TestData.validInputUrl),
        ],
      );

      blocTest<ShortenerBloc, ShortenerState>(
        'emits [ShortenerState.hasInput] when empty input is added',
        build: () => shortenerBloc,
        seed: () =>
            const ShortenerState.hasInput(inputUrl: TestData.validInputUrl),
        act: (bloc) => bloc.add(
          const ShortenerEvent.addInput(inputUrl: TestData.emptyInputUrl),
        ),
        expect: () => [
          const ShortenerState.hasInput(inputUrl: TestData.emptyInputUrl),
        ],
      );
    });

    group('ShortenerEventShorten', () {
      blocTest<ShortenerBloc, ShortenerState>(
        'emits [loading, success] when shorten succeeds',
        build: () {
          when(
            () => mockShortenUrlUseCase(TestData.validInputUrl),
          ).thenAnswer((_) async => Right(TestData.shortenedUrl));
          return shortenerBloc;
        },
        seed: () =>
            const ShortenerState.hasInput(inputUrl: TestData.validInputUrl),
        act: (bloc) => bloc.add(const ShortenerEvent.shorten()),
        expect: () => [
          const ShortenerState.loading(),
          ShortenerState.success(
            shortenedUrl: TestData.shortenedUrl,
          ),
        ],
        verify: (_) {
          verify(() => mockShortenUrlUseCase(TestData.validInputUrl)).called(1);
        },
      );

      blocTest<ShortenerBloc, ShortenerState>(
        'emits [loading, failure] when shorten fails with NetworkFailure',
        build: () {
          when(
            () => mockShortenUrlUseCase(TestData.validInputUrl),
          ).thenAnswer((_) async => const Left(Failure.networkError()));
          return shortenerBloc;
        },
        seed: () =>
            const ShortenerState.hasInput(inputUrl: TestData.validInputUrl),
        act: (bloc) => bloc.add(const ShortenerEvent.shorten()),
        expect: () => [
          const ShortenerState.loading(),
          const ShortenerState.failure(
            failure: Failure.networkError(),
            inputUrl: TestData.validInputUrl,
          ),
        ],
        verify: (_) {
          verify(() => mockShortenUrlUseCase(TestData.validInputUrl)).called(1);
        },
      );

      blocTest<ShortenerBloc, ShortenerState>(
        'emits [failure] when shorten event is added from initial state',
        build: () => shortenerBloc,
        act: (bloc) => bloc.add(const ShortenerEvent.shorten()),
        expect: () => [
          const ShortenerState.failure(
            failure: Failure.unexpected(),
          ),
        ],
      );

      blocTest<ShortenerBloc, ShortenerState>(
        'emits [failure] when shorten with invalid input',
        build: () => shortenerBloc,
        seed: () =>
            const ShortenerState.hasInput(inputUrl: TestData.emptyInputUrl),
        act: (bloc) => bloc.add(const ShortenerEvent.shorten()),
        expect: () => [
          const ShortenerState.failure(
            failure: Failure.invalidInput(),
          ),
        ],
      );
    });
  });
}
