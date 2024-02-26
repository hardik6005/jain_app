class BusinessProfileAddModel {
  String? message;
  bool? error;
  int? code;
  Data? data;

  BusinessProfileAddModel({this.message, this.error, this.code, this.data});

  BusinessProfileAddModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? memberId;
  String? firmName;
  String? firmAddress;
  String? contactNumber;
  String? firmEmail;
  String? firmVisitingCard;
  String? recruitmentAvailable;
  String? noOfMale;
  String? stateId;
  String? districtId;
  String? subDistrictId;
  String? villageId;
  String? pin_code;
  String? noOfFemale;
  String? approxSalary;
  String? show;
  String? job_title;
  String? description;
  String? createdAt;
  String? updatedAt;
  BusinessProfileDirectory? businessProfileDirectory;

  Data(
      {this.id,
      this.memberId,
      this.firmName,
      this.firmAddress,
      this.contactNumber,
      this.firmEmail,
      this.firmVisitingCard,
      this.recruitmentAvailable,
      this.noOfMale,
      this.noOfFemale,
      this.approxSalary,
      this.show,
      this.stateId,
      this.districtId,
      this.subDistrictId,
      this.villageId,
      this.pin_code,
      this.createdAt,
      this.updatedAt,
      this.job_title,
      this.description,
      this.businessProfileDirectory});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    firmName = json['firm_name'];
    firmAddress = json['firm_address'];
    contactNumber = json['contact_number'];
    firmEmail = json['firm_email'];
    firmVisitingCard = json['firm_visiting_card'];
    recruitmentAvailable = json['recruitment_available'];
    noOfMale = json['no_of_male'];
    noOfFemale = json['no_of_female'];
    approxSalary = json['approx_salary'];
    show = json['show'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    pin_code = json['pin_code'];
    villageId = json['village_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    job_title = json['job_title'];
    description = json['description'];
    businessProfileDirectory = json['business_profile_directory'] != null
        ? BusinessProfileDirectory.fromJson(json['business_profile_directory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['firm_name'] = firmName;
    data['firm_address'] = firmAddress;
    data['contact_number'] = contactNumber;
    data['firm_email'] = firmEmail;
    data['firm_visiting_card'] = firmVisitingCard;
    data['recruitment_available'] = recruitmentAvailable;
    data['no_of_male'] = noOfMale;
    data['no_of_female'] = noOfFemale;
    data['approx_salary'] = approxSalary;
    data['show'] = show;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['sub_district_id'] = this.subDistrictId;
    data['village_id'] = this.villageId;
    data['pin_code'] = this.pin_code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['job_title'] = job_title;
    data['description'] = description;
    if (businessProfileDirectory != null) {
      data['business_profile_directory'] = businessProfileDirectory!.toJson();
    }
    return data;
  }
}

class BusinessProfileDirectory {
  int? id;
  String? memberId;
  String? businessDirectoryFirmName;
  String? businessDirectoryFirmAddress;
  String? businessDirectoryContactNumber;
  String? businessDirectoryFirmEmail;
  String? businessDirectoryFirmVisitingCard;
  String? businessDirectoryRecruitmentAvailable;
  String? businessDirectoryNoOfMale;
  String? businessDirectoryNoOfFemale;
  String? businessDirectoryApproxSalary;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  BusinessProfileDirectory(
      {this.id,
      this.memberId,
      this.businessDirectoryFirmName,
      this.businessDirectoryFirmAddress,
      this.businessDirectoryContactNumber,
      this.businessDirectoryFirmEmail,
      this.businessDirectoryFirmVisitingCard,
      this.businessDirectoryRecruitmentAvailable,
      this.businessDirectoryNoOfMale,
      this.businessDirectoryNoOfFemale,
      this.businessDirectoryApproxSalary,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  BusinessProfileDirectory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    businessDirectoryFirmName = json['business_directory_firm_name'];
    businessDirectoryFirmAddress = json['business_directory_firm_address'];
    businessDirectoryContactNumber = json['business_directory_contact_number'];
    businessDirectoryFirmEmail = json['business_directory_firm_email'];
    businessDirectoryFirmVisitingCard =
        json['business_directory_firm_visiting_card'];
    businessDirectoryRecruitmentAvailable =
        json['business_directory_recruitment_available'];
    businessDirectoryNoOfMale = json['business_directory_no_of_male'];
    businessDirectoryNoOfFemale = json['business_directory_no_of_female'];
    businessDirectoryApproxSalary = json['business_directory_approx_salary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['business_directory_firm_name'] = businessDirectoryFirmName;
    data['business_directory_firm_address'] = businessDirectoryFirmAddress;
    data['business_directory_contact_number'] = businessDirectoryContactNumber;
    data['business_directory_firm_email'] = businessDirectoryFirmEmail;
    data['business_directory_firm_visiting_card'] =
        businessDirectoryFirmVisitingCard;
    data['business_directory_recruitment_available'] =
        businessDirectoryRecruitmentAvailable;
    data['business_directory_no_of_male'] = businessDirectoryNoOfMale;
    data['business_directory_no_of_female'] = businessDirectoryNoOfFemale;
    data['business_directory_approx_salary'] = businessDirectoryApproxSalary;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
