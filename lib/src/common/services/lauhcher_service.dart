import 'package:dartz/dartz.dart';

import '../domain/failure.dart';

abstract interface class LauncherService {
  Future<Either<Failure, void>> launch(String url);
  Future<Either<Failure, bool>> canLaunch(String url);
}
