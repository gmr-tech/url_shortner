import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../common/domain/failure.dart';
import '../../../common/domain/input_url.dart';
import '../../../common/domain/shortened_url.dart';
import '../../../common/infrastructure/shortened_url_dto.dart';
import '../domain/shortener_repository.dart';

@LazySingleton(as: ShortenerRepository)
class ShortenerRepositoryImpl implements ShortenerRepository {
  ShortenerRepositoryImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<Either<Failure, ShortenedUrl>> shortenUrl(InputUrl originalUrl) async {
    final response = await dio.post('/shorten', data: originalUrl.url);

    final data = response.data as Map<String, dynamic>;

    return Right(ShortenedUrlDTO.fromJson(data).toDomain());
  }
}
