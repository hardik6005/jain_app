class UserDataModel {
  String? message;
  bool? error;
  int? code;
  Data? data;

  UserDataModel({this.message, this.error, this.code, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? fatherName;
  String? userType;
  String? email;
  String? emailVerifiedAt;
  String? mobileNo;
  int? genderId;
  int? maritalStatusId;
  String? dob;
  String? profilePicture;
  int? isActive;
  int? isRemovable;
  String? ownerUserId;
  String? privacyPolicy;
  String? profileUpdated;
  String? otp;
  String? businesProfile;
  String? matrimonialProfile;
  String? socialProfile;
  String? otherInformation;
  String? createdById;
  String? memberType;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  MemberProfiles? memberProfiles;
  BasicInformation? basicInformation;
  String? token;

  Data(
      {this.id,
      this.memberId,
      this.token,
      this.name,
      this.fatherName,
      this.userType,
      this.email,
      this.emailVerifiedAt,
      this.mobileNo,
      this.genderId,
      this.maritalStatusId,
      this.dob,
      this.profilePicture,
      this.isActive,
      this.isRemovable,
      this.ownerUserId,
      this.privacyPolicy,
      this.profileUpdated,
      this.otp,
      this.businesProfile,
      this.matrimonialProfile,
      this.socialProfile,
      this.otherInformation,
      this.createdById,
      this.memberType,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,

      this.memberProfiles,
      this.basicInformation});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    name = json['name'];
    fatherName = json['father_name'];
    userType = json['user_type'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobileNo = json['mobile_no'];
    genderId = json['gender_id'];
    maritalStatusId = json['marital_status_id'];
    dob = json['dob'];
    profilePicture = json['profile_picture'];
    isActive = json['is_active'];
    isRemovable = json['is_removable'];
    ownerUserId = json['owner_user_id'];
    privacyPolicy = json['privacy_policy'];
    profileUpdated = json['profile_updated'];
    otp = json['otp'];
    businesProfile = json['busines_profile'];
    matrimonialProfile = json['matrimonial_profile'];
    socialProfile = json['social_profile'];
    otherInformation = json['other_information'];
    createdById = json['created_by_id'];
    memberType = json['member_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    token = json['token'];

    memberProfiles = json['member_profiles'] != null
        ? MemberProfiles.fromJson(json['member_profiles'])
        : null;
    basicInformation = json['basic_information'] != null
        ? BasicInformation.fromJson(json['basic_information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['name'] = name;
    data['father_name'] = fatherName;
    data['user_type'] = userType;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['mobile_no'] = mobileNo;
    data['gender_id'] = genderId;
    data['marital_status_id'] = maritalStatusId;
    data['dob'] = dob;
    data['profile_picture'] = profilePicture;
    data['is_active'] = isActive;
    data['is_removable'] = isRemovable;
    data['owner_user_id'] = ownerUserId;
    data['privacy_policy'] = privacyPolicy;
    data['profile_updated'] = profileUpdated;
    data['otp'] = otp;
    data['busines_profile'] = businesProfile;
    data['matrimonial_profile'] = matrimonialProfile;
    data['social_profile'] = socialProfile;
    data['other_information'] = otherInformation;
    data['created_by_id'] = createdById;
    data['member_type'] = memberType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['token'] = token;

    if (memberProfiles != null) {
      data['member_profiles'] = memberProfiles!.toJson();
    }
    if (basicInformation != null) {
      data['basic_information'] = basicInformation!.toJson();
    }
    return data;
  }
}

class MemberProfiles {
  int? id;
  String? memberId;
  int? jobId;
  String? jobSpecified;
  int? educationId;
  String? educationDetail;
  String? homeNumber;
  String? officeNumber;
  String? officeEmail;
  String? approxSalary;
  String? visitingCard;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  MemberProfiles(
      {this.id,
      this.memberId,
      this.jobId,
      this.jobSpecified,
      this.educationId,
      this.educationDetail,
      this.homeNumber,
      this.officeNumber,
      this.officeEmail,
      this.approxSalary,
      this.visitingCard,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  MemberProfiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    jobId = json['job_id'];
    jobSpecified = json['job_specified'];
    educationId = json['education_id'];
    educationDetail = json['education_detail'];
    homeNumber = json['home_number'];
    officeNumber = json['office_number'];
    officeEmail = json['office_email'];
    approxSalary = json['approx_salary'];
    visitingCard = json['visiting_card'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['job_id'] = jobId;
    data['job_specified'] = jobSpecified;
    data['education_id'] = educationId;
    data['education_detail'] = educationDetail;
    data['home_number'] = homeNumber;
    data['office_number'] = officeNumber;
    data['office_email'] = officeEmail;
    data['approx_salary'] = approxSalary;
    data['visiting_card'] = visitingCard;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class BasicInformation {
  int? id;
  String? memberId;
  int? vanshId;
  int? shakhaId;
  int? subShakhaId;
  int? gotraId;
  int? subGotraId;
  int? padviId;
  int? surnameId;
  int? relationSideId;
  int? relationNameId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  BasicInformation(
      {this.id,
      this.memberId,
      this.vanshId,
      this.shakhaId,
      this.subShakhaId,
      this.gotraId,
      this.subGotraId,
      this.padviId,
      this.surnameId,
      this.relationSideId,
      this.relationNameId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  BasicInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    vanshId = json['vansh_id'];
    shakhaId = json['shakha_id'];
    subShakhaId = json['sub_shakha_id'];
    gotraId = json['gotra_id'];
    subGotraId = json['sub_gotra_id'];
    padviId = json['padvi_id'];
    surnameId = json['surname_id'];
    relationSideId = json['relation_side_id'];
    relationNameId = json['relation_name_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['vansh_id'] = vanshId;
    data['shakha_id'] = shakhaId;
    data['sub_shakha_id'] = subShakhaId;
    data['gotra_id'] = gotraId;
    data['sub_gotra_id'] = subGotraId;
    data['padvi_id'] = padviId;
    data['surname_id'] = surnameId;
    data['relation_side_id'] = relationSideId;
    data['relation_name_id'] = relationNameId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
