import 'package:promina_task/features/auth/data/models/login_data_model/login_data_model.dart';
import 'package:promina_task/features/auth/data/models/login_response_model/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginDataModel loginDataModel);
}
