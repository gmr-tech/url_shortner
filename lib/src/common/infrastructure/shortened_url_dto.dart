import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/shortened_url.dart';

part 'shortened_url_dto.freezed.dart';
part 'shortened_url_dto.g.dart';

@freezed
abstract class ShortenedUrlDTO with _$ShortenedUrlDTO {
  const factory ShortenedUrlDTO({
    required int aliasId,
    required String originalUrl,
    required String shortUrl,
  }) = _ShortenedUrlDTO;

  const ShortenedUrlDTO._();

  factory ShortenedUrlDTO.fromJson(Map<String, dynamic> json) =>
      _$ShortenedUrlDTOFromJson(json);

  ShortenedUrl toDomain() => ShortenedUrl(
    aliasId: aliasId,
    originalUrl: originalUrl,
    shortUrl: shortUrl,
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  );
}
