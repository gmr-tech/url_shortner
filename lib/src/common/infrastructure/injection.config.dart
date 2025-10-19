// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:share_plus/share_plus.dart' as _i998;

import '../../modules/shortener/domain/shortener_repository.dart' as _i815;
import '../../modules/shortener/infrastructure/shortener_respository_impl.dart'
    as _i600;
import 'external_modules.dart' as _i219;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalModules = _$ExternalModules();
    gh.lazySingleton<_i361.Dio>(() => externalModules.dio);
    gh.lazySingleton<_i998.SharePlus>(() => externalModules.sharePlus);
    gh.lazySingleton<_i815.ShortenerRepository>(
      () => _i600.ShortenerRepositoryImpl(gh<_i361.Dio>()),
    );
    return this;
  }
}

class _$ExternalModules extends _i219.ExternalModules {}
