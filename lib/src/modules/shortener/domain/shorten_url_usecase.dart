import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../common/domain/failure.dart';
import '../../../common/domain/input_url.dart';
import '../../../common/domain/input_url_validator.dart';
import '../../../common/domain/shortened_url.dart';
import 'shortener_repository.dart';

@LazySingleton()
class ShortenUrlUseCase {
  ShortenUrlUseCase(this.repository);

  final ShortenerRepository repository;

  Future<Either<Failure, ShortenedUrl>> call(InputUrl originalUrl) async {
    if (!originalUrl.isValid()) {
      return left(const Failure.invalidInput());
    }

    return repository.shorten(originalUrl);
  }
}
