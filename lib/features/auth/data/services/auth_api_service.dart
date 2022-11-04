import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/constants/api_constants.dart';
import 'package:promina_task/features/auth/data/models/login_data_model/login_data_model.dart';
import 'package:promina_task/features/auth/data/models/login_response_model/login_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthAPIService {
  @factoryMethod
  factory AuthAPIService(Dio dio) = _AuthAPIService;

  @POST(APIConstants.loginEndpoint)
  Future<LoginResponseModel> login({
    @Body() required LoginDataModel loginDataModel,
  });
}
