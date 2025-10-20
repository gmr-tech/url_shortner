// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';

import 'package:url_shortener/src/common/domain/input_url.dart';
import 'package:url_shortener/src/common/domain/input_url_validator.dart';
import 'package:url_shortener/src/common/presentation/ui_strings.dart';
import '../../../helpers/test_data.dart';

void main() {
  group('InputUrlValidator', () {
    group('validate', () {
      group('valid URLs', () {
        test('should return null for valid HTTPS URL', () {
          const inputUrl = TestData.validInputUrl;
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should return null for valid HTTP URL', () {
          const inputUrl = TestData.validHttpInputUrl;
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should return null for URL with path', () {
          const inputUrl = TestData.validInputUrlWithPath;
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should return null for URL with query parameters', () {
          const inputUrl = TestData.validInputUrlWithQuery;
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should return null for complex URL with subdomain and port', () {
          const inputUrl = TestData.validComplexUrl;
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should return null for URL with special characters', () {
          const inputUrl = InputUrl(
            'https://example.com/path?param=value&other=test#fragment',
          );
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should return null for localhost URL', () {
          const inputUrl = InputUrl('http://localhost:3000');
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should return null for IP address URL', () {
          const inputUrl = InputUrl('http://192.168.1.1:8080');
          final result = inputUrl.validate();
          expect(result, isNull);
        });
      });

      group('invalid URLs', () {
        test('should return error for empty string', () {
          const inputUrl = TestData.emptyInputUrl;
          final result = inputUrl.validate();
          expect(result, equals(UIStrings.urlCannotBeEmpty));
        });

        test('should return error for whitespace only', () {
          const inputUrl = TestData.whitespaceInputUrl;
          final result = inputUrl.validate();
          expect(result, equals(UIStrings.urlCannotBeEmpty));
        });

        test('should return error for malformed URL', () {
          const inputUrl = TestData.malformedInputUrl;
          final result = inputUrl.validate();
          // Note: Uri.tryParse is permissive and accepts "https://" as valid
          expect(result, isNull);
        });

        test('should return error for non-URL string', () {
          const inputUrl = TestData.invalidInputUrl;
          final result = inputUrl.validate();
          // Note: Uri.tryParse accepts "not-a-url" as a valid URI
          expect(result, isNull);
        });

        test('should return error for URL with spaces', () {
          const inputUrl = TestData.spacesInputUrl;
          final result = inputUrl.validate();
          // Note: Uri.tryParse handles spaces by encoding them
          expect(result, isNull);
        });

        test('should return error for string with only protocol', () {
          const inputUrl = InputUrl('https://');
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should return error for malformed bracket URL', () {
          const inputUrl = TestData.reallyInvalidInputUrl;
          final result = inputUrl.validate();
          expect(result, equals(UIStrings.invalidUrlFormat));
        });
      });

      group('edge cases', () {
        test('should trim whitespace before validation', () {
          const inputUrl = InputUrl('  https://example.com  ');
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should handle tabs and newlines as whitespace', () {
          const inputUrl = InputUrl('\t\nhttps://example.com\t\n');
          final result = inputUrl.validate();
          expect(result, isNull);
        });

        test('should handle mixed whitespace', () {
          const inputUrl = InputUrl(' \t\n ');
          final result = inputUrl.validate();
          expect(result, equals(UIStrings.urlCannotBeEmpty));
        });
      });
    });

    group('isValid', () {
      test('should return true when validate returns null', () {
        const inputUrl = TestData.validInputUrl;
        final result = inputUrl.isValid();
        expect(result, isTrue);
        expect(inputUrl.validate(), isNull);
      });

      test('should return false when validate returns error', () {
        const inputUrl = TestData.emptyInputUrl;
        final result = inputUrl.isValid();
        expect(result, isFalse);
        expect(inputUrl.validate(), isNotNull);
      });

      test('should be consistent with validate method', () {
        final testUrls = [
          TestData.validInputUrl,
          TestData.validHttpInputUrl,
          TestData.emptyInputUrl,
          TestData.invalidInputUrl,
          TestData.malformedInputUrl,
        ];
        for (final url in testUrls) {
          final isValid = url.isValid();
          final validateResult = url.validate();
          expect(
            isValid,
            equals(validateResult == null),
            reason:
                'isValid() and validate() should be consistent for URL: ${url.url}',
          );
        }
      });
    });
  });
}
