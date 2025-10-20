// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: avoid_annotating_with_dynamic

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:url_shortener/src/common/domain/failure.dart';
import 'package:url_shortener/src/common/domain/shortened_url.dart';
import 'package:url_shortener/src/modules/shortener/domain/shorten_url_usecase.dart';
import 'package:url_shortener/src/modules/shortener/domain/shortener_repository.dart';

class MockShortenerRepository extends Mock implements ShortenerRepository {}

class MockShortenUrlUseCase extends Mock implements ShortenUrlUseCase {}

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response<dynamic> {}

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

  static MockResponse createMockResponse({
    required dynamic data,
    int statusCode = 200,
    Map<String, List<String>>? headers,
  }) {
    final response = MockResponse();
    when(() => response.data).thenReturn(data);
    when(() => response.statusCode).thenReturn(statusCode);
    when(() => response.headers).thenReturn(Headers.fromMap(headers ?? {}));
    when(() => response.requestOptions).thenReturn(
      RequestOptions(path: '/'),
    );
    return response;
  }

  static void setupSuccessfulDioPost(
    MockDio mockDio,
    dynamic responseData,
  ) {
    when(
      () => mockDio.post(
        any(),
        data: any(named: 'data'),
      ),
    ).thenAnswer(
      (_) async => createMockResponse(data: responseData),
    );
  }

  static void setupDioException(
    MockDio mockDio,
    DioException exception,
  ) {
    when(
      () => mockDio.post(
        any(),
        data: any(named: 'data'),
      ),
    ).thenThrow(exception);
  }
}
