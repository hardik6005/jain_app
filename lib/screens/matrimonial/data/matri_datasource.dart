import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/http_response.dart';
import 'package:jain_app/main.dart';
import 'package:jain_app/screens/matrimonial/model/request_model.dart';
import 'package:jain_app/utils/api_constant.dart';

class MatriDataSource extends HttpActions {
  MatriDataSource();

  // Add Social Profile API
  Future<HttpResponse?> socialProfileAPI(SocialRequestModel model) async {
    Map<String, dynamic> request = socialRequest(model);
    if (model.id != "") {
      Map<String, dynamic> idReq = {PARAMS.id: model.id};
      request.addAll(idReq);
    }

    final response = await postMethod(
      URLS.memberSocialProfile,
      data: request,
    );
    return response;
  }

  Map<String, Object> socialRequest(SocialRequestModel model) {
    return {
      PARAMS.memberId: model.memberId,
      PARAMS.id: model.id,
      PARAMS.socialInstituteName: model.nameInstitute,
      PARAMS.picodeInstitute: model.institutePinCode,
      PARAMS.show: model.isVisible,
    };
  }

  // Get Social Profile API
  Future<HttpResponse?> getSocialProfileAPI() async {
    final response = await getMethod(
      URLS.getSocialProfile,
    );
    return response;
  }

  // Get Business Profile API
  Future<HttpResponse?> getBusinessProfileAPI() async {
    final response = await getMethod(
      URLS.getBusinessProfile,
    );
    return response;
  }

  // Add matri profile API
  Future<HttpResponse?> matriProfileAPI(MatriRequestModel model) async {
    Map<String, dynamic> request = matriProfileRequest(model);

    final response = await postMultipartAPIFormDataCallArray(
      (model.id!=null)?URLS.updateMatrimonial+model.id!:URLS.addMatrimonial,
      request,
      // data: request
      filePath1: model.profilePic!.contains("http")?"":model.profilePic,
      filePath2: model.otherPic!.contains("http")?"":model.otherPic,
    );
    return response;
  }

  Map<String, dynamic> matriProfileRequest(MatriRequestModel model) {
    return {
      "first_name": model.FName,
      "middle_name": model.MName.toString(),
      "last_name": model.LName.toString(),
      "gender": model.gender.toString(),
      "dob": model.selectedDOB.toString(),
      "marital_status": model.marital.toString(),
      "age": model.Age.toString(),
      "height": model.height.toString(),
      "weight": model.Weight.toString(),
      "blood_group": model.blood.toString(),
      "complextion": model.complextion.toString(),
      "physical_disability": model.phyDisa.toString(),
      "manglik": model.manglik.toString(),
      'rashi': model.rashi.toString(),
      "education_type": model.eduType.toString(),
      "education_field": model.eduField.toString(),
      'working_with': model.workWith.toString(),
      "working_as": model.workAs.toString(),
      "birth_place": model.BirthPlace.toString(),
      "birth_time": model.selectedBTime.toString(),
      'mother_tongue': model.motherToung.toString(),
      "city_id": model.location.toString(),
      "sub_community": model.subComm.toString(),
      'father_status': model.fatherStatus.toString(),
      'mother_status': model.motherStatus.toString(),
      "no_brother": model.NoBrother.toString(),
      "brother_married": model.NoBroMar.toString(),
      "no_sister": model.NoSis.toString(),
      "sister_married": model.NoSisMar.toString(),
      "native_place": model.NatPlace.toString(),
      "other_detail": model.OtherDet.toString(),
      "expected_gender": model.genderMatch.toString(),
      "expected_mother_tongue": model.motherToungMatch.toString(),
      "expected_education_field": model.eduFieldMatch.toString(),
      "expected_city_id": model.locationMatch.toString(),
      "expected_education_type": model.eduTypeMatch.toString(),
      "is_agreed": model.aggree.toString(),
      "user_id": userDataModel.toString(),
      'form_no': "1990",
      "status": "2",
      // "upload_cv": "",
      // "upload_document": "",
    };
  }




}
