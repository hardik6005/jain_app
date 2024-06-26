import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/screens/auth/data/login_datasource.dart';
import 'package:jain_app/screens/auth/model/forgot_request_model.dart';
import 'package:jain_app/screens/auth/model/login_model.dart';
import 'package:jain_app/screens/auth/model/success_model.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';
import 'package:jain_app/screens/member/model/add_success_model.dart';
import 'package:jain_app/screens/member/model/register_request_model.dart';
import 'package:jain_app/utils/string_constants.dart';


class LoginRepository {
  LoginRepository({
    required LoginDataSource dataSource,
  }) : _dataSource = dataSource;

  final LoginDataSource _dataSource;

  //Repository for Register API
  Future<ApiResult<LoginModel>> loginAPI(
      String phone, String password, String birthYear) async {
    try {
      final result = await _dataSource.loginAPI(phone, password, birthYear);

      if (result!.statusCode == 200) {
        LoginModel response = LoginModel.fromJson(result.data);
        if (response.status??false) {
          return checkResponseStatusCode<LoginModel>(result, response);
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
  Future<ApiResult<AddSuccessModel>> registerAPI(
      RegisterReqModel req) async {
    try {
      final result = await _dataSource.regirsterAPI(req);

      if (result!.statusCode == 200) {
        AddSuccessModel response = AddSuccessModel.fromJson(result.data);
        if (response.status??false) {
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
        if (response.status??false) {
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
