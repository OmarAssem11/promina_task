import 'package:json_annotation/json_annotation.dart';

part 'login_data_model.g.dart';

@JsonSerializable()
class LoginDataModel {
  final String email;
  final String password;

  const LoginDataModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);
}
