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

      /// Manual parsing due to the structure of the API response
      if (response.data is! Map<String, dynamic>) {
        return const Left(Failure.invalidData());
      }

      final data = response.data as Map<String, dynamic>;
      if (!data.containsKey('alias') || !data.containsKey('_links')) {
        return const Left(Failure.invalidData());
      }

      final aliasId = data['alias'];
      final links = data['_links'];
      if (links is! Map<String, dynamic>) {
        return const Left(Failure.invalidData());
      }
      if (!links.containsKey('self') || !links.containsKey('short')) {
        return const Left(Failure.invalidData());
      }

      return Right(
        ShortenedUrlDTO.fromJson({
          'aliasId': int.tryParse(aliasId.toString()) ?? 0,
          'originalUrl': links['self'].toString(),
          'shortUrl': links['short'].toString(),
        }).toDomain(),
      );
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return const Left(Failure.networkError());
        case DioExceptionType.badResponse:
          if (e.response?.statusCode != null &&
              e.response!.statusCode! >= 500) {
            return const Left(Failure.serverError());
          }
          return const Left(Failure.invalidData());
        case DioExceptionType.cancel:
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          return Left(Failure.unexpected(object: e));
      }
    } on FormatException {
      return const Left(Failure.invalidData());
    } on Exception catch (e) {
      return Left(Failure.unexpected(object: e));
    }
  }
}
