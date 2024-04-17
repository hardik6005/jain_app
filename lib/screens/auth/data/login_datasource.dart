import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/http_response.dart';
import 'package:jain_app/screens/auth/model/forgot_request_model.dart';
import 'package:jain_app/screens/member/model/register_request_model.dart';
import 'package:jain_app/utils/api_constant.dart';


class LoginDataSource extends HttpActions {
  LoginDataSource();

  // loginAPI API
  Future<HttpResponse?> loginAPI(String phone, String password, String birthYear) async {
    final response = await postMethod(
      URLS.memberLogin,
      data: {
        PARAMS.phone_number: phone,
        PARAMS.password: password,
        PARAMS.birth_year: birthYear,
      },
    );
    return response;
  }


  // loginAPI API
  Future<HttpResponse?> regirsterAPI(RegisterReqModel req) async {
    final response = await postMethod(
      URLS.register,
      data: {
        'head_off_family_full_name': req.head_off_family_full_name,
        "number_of_family_members": req.number_of_family_members,
        "address": req.address,
        "sangh_id": req.sangh_id,
        "mobile_number": req.mobile_number,
        "gender": req.gender,
        "date_of_birth": req.date_of_birth,
        "marital_status": req.marital_status,
        "blood_group": req.blood_group,
        "samaj_caste": req.samaj_caste,
        "educational_qualification": req.educational_qualification,
        "religious_qualification": req.religious_qualification,
        "profession": req.profession,
        "designation": req.designation,
        "aadhar_card_no": req.aadhar_card_no,
        "special_activity": req.special_activity,
        "location": req.location,
        "state_id": req.state_id,
        "country_id": req.country_id,
        "city": req.city,
        "is_agreed": 1,
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
