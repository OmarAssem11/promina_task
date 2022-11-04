import 'dart:io';

import 'package:dio/dio.dart';
import 'package:promina_task/core/data/exceptions/app_exception.dart';

RemoteAppException returnRemoteAppException(Object exception) {
  if (exception is DioError) {
    switch (exception.response?.statusCode) {
      case HttpStatus.unauthorized:
        return const RemoteAppException.unauthorized();
      case HttpStatus.notFound:
        return const RemoteAppException.notFound();
      case HttpStatus.internalServerError:
        return const RemoteAppException.serverError();
      case HttpStatus.connectionClosedWithoutResponse:
        return const RemoteAppException.noConnection();
      case HttpStatus.requestTimeout:
        return const RemoteAppException.timeout();
      default:
        return const RemoteAppException.unKnown();
    }
  } else {
    return const RemoteAppException.unKnown();
  }
}
