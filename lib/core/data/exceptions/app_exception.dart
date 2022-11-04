import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

abstract class AppException {}

@freezed
class RemoteAppException extends AppException with _$RemoteAppException {
  const factory RemoteAppException.unauthorized() = _Unauthorized;

  const factory RemoteAppException.notFound() = _NotFound;

  const factory RemoteAppException.serverError() = _ServerError;

  const factory RemoteAppException.noConnection() = _NoConnection;

  const factory RemoteAppException.timeout() = _Timeout;

  const factory RemoteAppException.forbidden() = _Forbidden;

  const factory RemoteAppException.unKnown() = _UnKnown;
}

@freezed
class LocalAppException extends AppException with _$LocalAppException {
  const factory LocalAppException.canNotAccess() = _CanNotAccess;
}
