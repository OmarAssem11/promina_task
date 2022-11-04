import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/constants/api_constants.dart';
import 'package:promina_task/core/data/constants/key_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppInterceptor extends Interceptor {
  final SharedPreferences _sharedPreferences;

  AppInterceptor(this._sharedPreferences);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = _sharedPreferences.getString(KeyConstants.token);
    if (token != null) {
      options.headers.addAll({
        APIConstants.authorization: '${APIConstants.tokenType} $token',
      });
    }
    handler.next(options);
  }
}
