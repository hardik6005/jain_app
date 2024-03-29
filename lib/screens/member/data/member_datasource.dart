import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/http_response.dart';
import 'package:jain_app/screens/matrimonial/model/request_model.dart';
import 'package:jain_app/screens/member/model/member_request_model.dart';
import 'package:jain_app/utils/api_constant.dart';

class MemberDataSource extends HttpActions {
  MemberDataSource();

  // Add Social Profile API
  Future<HttpResponse?> addMemberAPI(MemberRequest request) async {

    final response = await postMethod(
      URLS.createMember,
      data: {
     "form_no" : request.form_no,
     "number_of_family_members" : request.number_of_family_members,
     "address" : request.address,
     "full_name" : request.full_name,
     "gender" : request.gender,
     "dob" : request.dob,
     "blood_group" : request.blood_group,
     "educational_qualification" : request.educational_qualification,
     "religious_education" : request.religious_education,
     "profession" : request.profession,
     "designation" : request.designation,
     "election_card_no" : request.election_card_no,
     "aadhar_card_no" : request.aadhar_card_no,
     "social_group1" : request.social_group1,
     "social_group2" : request.social_group2,
     "social_group3" : request.social_group3,
     "special_activity" : request.special_activity,
     "location" : request.location,
     "state_id" : request.state_id,
     "country_id" : request.country_id,
     "city" : request.city,
     "relation_with_hod" : request.relation_with_hod,
     "mobile_no" : request.mobile_no,
     "marital_status" : request.marital_status,
      },
    );
    return response;
  }




}
