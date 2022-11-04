import 'package:dartz/dartz.dart';
import 'package:promina_task/core/domain/failure/failure.dart';
import 'package:promina_task/features/auth/domain/entities/login_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(LoginData loginEntity);

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, bool>> isLoggedIn();
}
