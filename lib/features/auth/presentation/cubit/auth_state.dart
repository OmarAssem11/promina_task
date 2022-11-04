import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.success() = AuthSuccess;
  const factory AuthState.error() = AuthError;
  const factory AuthState.loggedIn() = AuthLoggedIn;
  const factory AuthState.notLoggedIn() = AuthNotLoggedIn;
}
