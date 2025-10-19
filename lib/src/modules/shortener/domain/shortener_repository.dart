import 'package:dartz/dartz.dart';

import '../../../common/domain/failure.dart';
import '../../../common/domain/input_url.dart';
import '../../../common/domain/shortened_url.dart';

abstract interface class ShortenerRepository {
  Future<Either<Failure, ShortenedUrl>> shortenUrl(InputUrl originalUrl);
}
