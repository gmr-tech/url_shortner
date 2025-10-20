import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:url_shortener/src/common/domain/failure.dart';
import 'package:url_shortener/src/common/infrastructure/api_constants.dart';
import 'package:url_shortener/src/modules/shortener/infrastructure/shortener_respository_impl.dart';
import '../../../../helpers/mocks.dart';
import '../../../../helpers/test_data.dart';

void main() {
  group('ShortenerRepositoryImpl', () {
    late MockDio mockDio;
    late ShortenerRepositoryImpl repository;

    setUpAll(() {
      registerFallbackValue(TestData.validInputUrl);
    });

    setUp(() {
      mockDio = MockDio();
      repository = ShortenerRepositoryImpl(mockDio);
    });

    group('shorten', () {
      group('successful response', () {
        test(
          'should parse API response correctly and return ShortenedUrl',
          () async {
            final mockResponseData = {
              'alias': '123',
              '_links': {
                'self': 'https://example.com',
                'short': 'https://short.ly/abc123',
              },
            };
            MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

            final result = await repository.shorten(TestData.validInputUrl);

            result.fold(
              (failure) => fail('Expected success but got failure: $failure'),
              (shortenedUrl) {
                expect(shortenedUrl.aliasId, equals(123));
                expect(shortenedUrl.originalUrl, equals('https://example.com'));
                expect(
                  shortenedUrl.shortUrl,
                  equals('https://short.ly/abc123'),
                );
              },
            );
            verify(
              () => mockDio.post(
                ApiConstants.shortenEndpoint,
                data: {'url': TestData.validInputUrl.url},
              ),
            ).called(1);
          },
        );

        test('should handle string alias ID conversion correctly', () async {
          final mockResponseData = {
            'alias': 456,
            '_links': {
              'self': 'https://test.com',
              'short': 'https://short.ly/test456',
            },
          };
          MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

          final result = await repository.shorten(
            TestData.validInputUrlWithPath,
          );

          result.fold(
            (failure) => fail('Expected success but got failure: $failure'),
            (shortenedUrl) {
              expect(shortenedUrl.aliasId, equals(456));
              expect(shortenedUrl.originalUrl, equals('https://test.com'));
              expect(shortenedUrl.shortUrl, equals('https://short.ly/test456'));
            },
          );
        });

        test('should handle zero alias ID when parsing fails', () async {
          final mockResponseData = {
            'alias': 'invalid-number',
            '_links': {
              'self': 'https://example.com',
              'short': 'https://short.ly/abc123',
            },
          };
          MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

          final result = await repository.shorten(TestData.validInputUrl);

          result.fold(
            (failure) => fail('Expected success but got failure: $failure'),
            (shortenedUrl) {
              expect(shortenedUrl.aliasId, equals(0));
            },
          );
        });

        test('should handle complex URLs in response', () async {
          final mockResponseData = {
            'alias': '789',
            '_links': {
              'self':
                  'https://subdomain.example.com:8080/path?query=value#fragment',
              'short': 'https://short.ly/complex789',
            },
          };
          MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

          final result = await repository.shorten(TestData.validComplexUrl);

          result.fold(
            (failure) => fail('Expected success but got failure: $failure'),
            (shortenedUrl) {
              expect(
                shortenedUrl.originalUrl,
                contains('subdomain.example.com:8080'),
              );
              expect(
                shortenedUrl.shortUrl,
                equals('https://short.ly/complex789'),
              );
            },
          );
        });
      });

      group('invalid data responses', () {
        test(
          'should return invalidData when response data is not a Map',
          () async {
            MockHelpers.setupSuccessfulDioPost(mockDio, 'invalid response');

            final result = await repository.shorten(TestData.validInputUrl);

            expect(result, equals(left(const Failure.invalidData())));
          },
        );

        test('should return invalidData when response data is null', () async {
          MockHelpers.setupSuccessfulDioPost(mockDio, null);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.invalidData())));
        });

        test('should return invalidData when alias key is missing', () async {
          final mockResponseData = {
            '_links': {
              'self': 'https://example.com',
              'short': 'https://short.ly/abc123',
            },
          };
          MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.invalidData())));
        });

        test('should return invalidData when _links key is missing', () async {
          final mockResponseData = {
            'alias': '123',
          };
          MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.invalidData())));
        });

        test('should return invalidData when _links is not a Map', () async {
          final mockResponseData = {
            'alias': '123',
            '_links': 'invalid links',
          };
          MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.invalidData())));
        });

        test(
          'should return invalidData when self key is missing from _links',
          () async {
            final mockResponseData = {
              'alias': '123',
              '_links': {
                'short': 'https://short.ly/abc123',
              },
            };
            MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

            final result = await repository.shorten(TestData.validInputUrl);

            expect(result, equals(left(const Failure.invalidData())));
          },
        );

        test(
          'should return invalidData when short key is missing from _links',
          () async {
            final mockResponseData = {
              'alias': '123',
              '_links': {
                'self': 'https://example.com',
              },
            };
            MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

            final result = await repository.shorten(TestData.validInputUrl);

            expect(result, equals(left(const Failure.invalidData())));
          },
        );
      });

      group('network errors', () {
        test('should return networkError for connectionTimeout', () async {
          final exception = DioException(
            type: DioExceptionType.connectionTimeout,
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.networkError())));
        });

        test('should return networkError for sendTimeout', () async {
          final exception = DioException(
            type: DioExceptionType.sendTimeout,
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.networkError())));
        });

        test('should return networkError for receiveTimeout', () async {
          final exception = DioException(
            type: DioExceptionType.receiveTimeout,
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.networkError())));
        });

        test('should return networkError for connectionError', () async {
          final exception = DioException(
            type: DioExceptionType.connectionError,
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.networkError())));
        });
      });

      group('server errors', () {
        test('should return serverError for 500 status code', () async {
          final exception = DioException(
            type: DioExceptionType.badResponse,
            response: Response(
              statusCode: 500,
              requestOptions: RequestOptions(path: '/'),
            ),
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.serverError())));
        });

        test('should return serverError for 502 status code', () async {
          final exception = DioException(
            type: DioExceptionType.badResponse,
            response: Response(
              statusCode: 502,
              requestOptions: RequestOptions(path: '/'),
            ),
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.serverError())));
        });

        test('should return invalidData for 400 status code', () async {
          final exception = DioException(
            type: DioExceptionType.badResponse,
            response: Response(
              statusCode: 400,
              requestOptions: RequestOptions(path: '/'),
            ),
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.invalidData())));
        });

        test('should return invalidData for 404 status code', () async {
          final exception = DioException(
            type: DioExceptionType.badResponse,
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(path: '/'),
            ),
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.invalidData())));
        });
      });

      group('other exceptions', () {
        test('should return unexpected for cancel exception', () async {
          final exception = DioException(
            type: DioExceptionType.cancel,
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, isA<Left<Failure, dynamic>>());
          result.fold(
            (failure) => expect(failure, isA<Unexpected>()),
            (_) => fail('Expected failure'),
          );
        });

        test('should return unexpected for badCertificate exception', () async {
          final exception = DioException(
            type: DioExceptionType.badCertificate,
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, isA<Left<Failure, dynamic>>());
          result.fold(
            (failure) => expect(failure, isA<Unexpected>()),
            (_) => fail('Expected failure'),
          );
        });

        test('should return unexpected for unknown DioException', () async {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/'),
          );
          MockHelpers.setupDioException(mockDio, exception);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, isA<Left<Failure, dynamic>>());
          result.fold(
            (failure) => expect(failure, isA<Unexpected>()),
            (_) => fail('Expected failure'),
          );
        });

        test('should return invalidData for FormatException', () async {
          when(
            () => mockDio.post(
              any(),
              data: any(named: 'data'),
            ),
          ).thenThrow(const FormatException('Invalid format'));

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, equals(left(const Failure.invalidData())));
        });

        test('should return unexpected for generic Exception', () async {
          final genericException = Exception('Generic error');
          when(
            () => mockDio.post(
              any(),
              data: any(named: 'data'),
            ),
          ).thenThrow(genericException);

          final result = await repository.shorten(TestData.validInputUrl);

          expect(result, isA<Left<Failure, dynamic>>());
          result.fold(
            (failure) => expect(failure, isA<Unexpected>()),
            (_) => fail('Expected failure'),
          );
        });
      });

      group('dependency injection', () {
        test('should accept Dio instance in constructor', () {
          final testRepository = ShortenerRepositoryImpl(mockDio);
          expect(testRepository.dio, equals(mockDio));
        });

        test('should use injected Dio for HTTP calls', () async {
          final anotherMockDio = MockDio();
          final testRepository = ShortenerRepositoryImpl(anotherMockDio);

          final mockResponseData = {
            'alias': '999',
            '_links': {
              'self': 'https://test.com',
              'short': 'https://short.ly/test999',
            },
          };
          MockHelpers.setupSuccessfulDioPost(anotherMockDio, mockResponseData);

          await testRepository.shorten(TestData.validInputUrl);

          verify(
            () => anotherMockDio.post(
              any(),
              data: any(named: 'data'),
            ),
          ).called(1);
          verifyNever(
            () => mockDio.post(
              any(),
              data: any(named: 'data'),
            ),
          );
        });
      });

      group('request format', () {
        test('should send correct endpoint and data format', () async {
          final mockResponseData = {
            'alias': '123',
            '_links': {
              'self': 'https://example.com',
              'short': 'https://short.ly/abc123',
            },
          };
          MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

          await repository.shorten(TestData.validInputUrlWithQuery);

          verify(
            () => mockDio.post(
              ApiConstants.shortenEndpoint,
              data: {'url': TestData.validInputUrlWithQuery.url},
            ),
          ).called(1);
        });

        test('should handle special characters in URL data', () async {
          const specialUrl = TestData.validComplexUrl;
          final mockResponseData = {
            'alias': '123',
            '_links': {
              'self': specialUrl.url,
              'short': 'https://short.ly/special123',
            },
          };
          MockHelpers.setupSuccessfulDioPost(mockDio, mockResponseData);

          await repository.shorten(specialUrl);

          verify(
            () => mockDio.post(
              ApiConstants.shortenEndpoint,
              data: {'url': specialUrl.url},
            ),
          ).called(1);
        });
      });
    });
  });
}
