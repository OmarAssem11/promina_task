import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/domain/params/no_params.dart';
import 'package:promina_task/features/auth/domain/entities/login_data.dart';
import 'package:promina_task/features/auth/domain/usecases/is_logged_in_use_case.dart';
import 'package:promina_task/features/auth/domain/usecases/login_use_case.dart';
import 'package:promina_task/features/auth/domain/usecases/logout_use_case.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._loginUseCase,
    this._logoutUseCase,
    this._isLoggedInUseCase,
  ) : super(const AuthInitial());

  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final IsLoggedInUseCase _isLoggedInUseCase;

  Future<void> login(LoginData loginData) async {
    emit(const AuthLoading());
    final result = await _loginUseCase(
      LoginParams(loginData),
    );
    emit(
      result.fold(
        (failure) => const AuthError(),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _logoutUseCase(const NoParams());
    emit(
      result.fold(
        (failure) => const AuthError(),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> isLoggedIn() async {
    emit(const AuthLoading());
    final result = await _isLoggedInUseCase(const NoParams());
    emit(
      result.fold(
        (failure) => const AuthError(),
        (isLoggedIn) {
          if (isLoggedIn) {
            return const AuthLoggedIn();
          } else {
            return const AuthNotLoggedIn();
          }
        },
      ),
    );
  }
}
