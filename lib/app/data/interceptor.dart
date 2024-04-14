import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:dust_buster/app/common/values/strings.dart';
import '../common/util/utils.dart';
import 'errors/api_error.dart';

FutureOr interceptor(
  GetHttpClient httpClient,
  Request request,
  Response<Object?> response,
) {
  Utils.closeDialog();

  Get.printInfo(
    info: 'Status Code: ${response.statusCode}\n'
        'Data: ${response.bodyString?.toString() ?? ''}',
  );

  final status = response.status;

  if (status.connectionError) {
    showError(ApiError(
      type: ErrorType.noConnection,
      error: Strings.noConnection,
    ));
  }

  try {
    final res = jsonDecode(response.bodyString!);

    if (response.isOk) {
      return response;
    } else {
      if (status.isServerError) {
        showError(ApiError());
      } else if (status.code == HttpStatus.requestTimeout) {
        showError(ApiError(
          type: ErrorType.connectTimeout,
          error: Strings.connectionTimeout,
        ));
      } else if (response.unauthorized) {
        showError(ApiError(
          type: ErrorType.unauthorize,
          error: res["message"]?.toString() ?? Strings.unauthorize,
        ));
      } else {
        // final ErrorModel model = ErrorModel.fromJson(res);
        final error = res["message"];

        showError(ApiError(
          type: ErrorType.response,
          error: error ?? Strings.unknownError,
        ));
      }
    }
  } on FormatException {
    showError(ApiError(
      type: ErrorType.unknownError,
      error: Strings.unknownError,
    ));
  } on TimeoutException catch (e) {
    showError(ApiError(
      type: ErrorType.connectTimeout,
      error: e.message?.toString() ?? Strings.connectionTimeout,
    ));
  }
}

showError(ApiError error) {
  return throw (error.message);
}
