import 'dart:convert';

import 'package:jain_app/screens/matrimonial/data/matri_datasource.dart';
import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/screens/matrimonial/model/request_model.dart';
import 'package:jain_app/screens/member/model/add_success_model.dart';
import 'package:jain_app/utils/string_constants.dart';


class MatriRepository {
  MatriRepository({
    required MatriDataSource dataSource,
  }) : _dataSource = dataSource;

  final MatriDataSource _dataSource;

  //Repository for Matri Profile API
  Future<ApiResult<AddSuccessModel>> matriProfileAPI(
      MatriRequestModel model) async {
    try {
      final result = await _dataSource.matriProfileAPI(model);

      if (result!.statusCode == 200) {
        AddSuccessModel response = AddSuccessModel.fromJson(result.data);
        if (response.status ?? false) {
          return checkResponseStatusCode<AddSuccessModel>(result, response);
        } else {
          return ApiResult.failure(error: response.message!);
        }
      } else {
        return ApiResult.failure(error: result.data["message"]);
      }

    } catch (e) {
      //final message = HandleAPI.handleAPIError(e);
      return const ApiResult.failure(error: AppConstants.somethingwentwrong);
    }
  }

}
