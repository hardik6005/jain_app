import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/screens/auth/data/login_datasource.dart';
import 'package:jain_app/screens/auth/model/forgot_request_model.dart';
import 'package:jain_app/screens/auth/model/success_model.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';
import 'package:jain_app/utils/string_constants.dart';


class LoginRepository {
  LoginRepository({
    required LoginDataSource dataSource,
  }) : _dataSource = dataSource;

  final LoginDataSource _dataSource;

  //Repository for Register API
  Future<ApiResult<UserDataModel>> loginAPI(
      String memberId, String password) async {
    try {
      final result = await _dataSource.loginAPI(memberId, password);

      if (result!.statusCode == 200) {
        UserDataModel response = UserDataModel.fromJson(result.data);
        if (!response.error!) {
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

  //Repository for Forgot Password API
  Future<ApiResult<SuccessModel>> forgotPasswordAPI(
      String memberId, String email) async {
    try {
      final result = await _dataSource.forgotPasswordAPI(memberId, email);

      if (result!.statusCode == 200) {
        SuccessModel response = SuccessModel.fromJson(result.data);
        if (!response.error!) {
          return checkResponseStatusCode<SuccessModel>(result, response);
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

  //Repository for Reset Password API
  Future<ApiResult<SuccessModel>> resetPasswordAPI(
      ForgotRequestModel model) async {
    try {
      final result = await _dataSource.resetPasswordAPI(model);

      if (result!.statusCode == 200) {
        SuccessModel response = SuccessModel.fromJson(result.data);
        if (!response.error!) {
          return checkResponseStatusCode<SuccessModel>(result, response);
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
        if (!response.error!) {
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
}
