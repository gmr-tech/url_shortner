import 'package:flutter_test/flutter_test.dart';

import 'package:url_shortener/src/common/domain/shortened_url.dart';
import '../../../helpers/test_data.dart';

void main() {
  group('ShortenedUrl', () {
    group('constructor', () {
      test('should create ShortenedUrl with all required properties', () {
        const aliasId = 123;
        const originalUrl = 'https://example.com';
        const shortUrl = 'https://short.ly/abc123';
        final createdAt = DateTime(2025);

        final shortenedUrl = ShortenedUrl(
          aliasId: aliasId,
          originalUrl: originalUrl,
          shortUrl: shortUrl,
          createdAt: createdAt,
        );

        expect(shortenedUrl.aliasId, equals(aliasId));
        expect(shortenedUrl.originalUrl, equals(originalUrl));
        expect(shortenedUrl.shortUrl, equals(shortUrl));
        expect(shortenedUrl.createdAt, equals(createdAt));
      });
    });

    group('equality', () {
      test('should be equal when all identifying props are the same', () {
        final url1 = TestData.shortenedUrl;
        final url2 = ShortenedUrl(
          aliasId: 123,
          originalUrl: 'https://example.com',
          shortUrl: 'https://short.ly/abc123',
          createdAt: DateTime(2025, 1, 1, 12),
        );

        expect(url1, equals(url2));
        expect(url1.hashCode, equals(url2.hashCode));
      });

      test('should be equal even when createdAt differs', () {
        final url1 = TestData.shortenedUrl;
        final url2 = TestData.shortenedUrlDifferentTime;

        expect(url1, equals(url2));
      });

      test('should not be equal when aliasId differs', () {
        final url1 = TestData.shortenedUrl;
        final url2 = TestData.shortenedUrlDifferentId;

        expect(url1, isNot(equals(url2)));
        expect(url1.hashCode, isNot(equals(url2.hashCode)));
      });

      test('should not be equal when originalUrl differs', () {
        final url1 = TestData.shortenedUrl;
        final url2 = TestData.shortenedUrlDifferentOriginal;

        expect(url1, isNot(equals(url2)));
        expect(url1.hashCode, isNot(equals(url2.hashCode)));
      });

      test('should not be equal when shortUrl differs', () {
        final url1 = TestData.shortenedUrl;
        final url2 = TestData.shortenedUrlDifferentShort;

        expect(url1, isNot(equals(url2)));
        expect(url1.hashCode, isNot(equals(url2.hashCode)));
      });

      test('should not be equal to null', () {
        final url = TestData.shortenedUrl;

        expect(url, isNot(equals(null)));
      });

      test('should not be equal to different type', () {
        final url = TestData.shortenedUrl;
        const string = 'https://example.com';

        expect(url, isNot(equals(string)));
      });
    });

    group('props', () {
      test('should include aliasId, originalUrl, and shortUrl in props', () {
        final shortenedUrl = TestData.shortenedUrl;

        final props = shortenedUrl.props;

        expect(props, contains(shortenedUrl.aliasId));
        expect(props, contains(shortenedUrl.originalUrl));
        expect(props, contains(shortenedUrl.shortUrl));
        expect(props.length, equals(3));
      });

      test('should not include createdAt in props for equality', () {
        final shortenedUrl = TestData.shortenedUrl;

        final props = shortenedUrl.props;

        expect(props, isNot(contains(shortenedUrl.createdAt)));
      });
    });

    group('immutability', () {
      test('should be immutable value object', () {
        final shortenedUrl = TestData.shortenedUrl;

        // Properties should be final (compile-time check)
        expect(shortenedUrl.aliasId, equals(123));
        expect(shortenedUrl.originalUrl, equals('https://example.com'));
        expect(shortenedUrl.shortUrl, equals('https://short.ly/abc123'));
        expect(shortenedUrl.createdAt, equals(DateTime(2025, 1, 1, 12)));
      });
    });

    group('edge cases', () {
      test('should handle empty URLs', () {
        final shortenedUrl = ShortenedUrl(
          aliasId: 0,
          originalUrl: '',
          shortUrl: '',
          createdAt: DateTime.now(),
        );

        expect(shortenedUrl.aliasId, equals(0));
        expect(shortenedUrl.originalUrl, equals(''));
        expect(shortenedUrl.shortUrl, equals(''));
      });

      test('should handle negative aliasId', () {
        final shortenedUrl = ShortenedUrl(
          aliasId: -1,
          originalUrl: 'https://example.com',
          shortUrl: 'https://short.ly/abc',
          createdAt: DateTime.now(),
        );

        expect(shortenedUrl.aliasId, equals(-1));
      });

      test('should handle very long URLs', () {
        final longUrl = 'https://example.com/${'a' * 1000}';
        final longShortUrl = 'https://short.ly/${'b' * 100}';

        final shortenedUrl = ShortenedUrl(
          aliasId: 999999,
          originalUrl: longUrl,
          shortUrl: longShortUrl,
          createdAt: DateTime.now(),
        );

        expect(shortenedUrl.originalUrl, equals(longUrl));
        expect(shortenedUrl.shortUrl, equals(longShortUrl));
      });
    });
  });
}
