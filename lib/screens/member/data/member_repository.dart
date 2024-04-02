import 'dart:convert';

import 'package:jain_app/screens/auth/model/login_model.dart';
import 'package:jain_app/screens/auth/model/success_model.dart';
import 'package:jain_app/screens/business/model/business_request_model.dart';
import 'package:jain_app/screens/matrimonial/data/matri_datasource.dart';
import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/screens/member/data/member_datasource.dart';
import 'package:jain_app/screens/member/model/add_success_model.dart';
import 'package:jain_app/screens/member/model/member_request_model.dart';
import 'package:jain_app/utils/string_constants.dart';


class MemberRepository {
  MemberRepository({
    required MemberDataSource dataSource,
  }) : _dataSource = dataSource;

  final MemberDataSource _dataSource;

  Future<ApiResult<AddSuccessModel>> addBusinessAPI(BusinessRequest request) async {
    try {
      final result = await _dataSource.addBusinessAPI(request);

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


  //Repository for Get Social Profile API
  Future<ApiResult<AddSuccessModel>> addMemberAPI(MemberRequest request) async {
    try {
      final result = await _dataSource.addMemberAPI(request);

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
