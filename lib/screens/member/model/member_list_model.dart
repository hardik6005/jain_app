class MemberListModel {
  bool? status;
  String? message;
  List<Member>? data;

  MemberListModel({this.status, this.message, this.data});

  MemberListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Member>[];
      json['data'].forEach((v) {
        data!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Member {
  int? id;
  String? formNo;
  String? fullName;
  String? gender;
  String? relationWithHod;
  String? bloodGroup;
  String? dob;
  String? maritalStatus;
  String? educationalQualification;
  String? religiousEducation;
  String? electionCardNo;
  String? mobileNo;
  String? business;
  String? specialActivity;
  String? socialGroup1;
  String? socialGroup2;
  String? socialGroup3;
  String? aadharCardNo;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? profession;
  String? designation;
  String? location;
  int? stateId;
  int? countryId;
  String? city;

  Member(
      {this.id,
      this.formNo,
      this.fullName,
      this.gender,
      this.relationWithHod,
      this.bloodGroup,
      this.dob,
      this.maritalStatus,
      this.educationalQualification,
      this.religiousEducation,
      this.electionCardNo,
      this.mobileNo,
      this.business,
      this.specialActivity,
      this.socialGroup1,
      this.socialGroup2,
      this.socialGroup3,
      this.aadharCardNo,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.profession,
      this.designation,
      this.location,
      this.stateId,
      this.countryId,
      this.city});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formNo = json['form_no'];
    fullName = json['full_name'];
    gender = json['gender'];
    relationWithHod = json['relation_with_hod'];
    bloodGroup = json['blood_group'];
    dob = json['dob'];
    maritalStatus = json['marital_status'];
    educationalQualification = json['educational_qualification'];
    religiousEducation = json['religious_education'];
    electionCardNo = json['election_card_no'];
    mobileNo = json['mobile_no'];
    business = json['business'];
    specialActivity = json['special_activity'];
    socialGroup1 = json['social_group1'];
    socialGroup2 = json['social_group2'];
    socialGroup3 = json['social_group3'];
    aadharCardNo = json['aadhar_card_no'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profession = json['profession'];
    designation = json['designation'];
    location = json['location'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['form_no'] = formNo;
    data['full_name'] = fullName;
    data['gender'] = gender;
    data['relation_with_hod'] = relationWithHod;
    data['blood_group'] = bloodGroup;
    data['dob'] = dob;
    data['marital_status'] = maritalStatus;
    data['educational_qualification'] = educationalQualification;
    data['religious_education'] = religiousEducation;
    data['election_card_no'] = electionCardNo;
    data['mobile_no'] = mobileNo;
    data['business'] = business;
    data['special_activity'] = specialActivity;
    data['social_group1'] = socialGroup1;
    data['social_group2'] = socialGroup2;
    data['social_group3'] = socialGroup3;
    data['aadhar_card_no'] = aadharCardNo;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profession'] = profession;
    data['designation'] = designation;
    data['location'] = location;
    data['state_id'] = stateId;
    data['country_id'] = countryId;
    data['city'] = city;
    return data;
  }
}
