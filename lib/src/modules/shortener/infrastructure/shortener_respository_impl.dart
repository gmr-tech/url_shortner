import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../common/domain/failure.dart';
import '../../../common/domain/input_url.dart';
import '../../../common/domain/shortened_url.dart';
import '../../../common/infrastructure/api_constants.dart';
import '../../../common/infrastructure/shortened_url_dto.dart';
import '../domain/shortener_repository.dart';

@LazySingleton(as: ShortenerRepository)
class ShortenerRepositoryImpl implements ShortenerRepository {
  ShortenerRepositoryImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<Either<Failure, ShortenedUrl>> shorten(InputUrl originalUrl) async {
    try {
      final response = await dio.post(
        ApiConstants.shortenEndpoint,
        data: {'url': originalUrl.url},
      );

      final data = response.data as Map<String, dynamic>;
      final aliasId = data['alias'];
      final links = data['_links'] as Map<String, dynamic>;

      return Right(
        ShortenedUrlDTO.fromJson({
          'aliasId': int.tryParse(aliasId) ?? 0,
          'originalUrl': links['self'],
          'shortUrl': links['short'],
        }).toDomain(),
      );
    } on Exception catch (e) {
      return Left(Failure.unexpected(object: e));
    }
  }
}
