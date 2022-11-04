import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/constants/key_constants.dart';
import 'package:promina_task/features/auth/data/datasources/local_datasource/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> saveToken(String token) =>
      _sharedPreferences.setString(KeyConstants.token, token);

  @override
  String? getToken() => _sharedPreferences.getString(KeyConstants.token);

  @override
  Future<void> deleteToken() => _sharedPreferences.remove(KeyConstants.token);
}
