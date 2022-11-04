import 'package:json_annotation/json_annotation.dart';
import 'package:promina_task/core/data/models/user_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'user')
  final UserModel userModel;
  final String token;

  const LoginResponseModel({
    required this.userModel,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
