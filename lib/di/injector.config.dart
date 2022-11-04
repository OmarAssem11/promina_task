// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../core/data/datasources/cache_helper.dart' as _i20;
import '../core/data/interceptors/app_interceptor.dart' as _i12;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i14;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource_impl.dart'
    as _i15;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i16;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource_impl.dart'
    as _i17;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i19;
import '../features/auth/data/services/auth_api_service.dart' as _i13;
import '../features/auth/domain/repository/auth_repository.dart' as _i18;
import '../features/auth/domain/usecases/is_logged_in_use_case.dart' as _i22;
import '../features/auth/domain/usecases/login_use_case.dart' as _i23;
import '../features/auth/domain/usecases/logout_use_case.dart' as _i24;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i25;
import '../features/gallery/data/datasources/remote_datasource/gallery_remote_datasource.dart'
    as _i5;
import '../features/gallery/data/datasources/remote_datasource/gallery_remote_datasource_impl.dart'
    as _i6;
import '../features/gallery/data/repository/galllery_repository_impl.dart'
    as _i8;
import '../features/gallery/data/services/gallery_api_service.dart' as _i4;
import '../features/gallery/domain/repository/gallery_repository.dart' as _i7;
import '../features/gallery/domain/usecases/get_gallery_use_case.dart' as _i9;
import '../features/gallery/domain/usecases/upload_image_use_case.dart' as _i11;
import '../features/gallery/presentation/cubit/gallery_cubit.dart' as _i21;
import 'app_module.dart' as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.Dio>(() => appModule.dio);
  gh.lazySingleton<_i4.GalleryAPIService>(
      () => _i4.GalleryAPIService(get<_i3.Dio>()));
  gh.lazySingleton<_i5.GalleryRemoteDataSource>(
      () => _i6.GalleryRemoteDataSourceImpl(get<_i4.GalleryAPIService>()));
  gh.lazySingleton<_i7.GalleryRepository>(
      () => _i8.GalleryRepositoryImpl(get<_i5.GalleryRemoteDataSource>()));
  gh.lazySingleton<_i9.GetGalleryUseCase>(
      () => _i9.GetGalleryUseCase(get<_i7.GalleryRepository>()));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i11.UploadImageUseCase>(
      () => _i11.UploadImageUseCase(get<_i7.GalleryRepository>()));
  gh.lazySingleton<_i12.AppInterceptor>(
      () => _i12.AppInterceptor(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i13.AuthAPIService>(
      () => _i13.AuthAPIService(get<_i3.Dio>()));
  gh.lazySingleton<_i14.AuthLocalDataSource>(
      () => _i15.AuthLocalDataSourceImpl(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i16.AuthRemoteDataSource>(
      () => _i17.AuthRemoteDataSourceImpl(get<_i13.AuthAPIService>()));
  gh.lazySingleton<_i18.AuthRepository>(() => _i19.AuthRepositoryImpl(
        get<_i16.AuthRemoteDataSource>(),
        get<_i14.AuthLocalDataSource>(),
      ));
  gh.singleton<_i20.CacheHelper>(
      _i20.CacheHelperImpl(get<_i10.SharedPreferences>()));
  gh.factory<_i21.GalleryCubit>(() => _i21.GalleryCubit(
        get<_i9.GetGalleryUseCase>(),
        get<_i11.UploadImageUseCase>(),
      ));
  gh.lazySingleton<_i22.IsLoggedInUseCase>(
      () => _i22.IsLoggedInUseCase(get<_i18.AuthRepository>()));
  gh.lazySingleton<_i23.LoginUseCase>(
      () => _i23.LoginUseCase(get<_i18.AuthRepository>()));
  gh.lazySingleton<_i24.LogoutUseCase>(
      () => _i24.LogoutUseCase(get<_i18.AuthRepository>()));
  gh.factory<_i25.AuthCubit>(() => _i25.AuthCubit(
        get<_i23.LoginUseCase>(),
        get<_i24.LogoutUseCase>(),
        get<_i22.IsLoggedInUseCase>(),
      ));
  return get;
}

class _$AppModule extends _i26.AppModule {}
