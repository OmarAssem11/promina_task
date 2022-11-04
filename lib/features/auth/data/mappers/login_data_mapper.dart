import 'package:promina_task/features/auth/data/models/login_data_model/login_data_model.dart';
import 'package:promina_task/features/auth/domain/entities/login_data.dart';

extension LoginDataMapper on LoginData {
  LoginDataModel get toModel => LoginDataModel(
        email: email,
        password: password,
      );
}
