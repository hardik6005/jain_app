class MemberPreferenceModel {
  bool? status;
  String? message;
  Data? data;

  MemberPreferenceModel({this.status, this.message, this.data});

  MemberPreferenceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? expectedGender;
  String? expectedMotherTongue;
  int? expectedCityId;
  String? expectedEducationType;
  String? expectedEducationField;
  String? fullName;
  String? capitalizeFullName;
  String? photographUrl;
  Null? photosUrl;
  Null? encodePhotos;

  Data(
      {this.expectedGender,
        this.expectedMotherTongue,
        this.expectedCityId,
        this.expectedEducationType,
        this.expectedEducationField,
        this.fullName,
        this.capitalizeFullName,
        this.photographUrl,
        this.photosUrl,
        this.encodePhotos});

  Data.fromJson(Map<String, dynamic> json) {
    expectedGender = json['expected_gender'];
    expectedMotherTongue = json['expected_mother_tongue'];
    expectedCityId = json['expected_city_id'];
    expectedEducationType = json['expected_education_type'];
    expectedEducationField = json['expected_education_field'];
    fullName = json['full_name'];
    capitalizeFullName = json['capitalize_full_name'];
    photographUrl = json['photograph_url'];
    photosUrl = json['photos_url'];
    encodePhotos = json['encode_photos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['expected_gender'] = expectedGender;
    data['expected_mother_tongue'] = expectedMotherTongue;
    data['expected_city_id'] = expectedCityId;
    data['expected_education_type'] = expectedEducationType;
    data['expected_education_field'] = expectedEducationField;
    data['full_name'] = fullName;
    data['capitalize_full_name'] = capitalizeFullName;
    data['photograph_url'] = photographUrl;
    data['photos_url'] = photosUrl;
    data['encode_photos'] = encodePhotos;
    return data;
  }
}
