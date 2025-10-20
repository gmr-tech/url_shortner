import 'package:flutter_test/flutter_test.dart';

import 'package:url_shortener/src/common/domain/input_url.dart';
import '../../../helpers/test_data.dart';

void main() {
  group('InputUrl', () {
    group('constructor', () {
      test('should create InputUrl with given URL string', () {
        const urlString = 'https://example.com';
        const inputUrl = InputUrl(urlString);
        expect(inputUrl.url, equals(urlString));
      });

      test('should create InputUrl with empty string', () {
        const urlString = '';
        const inputUrl = InputUrl(urlString);
        expect(inputUrl.url, equals(urlString));
      });
    });

    group('equality', () {
      test('should be equal when URLs are the same', () {
        const url1 = InputUrl('https://example.com');
        const url2 = InputUrl('https://example.com');
        expect(url1, equals(url2));
        expect(url1.hashCode, equals(url2.hashCode));
      });

      test('should not be equal when URLs are different', () {
        const url1 = InputUrl('https://example.com');
        const url2 = InputUrl('https://different.com');
        expect(url1, isNot(equals(url2)));
        expect(url1.hashCode, isNot(equals(url2.hashCode)));
      });

      test('should be equal using test data constants', () {
        const url1 = TestData.validInputUrl;
        const url2 = InputUrl('https://example.com');
        expect(url1, equals(url2));
      });

      test('should not be equal to null', () {
        const url = TestData.validInputUrl;
        expect(url, isNot(equals(null)));
      });

      test('should not be equal to different type', () {
        const url = TestData.validInputUrl;
        const string = 'https://example.com';
        expect(url, isNot(equals(string)));
      });
    });

    group('edge cases', () {
      test('should handle URLs with special characters', () {
        const specialUrl =
            'https://example.com/path?query=value&other=test#fragment';
        const inputUrl = InputUrl(specialUrl);
        expect(inputUrl.url, equals(specialUrl));
      });

      test('should handle whitespace in URLs', () {
        const urlWithSpaces = ' https://example.com ';
        const inputUrl = InputUrl(urlWithSpaces);
        expect(inputUrl.url, equals(urlWithSpaces));
      });
    });
  });
}
