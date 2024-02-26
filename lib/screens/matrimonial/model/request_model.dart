import 'package:jain_app/utils/app_utils.dart';

class SocialRequestModel {
  String memberId;
  String nameInstitute;
  String institutePinCode;
  bool isVisible;
  String id;

  SocialRequestModel({
    required this.memberId,
    required this.nameInstitute,
    required this.institutePinCode,
    required this.isVisible,
    required this.id,
  });
}

class BusinessRequestModel {
  String? memberId;
  String? firmName;
  String? firmAddress;
  String? phone;
  String? firmEmail;
  PickerModel? visitingCardPath;
  String? recruitAvail;
  String? noMale;
  String? noFeMale;
  String? approxSalary;
  bool? isVisibleToBusiness;
  bool? isFirmName;
  bool? isfirmAddress;
  bool? isphone;
  bool? isfirmEmail;
  bool? isvisitingCardPath;
  bool? isrecruitAvail;
  bool? isnoMale;
  bool? isnoFeMale;
  bool? isapproxSalary;
  String? id;
  String? state;
  String? distict;
  String? subDistict;
  String? village;
  String? pincode;
  String? jobTitle;
  String? description;

  BusinessRequestModel({
    this.memberId,
    this.firmName,
    this.firmAddress,
    this.phone,
    this.firmEmail,
    this.visitingCardPath,
    this.recruitAvail,
    this.noMale,
    this.noFeMale,
    this.approxSalary,
    this.isVisibleToBusiness,
    this.isFirmName,
    this.isfirmAddress,
    this.isphone,
    this.isfirmEmail,
    this.isvisitingCardPath,
    this.isrecruitAvail,
    this.isnoMale,
    this.isnoFeMale,
    this.isapproxSalary,
    this.id = "",
    this.state,
    this.distict,
    this.subDistict,
    this.village,
    this.pincode,
    this.jobTitle,
    this.description,
  });
}

class MatriRequestModel {
  String? memberId;
  String? phone;
  String? income;
  String? patIncome;
  int? id;
  String? state;
  String? distict;
  String? subDistict;
  String? village;
  String? profilePic;
  int? vanshId;
  int? shakhaId;
  int? subShakha;
  int? gotraId;
  int? subGotraId;
  int? surnameId;
  int? padviId;
  String? name;
  String? fatherName;
  int? genderId;
  String? emailId;
  int? manglikEffectId;
  String? address;
  String? pincode;
  int? heightId;
  String? patHeightFId;
  String? patHeightTId;
  int? skinToneId;
  int? patSkinToneId;
  int? bodyTypeId;
  int? patBodyTypeId;
  int? educationId;
  int? patEducationId;
  int? jobId;
  int? patjobId;
  int? fatherOccId;
  int? motherOccId;
  String? motherName;
  int? motherVanshId;
  int? dadiVanshId;
  int? naniVanshId;
  int? motherShakhaId;
  int? dadiShakhaId;
  int? naniShakhaId;
  int? motherSubShakhaId;
  int? dadiSubShakhaId;
  int? naniSubShakhaId;
  int? motherGotraId;
  int? dadiGotraId;
  int? naniGotraId;
  int? motherSubGotraId;
  int? dadiSubGotraId;
  int? naniSubGotraId;
  int? motherPadviId;
  int? dadiPadviId;
  int? naniPadviId;
  int? motherSurnameId;
  int? dadiSurnameId;
  int? naniSurnameId;
  String? motherPlace;
  String? dadiPlace;
  String? naniPlace;
  String? dadiName;
  String? naniName;
  int? brotherMarried;
  int? brotherUnMarried;
  int? sisterUnMarried;
  int? sisterMarried;
  int? patMaritalId;
  int? maritalId;
  int? patManglikEffectId;
  String? patAgeF;
  String? patAgeT;
  String? otherInfo;
  PickerModel? cvPdf;
  PickerModel? docPdf;
  String? aggre1;
  String? aggre2;
  String? aggre3;

  MatriRequestModel(
      {this.memberId,
      this.phone,
      this.income,
      this.maritalId,
      this.patIncome,
      this.id,
      this.state,
      this.distict,
      this.naniSurnameId,
      this.subDistict,
      this.village,
      this.pincode,
      this.profilePic,
      this.vanshId,
      this.shakhaId,
      this.subShakha,
      this.gotraId,
      this.subGotraId,
      this.surnameId,
      this.padviId,
      this.name,
      this.fatherName,
      this.genderId,
      this.emailId,
      this.manglikEffectId,
      this.address,
      this.heightId,
      this.patHeightFId,
      this.patHeightTId,
      this.skinToneId,
      this.patSkinToneId,
      this.bodyTypeId,
      this.patBodyTypeId,
      this.educationId,
      this.patEducationId,
      this.jobId,
      this.patjobId,
      this.fatherOccId,
      this.motherOccId,
      this.motherName,
      this.motherVanshId,
      this.dadiVanshId,
      this.naniVanshId,
      this.motherShakhaId,
      this.dadiShakhaId,
      this.naniShakhaId,
      this.motherSubShakhaId,
      this.dadiSubShakhaId,
      this.naniSubShakhaId,
      this.motherGotraId,
      this.dadiGotraId,
      this.naniGotraId,
      this.motherSubGotraId,
      this.dadiSubGotraId,
      this.naniSubGotraId,
      this.motherPadviId,
      this.dadiPadviId,
      this.naniPadviId,
      this.motherSurnameId,
      this.dadiSurnameId,
      this.motherPlace,
      this.dadiPlace,
      this.naniPlace,
      this.dadiName,
      this.naniName,
      this.brotherMarried,
      this.brotherUnMarried,
      this.sisterUnMarried,
      this.sisterMarried,
      this.patMaritalId,
      this.patManglikEffectId,
      this.patAgeF,
      this.patAgeT,
      this.otherInfo,
      this.cvPdf,
      this.docPdf,
      this.aggre1,
      this.aggre2,
      this.aggre3});
}
