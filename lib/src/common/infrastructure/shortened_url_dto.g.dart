// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortened_url_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShortenedUrlDTO _$ShortenedUrlDTOFromJson(Map<String, dynamic> json) =>
    _ShortenedUrlDTO(
      aliasId: (json['aliasId'] as num).toInt(),
      originalUrl: json['originalUrl'] as String,
      shortUrl: json['shortUrl'] as String,
    );

Map<String, dynamic> _$ShortenedUrlDTOToJson(_ShortenedUrlDTO instance) =>
    <String, dynamic>{
      'aliasId': instance.aliasId,
      'originalUrl': instance.originalUrl,
      'shortUrl': instance.shortUrl,
    };
