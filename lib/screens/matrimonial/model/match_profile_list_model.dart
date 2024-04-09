class MatchProfileListModel {
  bool? status;
  String? message;
  MatchProfileModel? data;

  MatchProfileListModel({this.status, this.message, this.data});

  MatchProfileListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? MatchProfileModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MatchProfileModel {
  int? currentPage;
  List<MatchMatri>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  MatchProfileModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  MatchProfileModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <MatchMatri>[];
      json['data'].forEach((v) {
        data!.add(MatchMatri.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class MatchMatri {
  int? id;
  Null? mId;
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
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? motherTongue;
  int? cityId;
  Null? agreedTermCondition;
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
  String? photosUrl;
  List<String>? encodePhotos;
  City? city;

  MatchMatri(
      {this.id,
        this.mId,
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
        this.agreedTermCondition,
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
        this.encodePhotos,
        this.city});

  MatchMatri.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mId = json['m_id'];
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
    agreedTermCondition = json['agreed_term_condition'];
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
    photosUrl = json['photos_url'];
    if (json['encode_photos'] != null) {
      encodePhotos = <String>[];
      json['encode_photos'].forEach((v) {
        // encodePhotos!.add(new String?.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['m_id'] = mId;
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
    data['agreed_term_condition'] = agreedTermCondition;
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
    if (encodePhotos != null) {
      // data['encode_photos'] = this.encodePhotos!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? stateId;
  Null? deletedAt;
  Null? createdAt;
  Null? updatedAt;

  City(
      {this.id,
        this.name,
        this.stateId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['state_id'] = stateId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
