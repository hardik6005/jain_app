import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/http_response.dart';
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
    if (model.id != null) {
      Map<String, dynamic> idReq = {PARAMS.id: model.id ?? ""};
      request.addAll(idReq);
    }

    final response = await postMultipartAPIFormDataCallArray(
      URLS.matrimonialProfile,
      request,
      // data: request
      filePath1: model.cvPdf != null
          ? model.cvPdf!.path.contains("http")
              ? ""
              : model.cvPdf!.path
          : "",
      filePath2: model.docPdf != null
          ? model.docPdf!.path.contains("http")
              ? ""
              : model.docPdf!.path
          : "",
    );
    return response;
  }

  Map<String, dynamic> matriProfileRequest(MatriRequestModel model) {
    return {
      PARAMS.memberId: model.memberId,
      PARAMS.stateId: model.state.toString(),
      PARAMS.districtId: model.distict.toString(),
      PARAMS.subDistrictId: model.subDistict.toString(),
      PARAMS.villageId: model.village.toString(),
      PARAMS.villageId: model.village.toString(),
      PARAMS.vanshId: model.vanshId.toString(),
      PARAMS.shakhaId: model.shakhaId.toString(),
      PARAMS.subShakhaId: model.subShakha.toString(),
      PARAMS.gotraId: model.gotraId.toString(),
      PARAMS.subGotraId: model.subGotraId.toString(),
      PARAMS.padviId: model.padviId.toString(),
      PARAMS.surnameId: model.surnameId.toString(),
      PARAMS.padviId: model.padviId.toString(),
      PARAMS.name: model.name.toString(),
      PARAMS.fatherName: model.fatherName.toString(),
      PARAMS.phone: model.phone.toString(),
      PARAMS.genderId: model.genderId.toString(),
      PARAMS.emailId: model.emailId.toString(),
      PARAMS.maritalId: model.maritalId.toString(),
      PARAMS.patMaritalId: model.patMaritalId.toString(),
      PARAMS.manglikEffectId: model.manglikEffectId.toString(),
      PARAMS.patManglikEffectId: model.patManglikEffectId.toString(),
      PARAMS.address: model.address.toString(),
      PARAMS.pincode: model.pincode.toString(),
      PARAMS.heightId: model.heightId.toString(),
      PARAMS.patHeightFId: model.patHeightFId.toString(),
      PARAMS.patHeightTId: model.patHeightTId.toString(),
      PARAMS.skinToneId: model.skinToneId.toString(),
      PARAMS.patSkinToneId: model.patSkinToneId.toString(),
      PARAMS.bodyTypeId: model.bodyTypeId.toString(),
      PARAMS.patBodyTypeId: model.patBodyTypeId.toString(),
      PARAMS.educationId: model.educationId.toString(),
      PARAMS.patEducationId: model.patEducationId.toString(),
      PARAMS.job_sector_id: model.jobId.toString(),
      PARAMS.patjobId: model.patjobId.toString(),
      PARAMS.patIncome: model.patIncome.toString(),
      PARAMS.income: model.income.toString(),
      PARAMS.fatherOccId: model.fatherOccId.toString(),
      PARAMS.motherName: model.motherName.toString(),
      PARAMS.motherOccId: model.motherOccId.toString(),
      PARAMS.motherVanshId: model.motherVanshId.toString(),
      PARAMS.motherShakhaId: model.motherShakhaId.toString(),
      PARAMS.motherGotraId: model.motherGotraId.toString(),
      PARAMS.motherSubShakhaId: model.motherSubShakhaId.toString(),
      PARAMS.motherSubGotraId: model.motherSubGotraId.toString(),
      PARAMS.motherPadviId: model.motherPadviId.toString(),
      PARAMS.motherSurnameId: model.motherSurnameId.toString(),
      PARAMS.motherPlace: model.motherPlace.toString(),
      PARAMS.dadiName: model.dadiName.toString(),
      PARAMS.dadiVanshId: model.dadiVanshId.toString(),
      PARAMS.dadiShakhaId: model.dadiShakhaId.toString(),
      PARAMS.dadiSubShakhaId: model.dadiSubShakhaId.toString(),
      PARAMS.dadiGotraId: model.dadiGotraId.toString(),
      PARAMS.dadiSubGotraId: model.dadiSubGotraId.toString(),
      PARAMS.dadiPadviId: model.dadiPadviId.toString(),
      PARAMS.dadiSurnameId: model.dadiSurnameId.toString(),
      PARAMS.dadiPlace: model.dadiPlace.toString(),
      PARAMS.naniName: model.naniName.toString(),
      PARAMS.naniVanshId: model.naniVanshId.toString(),
      PARAMS.naniShakhaId: model.naniShakhaId.toString(),
      PARAMS.naniSubShakhaId: model.naniSubShakhaId.toString(),
      PARAMS.naniGotraId: model.naniGotraId.toString(),
      PARAMS.naniSubGotraId: model.naniSubGotraId.toString(),
      PARAMS.naniPadviId: model.naniPadviId.toString(),
      PARAMS.naniSurnameId: model.naniSurnameId.toString(),
      PARAMS.naniPlace: model.naniPlace.toString(),
      PARAMS.brotherMarried: model.brotherMarried.toString(),
      PARAMS.brotherUnMarried: model.brotherUnMarried.toString(),
      PARAMS.sisterMarried: model.sisterMarried.toString(),
      PARAMS.sisterUnMarried: model.sisterUnMarried.toString(),
      PARAMS.other_info: model.otherInfo.toString(),
      PARAMS.partner_age_to: model.patAgeT.toString(),
      PARAMS.partner_age_from: model.patAgeF.toString(),
      PARAMS.pin_code: model.pincode.toString(),
      PARAMS.aggre1: model.aggre1,
      PARAMS.aggre2: model.aggre2,
      PARAMS.aggre3: model.aggre3,
      // "upload_cv": "",
      // "upload_document": "",
    };
  }

  // Add business profile API
  Future<HttpResponse?> businessProfileAPI(BusinessRequestModel model) async {
    Map<String, dynamic> request = businessProfileRequest(model);
    if (model.id != "") {
      Map<String, dynamic> idReq = {PARAMS.id: model.id};
      request.addAll(idReq);
    }

    final response = await postMultipartAPIFormDataCall(
        URLS.memberBusinessProfile, request,
        fileName: "firm_visiting_card",
        filePath:
            model.visitingCardPath != null ? model.visitingCardPath!.path : "");
    return response;
  }

  Map<String, dynamic> businessProfileRequest(BusinessRequestModel model) {
    return {
      PARAMS.memberId: model.memberId,
      PARAMS.id: model.id,
      PARAMS.firm_name: model.firmName,
      PARAMS.firm_address: model.firmAddress,
      PARAMS.firm_email: model.firmEmail,
      PARAMS.contact_number: model.phone,
      PARAMS.no_of_male: model.noMale,
      PARAMS.no_of_female: model.noFeMale,
      PARAMS.approx_salary: model.approxSalary,
      PARAMS.recruitment_available: model.recruitAvail,
      PARAMS.show: model.isVisibleToBusiness.toString(),
      PARAMS.business_directory_firm_name: model.isFirmName.toString(),
      PARAMS.business_directory_firm_address: model.isfirmAddress.toString(),
      PARAMS.business_directory_firm_email: model.isfirmEmail.toString(),
      PARAMS.business_directory_contact_number: model.isphone.toString(),
      PARAMS.business_directory_firm_visiting_card:
          model.isvisitingCardPath.toString(),
      PARAMS.business_directory_recruitment_available:
          model.isrecruitAvail.toString(),
      PARAMS.business_directory_no_of_male: model.isnoMale.toString(),
      PARAMS.business_directory_no_of_female: model.isnoFeMale.toString(),
      PARAMS.business_directory_approx_salary: model.isapproxSalary.toString(),
      PARAMS.stateId: model.state.toString(),
      PARAMS.districtId: model.distict.toString(),
      PARAMS.subDistrictId: model.subDistict.toString(),
      PARAMS.villageId: model.village.toString(),
      PARAMS.pin_code: model.pincode.toString(),
      PARAMS.jobTitle: model.jobTitle.toString(),
      PARAMS.description: model.description.toString(),
    };
  }




}
