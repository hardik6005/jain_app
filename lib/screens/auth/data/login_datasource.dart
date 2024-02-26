import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/http_response.dart';
import 'package:jain_app/screens/auth/model/forgot_request_model.dart';
import 'package:jain_app/utils/api_constant.dart';


class LoginDataSource extends HttpActions {
  LoginDataSource();

  // loginAPI API
  Future<HttpResponse?> loginAPI(String memberId, String password) async {
    final response = await postMethod(
      URLS.mobileLogin,
      data: {
        PARAMS.memberId: memberId,
        PARAMS.password: password,
      },
    );
    return response;
  }

  // getProfile API
  Future<HttpResponse?> getProfilePI() async {
    final response = await getMethod(
      URLS.getProfile,
    );
    return response;
  }

  // Forgot password API
  Future<HttpResponse?> forgotPasswordAPI(String memberId, String email) async {
    final response = await postMethod(
      URLS.mobileForgotPassword,
      data: {
        PARAMS.memberId: memberId,
        PARAMS.emailId: email,
      },
    );
    return response;
  }

  // Forgot password API
  Future<HttpResponse?> resetPasswordAPI(ForgotRequestModel model) async {
    print("DSDSDSDSDSD---${model.password}");
    final response = await postMethod(
      URLS.mobileResetPassword,
      data: {
        PARAMS.memberId: model.memebrId,
        PARAMS.emailId: model.email,
        PARAMS.otp: model.otp,
        PARAMS.password: model.password,
        PARAMS.passwordConfirmation: model.confPassword,
      },
    );
    return response;
  }

}
