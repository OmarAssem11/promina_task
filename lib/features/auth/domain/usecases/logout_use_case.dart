import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/domain/failure/failure.dart';
import 'package:promina_task/core/domain/params/no_params.dart';
import 'package:promina_task/core/domain/usecases/usecase.dart';
import 'package:promina_task/features/auth/domain/repository/auth_repository.dart';

@lazySingleton
class LogoutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository _authRepository;
  const LogoutUseCase(this._authRepository);
  @override
  Future<Either<Failure, Unit>> call(NoParams noParams) =>
      _authRepository.logout();
}
