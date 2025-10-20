// ignore_for_file: avoid_classes_with_only_static_members

import 'package:url_shortener/src/common/domain/input_url.dart';
import 'package:url_shortener/src/common/domain/shortened_url.dart';

class TestData {
  static const validInputUrl = InputUrl('https://example.com');
  static const validInputUrlWithPath = InputUrl('https://example.com/path');
  static const validInputUrlWithQuery = InputUrl(
    'https://example.com?param=value',
  );
  static const validHttpInputUrl = InputUrl('http://example.com');
  static const validComplexUrl = InputUrl(
    'https://subdomain.example.com:8080/path?query=value#fragment',
  );

  static const emptyInputUrl = InputUrl('');
  static const whitespaceInputUrl = InputUrl('   ');
  static const invalidInputUrl = InputUrl('not-a-url');
  static const malformedInputUrl = InputUrl('https://');
  static const spacesInputUrl = InputUrl('https://exa mple.com');
  static const reallyInvalidInputUrl = InputUrl(
    'http://[',
  );

  static final shortenedUrl = ShortenedUrl(
    aliasId: 123,
    originalUrl: 'https://example.com',
    shortUrl: 'https://short.ly/abc123',
    createdAt: DateTime(2025, 1, 1, 12),
  );

  static final shortenedUrlDifferentTime = ShortenedUrl(
    aliasId: 123,
    originalUrl: 'https://example.com',
    shortUrl: 'https://short.ly/abc123',
    createdAt: DateTime(2025, 1, 2, 15, 30),
  );

  static final shortenedUrlDifferentId = ShortenedUrl(
    aliasId: 456,
    originalUrl: 'https://example.com',
    shortUrl: 'https://short.ly/abc123',
    createdAt: DateTime(2025, 1, 1, 12),
  );

  static final shortenedUrlDifferentOriginal = ShortenedUrl(
    aliasId: 123,
    originalUrl: 'https://different.com',
    shortUrl: 'https://short.ly/abc123',
    createdAt: DateTime(2025, 1, 1, 12),
  );

  static final shortenedUrlDifferentShort = ShortenedUrl(
    aliasId: 123,
    originalUrl: 'https://example.com',
    shortUrl: 'https://short.ly/xyz789',
    createdAt: DateTime(2025, 1, 1, 12),
  );
}
