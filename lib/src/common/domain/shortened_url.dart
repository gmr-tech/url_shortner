import 'package:equatable/equatable.dart';

class ShortenedUrl extends Equatable {
  const ShortenedUrl({
    required this.aliasId,
    required this.originalUrl,
    required this.shortUrl,
    required this.createdAt,
  });

  final int aliasId;
  final String originalUrl;
  final String shortUrl;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
    aliasId,
    originalUrl,
    shortUrl,
  ];
}
