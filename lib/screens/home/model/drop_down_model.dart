class DropDownData {
  bool? status;
  String? message;
  Map? data;

  DropDownData({this.status, this.message, this.data});

  DropDownData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    return data;
  }
}


class MyDropDown {
  dynamic relationWithHOFDropDown;
  dynamic maritalStatusDropDown;
  dynamic memberbloodGroupDropDown;
  dynamic educationalQualificationDropDown;
  dynamic professions;
  dynamic sanghs;
  dynamic states;
  dynamic countries;
  dynamic businessCategories;
  dynamic heightDropDown;
  dynamic matrimonialbloodGroupDropDown;
  dynamic complextionDropDown;
  dynamic sampradayDropDown;
  dynamic fatherStatusDropDown;
  dynamic motherStatusDropDown;
  dynamic rashiDropDown;
  dynamic workingAsDropDown;
  dynamic cities;
  dynamic motherTongueDropDown;
  dynamic educationTypeDropdown;
  dynamic educationFieldDropdown;
  dynamic workingWithDropdown;
  dynamic sanghsDetails;
  dynamic categoryDropDown;
  dynamic jobType;
  dynamic statusBusinessAdvert;
  dynamic statusJobPortal;
  dynamic statusUser;
  dynamic subCommunity;
  dynamic statusMatrimonial;

  MyDropDown({this.relationWithHOFDropDown, this.maritalStatusDropDown, this.memberbloodGroupDropDown, this.educationalQualificationDropDown, this.professions, this.sanghs, this.states, this.countries, this.businessCategories, this.heightDropDown, this.matrimonialbloodGroupDropDown, this.complextionDropDown, this.sampradayDropDown, this.fatherStatusDropDown, this.motherStatusDropDown, this.rashiDropDown, this.workingAsDropDown, this.cities, this.motherTongueDropDown, this.educationTypeDropdown, this.educationFieldDropdown, this.workingWithDropdown, this.sanghsDetails, this.categoryDropDown, this.jobType, this.statusBusinessAdvert, this.statusJobPortal, this.statusUser, this.subCommunity, this.statusMatrimonial});

  MyDropDown.fromJson(Map<String, dynamic> json) {
    relationWithHOFDropDown = json['relationWithHOFDropDown'];
    maritalStatusDropDown = json['maritalStatusDropDown'];
    memberbloodGroupDropDown = json['memberbloodGroupDropDown'];
    educationalQualificationDropDown = json['educationalQualificationDropDown'];
    professions = json['professions'];
    sanghs = json['sanghs'];
    states = json['states'];
    countries = json['countries'];
    businessCategories = json['businessCategories'];
    heightDropDown = json['heightDropDown'];
    matrimonialbloodGroupDropDown = json['matrimonialbloodGroupDropDown'];
    complextionDropDown = json['complextionDropDown'];
    sampradayDropDown = json['sampradayDropDown'];
    fatherStatusDropDown = json['fatherStatusDropDown'];
    motherStatusDropDown = json['motherStatusDropDown'];
    rashiDropDown = json['rashiDropDown'];
    workingAsDropDown = json['workingAsDropDown'];
    cities = json['cities'];
    motherTongueDropDown = json['motherTongueDropDown'];
    educationTypeDropdown = json['educationTypeDropdown'];
    educationFieldDropdown = json['educationFieldDropdown'];
    workingWithDropdown = json['workingWithDropdown'];
    sanghsDetails = json['sanghsDetails'];
    categoryDropDown = json['categoryDropDown'];
    jobType = json['jobType'];
    statusBusinessAdvert = json['statusBusinessAdvert'];
    statusJobPortal = json['statusJobPortal'];
    statusUser = json['statusUser'];
    subCommunity = json['subCommunity'];
    statusMatrimonial = json['statusMatrimonial'];
    relationWithHOFDropDown = json['relationWithHOFDropDown'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.relationWithHOFDropDown != null) {
      data['relationWithHOFDropDown'] = this.relationWithHOFDropDown!.toJson();
    }
    if (this.maritalStatusDropDown != null) {
      data['maritalStatusDropDown'] = this.maritalStatusDropDown!.toJson();
    }
    if (this.memberbloodGroupDropDown != null) {
      data['memberbloodGroupDropDown'] = this.memberbloodGroupDropDown!.toJson();
    }
    if (this.educationalQualificationDropDown != null) {
      data['educationalQualificationDropDown'] = this.educationalQualificationDropDown!.toJson();
    }
    if (this.professions != null) {
      data['professions'] = this.professions!.toJson();
    }
    if (this.sanghs != null) {
      data['sanghs'] = this.sanghs!.toJson();
    }
    if (this.states != null) {
      data['states'] = this.states!.toJson();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.toJson();
    }
    if (this.businessCategories != null) {
      data['businessCategories'] = this.businessCategories!.toJson();
    }
    if (this.heightDropDown != null) {
      data['heightDropDown'] = this.heightDropDown!.toJson();
    }
    if (this.matrimonialbloodGroupDropDown != null) {
      data['matrimonialbloodGroupDropDown'] = this.matrimonialbloodGroupDropDown!.toJson();
    }
    if (this.complextionDropDown != null) {
      data['complextionDropDown'] = this.complextionDropDown!.toJson();
    }
    if (this.sampradayDropDown != null) {
      data['sampradayDropDown'] = this.sampradayDropDown!.toJson();
    }
    if (this.fatherStatusDropDown != null) {
      data['fatherStatusDropDown'] = this.fatherStatusDropDown!.toJson();
    }
    if (this.motherStatusDropDown != null) {
      data['motherStatusDropDown'] = this.motherStatusDropDown!.toJson();
    }
    if (this.rashiDropDown != null) {
      data['rashiDropDown'] = this.rashiDropDown!.toJson();
    }
    if (this.workingAsDropDown != null) {
      data['workingAsDropDown'] = this.workingAsDropDown!.toJson();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.toJson();
    }
    if (this.motherTongueDropDown != null) {
      data['motherTongueDropDown'] = this.motherTongueDropDown!.toJson();
    }
    if (this.educationTypeDropdown != null) {
      data['educationTypeDropdown'] = this.educationTypeDropdown!.toJson();
    }
    if (this.educationFieldDropdown != null) {
      data['educationFieldDropdown'] = this.educationFieldDropdown!.toJson();
    }
    if (this.workingWithDropdown != null) {
      data['workingWithDropdown'] = this.workingWithDropdown!.toJson();
    }
    if (this.sanghsDetails != null) {
      data['sanghsDetails'] = this.sanghsDetails!.toJson();
    }
    if (this.categoryDropDown != null) {
      data['categoryDropDown'] = this.categoryDropDown!.toJson();
    }
    if (this.jobType != null) {
      data['jobType'] = this.jobType!.toJson();
    }
    if (this.statusBusinessAdvert != null) {
      data['statusBusinessAdvert'] = this.statusBusinessAdvert!.toJson();
    }
    if (this.statusJobPortal != null) {
      data['statusJobPortal'] = this.statusJobPortal!.toJson();
    }
    if (this.statusUser != null) {
      data['statusUser'] = this.statusUser!.toJson();
    }
    if (this.subCommunity != null) {
      data['subCommunity'] = this.subCommunity!.toJson();
    }
    if (this.statusMatrimonial != null) {
      data['statusMatrimonial'] = this.statusMatrimonial!.toJson();
    }
    return data;
  }
}