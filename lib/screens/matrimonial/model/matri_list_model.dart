class MatriListModel {
  bool? status;
  String? message;
  MatriModel? data;

  MatriListModel({this.status, this.message, this.data});

  MatriListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? MatriModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MatriModel {
  List<MemberList>? memberList;

  MatriModel({this.memberList});

  MatriModel.fromJson(Map<String, dynamic> json) {
    if (json['memberList'] != null) {
      memberList = <MemberList>[];
      json['memberList'].forEach((v) {
        memberList!.add(MemberList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (memberList != null) {
      data['memberList'] = memberList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberList {
  int? id;
  String? formNo;
  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  String? dob;
  String? age;
  String? maritalStatus;
  String? height;
  int? weight;
  String? physicalDisability;
  String? complextion;
  String? bloodGroup;
  String? subCommunity;
  String? fatherStatus;
  String? motherStatus;
  int? noBrother;
  int? brotherMarried;
  int? noSister;
  int? sisterMarried;
  String? nativePlace;
  String? manglik;
  String? rashi;
  String? educationType;
  String? educationField;
  String? workingWith;
  String? workingAs;
  String? photograph;
  String? birthTime;
  String? birthPlace;
  String? otherDetail;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? motherTongue;
  int? cityId;
  String? photos;
  int? status;
  String? expectedGender;
  String? expectedMotherTongue;
  int? expectedCityId;
  String? expectedEducationType;
  String? expectedEducationField;
  int? userId;
  String? fullName;
  String? capitalizeFullName;
  String? photographUrl;
  List<String>? photosUrl;
  List<String>? encodePhotos;

  MemberList(
      {this.id,
        this.formNo,
        this.firstName,
        this.middleName,
        this.lastName,
        this.gender,
        this.dob,
        this.age,
        this.maritalStatus,
        this.height,
        this.weight,
        this.physicalDisability,
        this.complextion,
        this.bloodGroup,
        this.subCommunity,
        this.fatherStatus,
        this.motherStatus,
        this.noBrother,
        this.brotherMarried,
        this.noSister,
        this.sisterMarried,
        this.nativePlace,
        this.manglik,
        this.rashi,
        this.educationType,
        this.educationField,
        this.workingWith,
        this.workingAs,
        this.photograph,
        this.birthTime,
        this.birthPlace,
        this.otherDetail,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.motherTongue,
        this.cityId,
        this.photos,
        this.status,
        this.expectedGender,
        this.expectedMotherTongue,
        this.expectedCityId,
        this.expectedEducationType,
        this.expectedEducationField,
        this.userId,
        this.fullName,
        this.capitalizeFullName,
        this.photographUrl,
        this.photosUrl,
        this.encodePhotos});

  MemberList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formNo = json['form_no'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dob = json['dob'];
    age = json['age'];
    maritalStatus = json['marital_status'];
    height = json['height'];
    weight = json['weight'];
    physicalDisability = json['physical_disability'];
    complextion = json['complextion'];
    bloodGroup = json['blood_group'];
    subCommunity = json['sub_community'];
    fatherStatus = json['father_status'];
    motherStatus = json['mother_status'];
    noBrother = json['no_brother'];
    brotherMarried = json['brother_married'];
    noSister = json['no_sister'];
    sisterMarried = json['sister_married'];
    nativePlace = json['native_place'];
    manglik = json['manglik'];
    rashi = json['rashi'];
    educationType = json['education_type'];
    educationField = json['education_field'];
    workingWith = json['working_with'];
    workingAs = json['working_as'];
    photograph = json['photograph'];
    birthTime = json['birth_time'];
    birthPlace = json['birth_place'];
    otherDetail = json['other_detail'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    motherTongue = json['mother_tongue'];
    cityId = json['city_id'];
    photos = json['photos'];
    status = json['status'];
    expectedGender = json['expected_gender'];
    expectedMotherTongue = json['expected_mother_tongue'];
    expectedCityId = json['expected_city_id'];
    expectedEducationType = json['expected_education_type'];
    expectedEducationField = json['expected_education_field'];
    userId = json['user_id'];
    fullName = json['full_name'];
    capitalizeFullName = json['capitalize_full_name'];
    photographUrl = json['photograph_url'];
    photosUrl = json['photos_url']!=null?json['photos_url'].cast<String>():[];
    encodePhotos = json['encode_photos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['form_no'] = formNo;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['dob'] = dob;
    data['age'] = age;
    data['marital_status'] = maritalStatus;
    data['height'] = height;
    data['weight'] = weight;
    data['physical_disability'] = physicalDisability;
    data['complextion'] = complextion;
    data['blood_group'] = bloodGroup;
    data['sub_community'] = subCommunity;
    data['father_status'] = fatherStatus;
    data['mother_status'] = motherStatus;
    data['no_brother'] = noBrother;
    data['brother_married'] = brotherMarried;
    data['no_sister'] = noSister;
    data['sister_married'] = sisterMarried;
    data['native_place'] = nativePlace;
    data['manglik'] = manglik;
    data['rashi'] = rashi;
    data['education_type'] = educationType;
    data['education_field'] = educationField;
    data['working_with'] = workingWith;
    data['working_as'] = workingAs;
    data['photograph'] = photograph;
    data['birth_time'] = birthTime;
    data['birth_place'] = birthPlace;
    data['other_detail'] = otherDetail;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['mother_tongue'] = motherTongue;
    data['city_id'] = cityId;
    data['photos'] = photos;
    data['status'] = status;
    data['expected_gender'] = expectedGender;
    data['expected_mother_tongue'] = expectedMotherTongue;
    data['expected_city_id'] = expectedCityId;
    data['expected_education_type'] = expectedEducationType;
    data['expected_education_field'] = expectedEducationField;
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['capitalize_full_name'] = capitalizeFullName;
    data['photograph_url'] = photographUrl;
    data['photos_url'] = photosUrl;
    data['encode_photos'] = encodePhotos;
    return data;
  }
}
