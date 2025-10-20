// ignore_for_file: lines_longer_than_80_chars

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:url_shortener/src/common/domain/failure.dart';
import 'package:url_shortener/src/modules/shortener/domain/shorten_url_usecase.dart';
import '../../../../helpers/mocks.dart';
import '../../../../helpers/test_data.dart';

void main() {
  group('ShortenUrlUseCase', () {
    late MockShortenerRepository mockRepository;
    late ShortenUrlUseCase useCase;

    setUpAll(() {
      registerFallbackValue(TestData.validInputUrl);
    });

    setUp(() {
      mockRepository = MockShortenerRepository();
      useCase = ShortenUrlUseCase(mockRepository);
    });

    group('call', () {
      group('when input is valid', () {
        test(
          'should call repository and return success when shortening succeeds',
          () async {
            // Arrange
            const validInputUrl = TestData.validInputUrl;
            final expectedResult = TestData.shortenedUrl;

            when(
              () => mockRepository.shorten(validInputUrl),
            ).thenAnswer((_) async => right(expectedResult));

            // Act
            final result = await useCase.call(validInputUrl);

            // Assert
            expect(result, equals(right(expectedResult)));
            verify(() => mockRepository.shorten(validInputUrl)).called(1);
          },
        );

        test(
          'should call repository and return failure when repository fails',
          () async {
            // Arrange
            const validInputUrl = TestData.validInputUrl;
            const expectedFailure = Failure.networkError();

            when(
              () => mockRepository.shorten(validInputUrl),
            ).thenAnswer((_) async => left(expectedFailure));

            // Act
            final result = await useCase.call(validInputUrl);

            // Assert
            expect(result, equals(left(expectedFailure)));
            verify(() => mockRepository.shorten(validInputUrl)).called(1);
          },
        );

        test('should propagate server error from repository', () async {
          // Arrange
          const validInputUrl = TestData.validInputUrlWithPath;
          const expectedFailure = Failure.serverError();

          when(
            () => mockRepository.shorten(validInputUrl),
          ).thenAnswer((_) async => left(expectedFailure));

          // Act
          final result = await useCase.call(validInputUrl);

          // Assert
          expect(result, equals(left(expectedFailure)));
          verify(() => mockRepository.shorten(validInputUrl)).called(1);
        });

        test('should propagate invalid data error from repository', () async {
          // Arrange
          const validInputUrl = TestData.validInputUrlWithQuery;
          const expectedFailure = Failure.invalidData();

          when(
            () => mockRepository.shorten(validInputUrl),
          ).thenAnswer((_) async => left(expectedFailure));

          // Act
          final result = await useCase.call(validInputUrl);

          // Assert
          expect(result, equals(left(expectedFailure)));
          verify(() => mockRepository.shorten(validInputUrl)).called(1);
        });

        test('should propagate unexpected error from repository', () async {
          // Arrange
          const validInputUrl = TestData.validComplexUrl;
          const expectedFailure = Failure.unexpected(object: 'Test error');

          when(
            () => mockRepository.shorten(validInputUrl),
          ).thenAnswer((_) async => left(expectedFailure));

          // Act
          final result = await useCase.call(validInputUrl);

          // Assert
          expect(result, equals(left(expectedFailure)));
          verify(() => mockRepository.shorten(validInputUrl)).called(1);
        });
      });

      group('when input is invalid', () {
        test(
          'should return invalidInput failure without calling repository for empty URL',
          () async {
            // Arrange
            const invalidInputUrl = TestData.emptyInputUrl;

            // Act
            final result = await useCase.call(invalidInputUrl);

            // Assert
            expect(result, equals(left(const Failure.invalidInput())));
            verifyNever(() => mockRepository.shorten(any()));
          },
        );

        test(
          'should return invalidInput failure without calling repository for whitespace URL',
          () async {
            // Arrange
            const invalidInputUrl = TestData.whitespaceInputUrl;

            // Act
            final result = await useCase.call(invalidInputUrl);

            // Assert
            expect(result, equals(left(const Failure.invalidInput())));
            verifyNever(() => mockRepository.shorten(any()));
          },
        );

        test(
          'should return invalidInput failure without calling repository for malformed URL',
          () async {
            // Arrange
            const invalidInputUrl = TestData
                .reallyInvalidInputUrl; // 'http://[' - actually fails Uri.tryParse

            // Act
            final result = await useCase.call(invalidInputUrl);

            // Assert
            expect(result, equals(left(const Failure.invalidInput())));
            verifyNever(() => mockRepository.shorten(any()));
          },
        );

        test(
          'should call repository for URLs that seem invalid but pass Uri.tryParse',
          () async {
            // Arrange
            const seeminglyInvalidInputUrl =
                TestData.malformedInputUrl; // 'https://' - passes Uri.tryParse
            final expectedResult = TestData.shortenedUrl;

            when(
              () => mockRepository.shorten(seeminglyInvalidInputUrl),
            ).thenAnswer((_) async => right(expectedResult));

            // Act
            final result = await useCase.call(seeminglyInvalidInputUrl);

            // Assert
            expect(result, equals(right(expectedResult)));
            verify(
              () => mockRepository.shorten(seeminglyInvalidInputUrl),
            ).called(1);
          },
        );

        test(
          'should call repository for non-URL strings that pass Uri.tryParse',
          () async {
            // Arrange
            const seeminglyInvalidInputUrl =
                TestData.invalidInputUrl; // 'not-a-url' - passes Uri.tryParse
            final expectedResult = TestData.shortenedUrl;

            when(
              () => mockRepository.shorten(seeminglyInvalidInputUrl),
            ).thenAnswer((_) async => right(expectedResult));

            // Act
            final result = await useCase.call(seeminglyInvalidInputUrl);

            // Assert
            expect(result, equals(right(expectedResult)));
            verify(
              () => mockRepository.shorten(seeminglyInvalidInputUrl),
            ).called(1);
          },
        );

        test(
          'should call repository for URLs with spaces that get encoded',
          () async {
            // Arrange
            const seeminglyInvalidInputUrl =
                TestData.spacesInputUrl; // Gets encoded by Uri.tryParse
            final expectedResult = TestData.shortenedUrl;

            when(
              () => mockRepository.shorten(seeminglyInvalidInputUrl),
            ).thenAnswer((_) async => right(expectedResult));

            // Act
            final result = await useCase.call(seeminglyInvalidInputUrl);

            // Assert
            expect(result, equals(right(expectedResult)));
            verify(
              () => mockRepository.shorten(seeminglyInvalidInputUrl),
            ).called(1);
          },
        );
      });

      group('edge cases', () {
        test('should handle multiple calls with same valid input', () async {
          // Arrange
          const validInputUrl = TestData.validInputUrl;
          final expectedResult = TestData.shortenedUrl;

          when(
            () => mockRepository.shorten(validInputUrl),
          ).thenAnswer((_) async => right(expectedResult));

          // Act
          final result1 = await useCase.call(validInputUrl);
          final result2 = await useCase.call(validInputUrl);

          // Assert
          expect(result1, equals(right(expectedResult)));
          expect(result2, equals(right(expectedResult)));
          verify(() => mockRepository.shorten(validInputUrl)).called(2);
        });

        test('should handle alternating valid and invalid inputs', () async {
          // Arrange
          const validInputUrl = TestData.validInputUrl;
          const invalidInputUrl = TestData.emptyInputUrl;
          final expectedResult = TestData.shortenedUrl;

          when(
            () => mockRepository.shorten(validInputUrl),
          ).thenAnswer((_) async => right(expectedResult));

          // Act
          final result1 = await useCase.call(validInputUrl);
          final result2 = await useCase.call(invalidInputUrl);
          final result3 = await useCase.call(validInputUrl);

          // Assert
          expect(result1, equals(right(expectedResult)));
          expect(result2, equals(left(const Failure.invalidInput())));
          expect(result3, equals(right(expectedResult)));
          verify(() => mockRepository.shorten(validInputUrl)).called(2);
        });

        test('should validate input before each repository call', () async {
          // Arrange
          const validInputUrl = TestData.validInputUrl;
          final expectedResult = TestData.shortenedUrl;

          when(
            () => mockRepository.shorten(validInputUrl),
          ).thenAnswer((_) async => right(expectedResult));

          // Act - First call with valid input
          final result1 = await useCase.call(validInputUrl);

          // Act - Second call with invalid input (no setup needed for repository)
          final result2 = await useCase.call(TestData.emptyInputUrl);

          // Assert
          expect(result1, equals(right(expectedResult)));
          expect(result2, equals(left(const Failure.invalidInput())));
          verify(() => mockRepository.shorten(validInputUrl)).called(1);
        });
      });

      group('dependency injection', () {
        test('should accept repository in constructor', () {
          // Arrange & Act
          final testUseCase = ShortenUrlUseCase(mockRepository);

          // Assert
          expect(testUseCase.repository, equals(mockRepository));
        });

        test('should use injected repository for shorten calls', () async {
          // Arrange
          final anotherMockRepository = MockShortenerRepository();
          final testUseCase = ShortenUrlUseCase(anotherMockRepository);
          const validInputUrl = TestData.validInputUrl;
          final expectedResult = TestData.shortenedUrl;

          when(
            () => anotherMockRepository.shorten(validInputUrl),
          ).thenAnswer((_) async => right(expectedResult));

          // Act
          final result = await testUseCase.call(validInputUrl);

          // Assert
          expect(result, equals(right(expectedResult)));
          verify(() => anotherMockRepository.shorten(validInputUrl)).called(1);
          verifyNever(() => mockRepository.shorten(any()));
        });
      });
    });
  });
}
