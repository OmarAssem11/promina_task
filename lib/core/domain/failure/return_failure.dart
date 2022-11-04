import 'package:promina_task/core/data/exceptions/app_exception.dart';
import 'package:promina_task/core/domain/failure/failure.dart';

Failure returnFailure(AppException appException) {
  if (appException is RemoteAppException) {
    return appException.map(
      unauthorized: (_) => const RemoteFailure.unauthorized(),
      notFound: (_) => const RemoteFailure.notFound(),
      serverError: (_) => const RemoteFailure.serverError(),
      noConnection: (_) => const RemoteFailure.noConnection(),
      timeout: (_) => const RemoteFailure.timeout(),
      forbidden: (_) => const RemoteFailure.forbidden(),
      unKnown: (_) => const RemoteFailure.unKnown(),
    );
  } else {
    appException as LocalAppException;
    return appException.map(
      canNotAccess: (_) => const LocalFailure.canNotAccess(),
    );
  }
}
