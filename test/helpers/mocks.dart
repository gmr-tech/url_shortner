// ignore_for_file: avoid_classes_with_only_static_members

import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:url_shortener/src/common/domain/failure.dart';
import 'package:url_shortener/src/common/domain/shortened_url.dart';
import 'package:url_shortener/src/modules/shortener/domain/shorten_url_usecase.dart';
import 'package:url_shortener/src/modules/shortener/domain/shortener_repository.dart';

class MockShortenerRepository extends Mock implements ShortenerRepository {}

class MockShortenUrlUseCase extends Mock implements ShortenUrlUseCase {}

class MockHelpers {
  static void setupSuccessfulShorten(
    MockShortenerRepository mock,
    ShortenedUrl result,
  ) {
    when(() => mock.shorten(any())).thenAnswer(
      (_) async => right(result),
    );
  }

  static void setupFailedShorten(
    MockShortenerRepository mock,
    Failure failure,
  ) {
    when(() => mock.shorten(any())).thenAnswer(
      (_) async => left(failure),
    );
  }

  static void setupSuccessfulUseCase(
    MockShortenUrlUseCase mock,
    ShortenedUrl result,
  ) {
    when(() => mock.call(any())).thenAnswer(
      (_) async => right(result),
    );
  }

  static void setupFailedUseCase(
    MockShortenUrlUseCase mock,
    Failure failure,
  ) {
    when(() => mock.call(any())).thenAnswer(
      (_) async => left(failure),
    );
  }
}
