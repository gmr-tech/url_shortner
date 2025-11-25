import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/failure.dart';
import 'lauhcher_service.dart';

@LazySingleton(as: LauncherService)
class LauncherServiceImpl implements LauncherService {
  @override
  Future<Either<Failure, bool>> canLaunch(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      final canLaunchResult = await canLaunchUrl(uri);
      return right(canLaunchResult);
    } on Exception catch (e) {
      return left(Failure.unexpected(object: e));
    } on Error catch (e) {
      return left(Failure.unexpected(object: e));
    }
  }

  @override
  Future<Either<Failure, void>> launch(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      await launchUrl(uri);
      return right(null);
    } on Exception catch (e) {
      return left(Failure.unexpected(object: e));
    } on Error catch (e) {
      return left(Failure.unexpected(object: e));
    }
  }
}
