import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/http_response.dart';
import 'package:jain_app/screens/business/model/business_request_model.dart';
import 'package:jain_app/screens/job/model/search_job_request.dart';
import 'package:jain_app/screens/matrimonial/model/request_model.dart';
import 'package:jain_app/screens/member/model/member_request_model.dart';
import 'package:jain_app/utils/api_constant.dart';

class MemberDataSource extends HttpActions {
  MemberDataSource();

  // Add Social Profile API
  Future<HttpResponse?> addMemberAPI(MemberRequest request) async {

    Map<String, String?> req = requestMember(request: request);

    if(request.sanghs!=null && request.sanghs!.isNotEmpty){
     Map<String, String?> sanghh = {"sanghs" : request.sanghs};
     req.addAll(sanghh);
    }

    if((request.location == "In India")){
      Map<String, String?> sanghh = {"state_id" : request.state_id.toString()};
      req.addAll(sanghh);

    }else{
      Map<String, String?> sanghh = {"country_id" : request.state_id};
      req.addAll(sanghh);
    }

    final response = await postMethod(
      (request.id!=null)?URLS.updateMember:URLS.createMember,
      data: req,
    );
    return response;
  }

  Map<String, String?> requestMember({required MemberRequest request}) {
    return {
   "id" : request.id,
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
   // "state_id" : (request.location == "In India")?request.state_id:"",
   // "country_id" : (request.location == "In India")?"":request.state_id,
   "city" : request.city,
   "relation_with_hod" : request.relation_with_hod,
   "mobile_no" : request.mobile_no,
   "marital_status" : request.marital_status,
    };
  }


  Future<HttpResponse?> addBusinessAPI(BusinessRequest request) async {

    print("DDDDDDDDDD : ${request.business_title}");
    final response = await postAPICallWithMultipartArray(
      request.id!=null?URLS.baseUrl+URLS.updateBusinessDir+request.id!:URLS.baseUrl+URLS.createBusinessDir,
      {
        PARAMS.business_title : request.business_title,
        PARAMS.owner_name : request.owner_name,
        PARAMS.mobile_number : request.mobile_number,
        PARAMS.business_category_id : request.business_category_id,
        PARAMS.state_id : request.state_id,
        PARAMS.city_id : request.city_id,
        PARAMS.area : request.area,
        PARAMS.address_line_1 : request.address_line_1,
        PARAMS.address_line_2 : request.address_line_2,
        PARAMS.pincode : request.pincode,
      },
      request.visiting_card,
      "visiting_card",
    );
    return response;
  }


 Future<HttpResponse?> searchJobSeeker(SearchJobRequest request) async {

   final response = await postMethod(
     URLS.searchJobSeeker,
     data: {
       "city_id" : request.city_id??"",
       "category" : request.category??"",
       "job_type" : request.job_type??"",
       "educational_qualification" : request.educational_qualification??"",
       "extra_details" : request.extra_details??"",

     },
   );
   return response;
  }




}
