import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/http_response.dart';
import 'package:jain_app/screens/profile/model/profile_request_model.dart';
import 'package:jain_app/utils/api_constant.dart';

class ProfileDataSource extends HttpActions {
  ProfileDataSource();

  // profile add API
  Future<HttpResponse?> addProfileAPI(ProfileRequestModel model) async {
    final response = await postMultipartAPIFormDataCall(
        URLS.memberProfile,
        {
          PARAMS.memberId: model.member_id,
          PARAMS.jobId: model.jobId,
          PARAMS.job_specified: model.job_specified,
          PARAMS.education_id: model.education_id,
          PARAMS.education_detail: model.education_detail,
          PARAMS.home_number: model.home_number,
          PARAMS.office_number: model.office_number,
          PARAMS.office_email: model.office_email,
          PARAMS.approx_salary: model.approx_salary,
          //matrimonial key
          PARAMS.matrimonial_directorys_contact_info: model.matrimonial_directorys_contact_info,
          PARAMS.matrimonial_directorys_email_id: model.matrimonial_directorys_email_id,
          PARAMS.matrimonial_directorys_salary: model.matrimonial_directorys_salary,
          PARAMS.matrimonial_directorys_visiting_card: model.matrimonial_directorys_visiting_card,
          //member key
          PARAMS.member_directorys_contact_info: model.member_directorys_contact_info,
          PARAMS.member_directorys_email_id: model.member_directorys_email_id,
          PARAMS.member_directorys_salary: model.member_directorys_salary,
          PARAMS.member_directorys_visiting_card: model.member_directorys_visiting_card,
        },
        fileName: "visiting_card",
        filePath:
            model.visitingCardPath != null ? model.visitingCardPath!.path : "");

    return response;
  }
}
