import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/exceptions/app_exception.dart';
import 'package:promina_task/core/domain/failure/failure.dart';
import 'package:promina_task/core/domain/failure/return_failure.dart';
import 'package:promina_task/features/auth/data/datasources/local_datasource/auth_local_datasource.dart';
import 'package:promina_task/features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:promina_task/features/auth/data/mappers/login_data_mapper.dart';
import 'package:promina_task/features/auth/domain/entities/login_data.dart';
import 'package:promina_task/features/auth/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  const AuthRepositoryImpl(
    this._authRemoteDataSource,
    this._authLocalDataSource,
  );

  @override
  Future<Either<Failure, Unit>> login(LoginData loginEntity) async {
    try {
      final loginResponseModel =
          await _authRemoteDataSource.login(loginEntity.toModel);
      await _authLocalDataSource.saveToken(loginResponseModel.token);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _authLocalDataSource.deleteToken();
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final token = _authLocalDataSource.getToken();
      if (token == null) {
        return right(false);
      } else {
        return right(true);
      }
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }
}
