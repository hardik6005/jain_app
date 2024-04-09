class SearchJobListModel {
  bool? status;
  String? message;
  Data? data;

  SearchJobListModel({this.status, this.message, this.data});

  SearchJobListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<JobSeeker>? jobSeeker;

  Data({
    this.jobSeeker,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['jobSeeker'] != null) {
      jobSeeker = <JobSeeker>[];
      json['jobSeeker'].forEach((v) {
        jobSeeker!.add(new JobSeeker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobSeeker != null) {
      data['jobSeeker'] = this.jobSeeker!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class JobSeeker {
  int? id;
  String? isJainMahaSanghMember;
  int? sanghDetailId;
  String? name;
  String? mobileNumber;
  String? residentialAddress;
  int? cityId;
  String? category;
  String? jobType;
  String? educationalQualification;
  String? personalSkills;
  String? extraDetails;
  String? resume;
  int? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? resumeUrl;
  City? city;

  JobSeeker(
      {this.id,
      this.isJainMahaSanghMember,
      this.sanghDetailId,
      this.name,
      this.mobileNumber,
      this.residentialAddress,
      this.cityId,
      this.category,
      this.jobType,
      this.educationalQualification,
      this.personalSkills,
      this.extraDetails,
      this.resume,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.resumeUrl,
      this.city});

  JobSeeker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isJainMahaSanghMember = json['is_jain_maha_sangh_member'];
    sanghDetailId = json['sangh_detail_id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    residentialAddress = json['residential_address'];
    cityId = json['city_id'];
    category = json['category'];
    jobType = json['job_type'];
    educationalQualification = json['educational_qualification'];
    personalSkills = json['personal_skills'];
    extraDetails = json['extra_details'];
    resume = json['resume'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    resumeUrl = json['resume_url'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_jain_maha_sangh_member'] = this.isJainMahaSanghMember;
    data['sangh_detail_id'] = this.sanghDetailId;
    data['name'] = this.name;
    data['mobile_number'] = this.mobileNumber;
    data['residential_address'] = this.residentialAddress;
    data['city_id'] = this.cityId;
    data['category'] = this.category;
    data['job_type'] = this.jobType;
    data['educational_qualification'] = this.educationalQualification;
    data['personal_skills'] = this.personalSkills;
    data['extra_details'] = this.extraDetails;
    data['resume'] = this.resume;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['resume_url'] = this.resumeUrl;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
