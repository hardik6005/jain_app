import 'package:jain_app/componenets/common_model.dart';

class BusinessListModel {
  bool? status;
  String? message;
  BusinessData? data;

  BusinessListModel({this.status, this.message, this.data});

  BusinessListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? BusinessData.fromJson(json['data']) : null;
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

class BusinessData {
  List<MemberList>? memberList;

  BusinessData({this.memberList, });

  BusinessData.fromJson(Map<String, dynamic> json) {
    if (json['memberList'] != null) {
      memberList = <MemberList>[];
      json['memberList'].forEach((v) { memberList!.add(MemberList.fromJson(v)); });
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
  String? businessTitle;
  String? ownerName;
  String? mobileNumber;
  int? businessCategoryId;
  int? stateId;
  int? cityId;
  String? area;
  String? addressLine1;
  String? addressLine2;
  String? pincode;
  String? visitingCard;
  int? userId;
  int? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? fullAddress;
  String? visitingCardUrl;
  BusinessCategory? businessCategory;
  State? state;
  City? city;

  MemberList({this.id, this.businessTitle, this.ownerName, this.mobileNumber, this.businessCategoryId, this.stateId, this.cityId, this.area, this.addressLine1, this.addressLine2, this.pincode, this.visitingCard, this.userId, this.status, this.deletedAt, this.createdAt, this.updatedAt, this.fullAddress, this.visitingCardUrl, this.businessCategory, this.state, this.city});

  MemberList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessTitle = json['business_title'];
    ownerName = json['owner_name'];
    mobileNumber = json['mobile_number'];
    businessCategoryId = json['business_category_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    area = json['area'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    pincode = json['pincode'];
    visitingCard = json['visiting_card'];
    userId = json['user_id'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullAddress = json['full_address'];
    visitingCardUrl = json['visiting_card_url'];
    businessCategory = json['business_category'] != null ? BusinessCategory.fromJson(json['business_category']) : null;
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['business_title'] = businessTitle;
    data['owner_name'] = ownerName;
    data['mobile_number'] = mobileNumber;
    data['business_category_id'] = businessCategoryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['area'] = area;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['pincode'] = pincode;
    data['visiting_card'] = visitingCard;
    data['user_id'] = userId;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['full_address'] = fullAddress;
    data['visiting_card_url'] = visitingCardUrl;
    if (businessCategory != null) {
      data['business_category'] = businessCategory!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}
