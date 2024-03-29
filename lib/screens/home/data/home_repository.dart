import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';
import 'package:jain_app/screens/home/data/home_datasource.dart';
import 'package:jain_app/screens/home/model/drop_down_model.dart';
import 'package:jain_app/screens/matrimonial/model/matri_list_model.dart';
import 'package:jain_app/screens/member/model/business_list_model.dart';
import 'package:jain_app/screens/member/model/member_list_model.dart';
import 'package:jain_app/screens/profile/model/common_model.dart';
import 'package:jain_app/utils/string_constants.dart';

class HomeRepository {
  HomeRepository({
    required HomeDataSource dataSource,
  }) : _dataSource = dataSource;

  final HomeDataSource _dataSource;

  //Repository for My Profile API
  Future<ApiResult<CommonModel>> updateProfileAPI(
    String name,
    String email,
    String address,
    String imagePath,
  ) async {
    try {
      final result =
          await _dataSource.updateProfileAPI(name, email, address, imagePath);

      if (result!.statusCode == 200) {
        CommonModel response = CommonModel.fromJson(result.data);
        if (response.status ?? false) {
          return checkResponseStatusCode<CommonModel>(result, response);
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

  //Repository for Register API
  Future<ApiResult<UserDataModel>> getProfilePI() async {
    try {
      final result = await _dataSource.getProfilePI();

      if (result!.statusCode == 200) {
        UserDataModel response = UserDataModel.fromJson(result.data);
        if (response.status ?? false) {
          return checkResponseStatusCode<UserDataModel>(result, response);
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

  //Repository for Register API
  Future<ApiResult<MemberListModel>> getMemberList() async {
    try {
      final result = await _dataSource.getMemberList();

      if (result!.statusCode == 200) {
        MemberListModel response = MemberListModel.fromJson(result.data);
        if (response.status ?? false) {
          return checkResponseStatusCode<MemberListModel>(result, response);
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


   //Repository for Register API
  Future<ApiResult<BusinessListModel>> getBusinessListAPIEvent() async {
    try {
      final result = await _dataSource.getBusinessListAPIEvent();
      if (result!.statusCode == 200) {
        BusinessListModel response = BusinessListModel.fromJson(result.data);
        if (response.status ?? false) {
          return checkResponseStatusCode<BusinessListModel>(result, response);
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


   //Repository for Register API
  Future<ApiResult<MatriListModel>> getMatriListAPIEvent() async {
    try {
      final result = await _dataSource.getMatriListAPIEvent();
      if (result!.statusCode == 200) {
        MatriListModel response = MatriListModel.fromJson(result.data);
        if (response.status ?? false) {
          return checkResponseStatusCode<MatriListModel>(result, response);
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

   //Repository for Register API
  Future<ApiResult<dynamic>> dropDownAPIEvent() async {
    try {
      final result = await _dataSource.dropDownAPIEvent();
      if (result!.statusCode == 200) {
          return checkResponseStatusCode<dynamic>(result, result.data);
      } else {
        return ApiResult.failure(error: result.data["message"]);
      }
    } catch (e) {
      //final message = HandleAPI.handleAPIError(e);
      return const ApiResult.failure(error: AppConstants.somethingwentwrong);
    }
  }



}
