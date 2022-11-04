import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/domain/failure/failure.dart';
import 'package:promina_task/core/domain/params/no_params.dart';
import 'package:promina_task/core/domain/usecases/usecase.dart';
import 'package:promina_task/features/auth/domain/repository/auth_repository.dart';

@lazySingleton
class IsLoggedInUseCase implements UseCase<bool, NoParams> {
  final AuthRepository _authRepository;

  const IsLoggedInUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) =>
      _authRepository.isLoggedIn();
}
