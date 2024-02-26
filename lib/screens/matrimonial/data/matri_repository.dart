import 'dart:convert';

import 'package:jain_app/screens/matrimonial/data/matri_datasource.dart';
import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/http_common/app_http.dart';


class MatriRepository {
  MatriRepository({
    required MatriDataSource dataSource,
  }) : _dataSource = dataSource;

  final MatriDataSource _dataSource;

/*  //Repository for Get Social Profile API
  Future<ApiResult<SocialProfileDataModel>> getSocialProfileAPI() async {
    try {
      final result = await _dataSource.getSocialProfileAPI();

      if (result!.statusCode == 200) {
        SocialProfileDataModel response =
            SocialProfileDataModel.fromJson(result.data);
        if (!response.error!) {
          return checkResponseStatusCode<SocialProfileDataModel>(
              result, response);
        } else {
          return ApiResult.failure(error: response.message!);
        }
      } else {
        return ApiResult.failure(error: result.data["data"]);
      }
    } catch (e) {
      //final message = HandleAPI.handleAPIError(e);
      return const ApiResult.failure(error: AppConstants.somethingwentwrong);
    }
  }

  //Repository for Get Social Profile API
  Future<ApiResult<BusinessProfileAddModel>> getBusinessProfileAPI() async {
    try {
      final result = await _dataSource.getBusinessProfileAPI();

      if (result!.statusCode == 200) {
        BusinessProfileAddModel response =
            BusinessProfileAddModel.fromJson(result.data);
        if (!response.error!) {
          return checkResponseStatusCode<BusinessProfileAddModel>(
              result, response);
        } else {
          return ApiResult.failure(error: response.message!);
        }
      } else {
        return ApiResult.failure(error: result.data["data"]);
      }
    } catch (e) {
      //final message = HandleAPI.handleAPIError(e);
      return const ApiResult.failure(error: AppConstants.somethingwentwrong);
    }
  }

  //Repository for Business Profile API
  Future<ApiResult<BusinessProfileAddModel>> businessProfileAPI(
      BusinessRequestModel model) async {
    try {
      final result = await _dataSource.businessProfileAPI(model);
      if (result!.statusCode == 200) {
        BusinessProfileAddModel response =
            BusinessProfileAddModel.fromJson(result.data);
        if (!response.error!) {
          return checkResponseStatusCode<BusinessProfileAddModel>(
              result, response);
        } else {
          return ApiResult.failure(error: response.message!);
        }
      } else {
        return ApiResult.failure(error: result.data["data"]);
      }
    } catch (e) {
      //final message = HandleAPI.handleAPIError(e);
      return const ApiResult.failure(error: AppConstants.somethingwentwrong);
    }
  }

  //Repository for Matri Profile API
  Future<ApiResult<AddMatriMonialDataModel>> matriProfileAPI(
      MatriRequestModel model) async {
    try {
      final result = await _dataSource.matriProfileAPI(model);
      if (result!.statusCode == 200) {
        AddMatriMonialDataModel response =
            AddMatriMonialDataModel.fromJson(result.data);
        if (!response.error!) {
          return checkResponseStatusCode<AddMatriMonialDataModel>(
              result, response);
        } else {
          return ApiResult.failure(error: response.message!);
        }
      } else {
        return ApiResult.failure(error: result.data["data"]);
      }
    } catch (e) {
      //final message = HandleAPI.handleAPIError(e);
      return const ApiResult.failure(error: AppConstants.somethingwentwrong);
    }
  }
  */
}
