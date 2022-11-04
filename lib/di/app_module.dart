import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/constants/api_constants.dart';
import 'package:promina_task/core/data/interceptors/app_interceptor.dart';
import 'package:promina_task/di/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(getIt<AppInterceptor>());
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
