import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

abstract class Failure {}

@freezed
class RemoteFailure extends Failure with _$RemoteFailure {
  const factory RemoteFailure.unauthorized() = _Unauthorized;

  const factory RemoteFailure.noConnection() = _NoConnection;

  const factory RemoteFailure.serverError() = _ServerError;

  const factory RemoteFailure.notFound() = _NotFound;

  const factory RemoteFailure.timeout() = _Timeout;

  const factory RemoteFailure.forbidden() = _Forbidden;

  const factory RemoteFailure.unKnown() = _UnKnown;
}

@freezed
class LocalFailure extends Failure with _$LocalFailure {
  const factory LocalFailure.canNotAccess() = _CanNotAccess;
}
