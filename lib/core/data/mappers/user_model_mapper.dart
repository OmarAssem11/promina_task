import 'package:promina_task/core/data/models/user_model.dart';
import 'package:promina_task/core/domain/entities/user.dart';

extension UserModelMapper on UserModel {
  User get fromModel => User(
        name: name,
        email: email,
      );
}
