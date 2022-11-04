import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/exceptions/return_app_exception.dart';
import 'package:promina_task/features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:promina_task/features/auth/data/models/login_data_model/login_data_model.dart';
import 'package:promina_task/features/auth/data/models/login_response_model/login_response_model.dart';
import 'package:promina_task/features/auth/data/services/auth_api_service.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthAPIService _authAPIService;

  const AuthRemoteDataSourceImpl(this._authAPIService);

  @override
  Future<LoginResponseModel> login(LoginDataModel loginDataModel) async {
    try {
      return await _authAPIService.login(
        loginDataModel: loginDataModel,
      );
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }
}
