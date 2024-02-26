// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:jain_app/http_common/error_model.dart';
import 'package:jain_app/http_common/http_response.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/string_constants.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required String error}) = Failure<T>;
}

class HandleAPI {
  static String handleAPIError(e) {
    try {
      if (e.toString().contains(
          "(OS Error: No address associated with hostname, errno = 7)")) {
        return AppConstants.nointernet;
      }
      return e.toString();
    } catch (e) {
      return AppConstants.somethingwentwrong;
    }
  }

  static String checkStatusCode(HttpResponse response) {
    if (response.data.toString().contains('error_message')) {
      ErrorModel model = ErrorModel.fromJson(response.data);

      if (model == null) {
        return "1";
      } else {
        printLog("Display Alert dialog here.");
        return model.error!.errorMessage!;
      }
    } else {
      return "1";
    }
  }

  static String checkStatusCodeMultipart(Response response) {
    if (response.body.toString().contains('error_message')) {
      ErrorModel model = ErrorModel.fromJson(json.decode(response.body));

      if (model == null) {
        return "1";
      } else {
        printLog("Display Alert dialog here.");
        return model.error!.errorMessage!;
      }
    } else {
      return "1";
    }
  }
}
