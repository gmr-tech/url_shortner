import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

import 'api_constants.dart';

@module
abstract class ExternalModules {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.timeoutDuration,
      receiveTimeout: ApiConstants.receiveTimeoutDuration,
    ),
  );

  @lazySingleton
  SharePlus get sharePlus => SharePlus.instance;
}
