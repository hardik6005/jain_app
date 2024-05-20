class UserDataModel {
  bool? status;
  String? message;
  User? data;

  UserDataModel({this.status, this.message, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
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

class User {
  String? name;
  String? phoneNumber;
  String? email;
  String? profilePic;
  String? profile_pic_url;
  String? address;

  User(
      {this.name, this.phoneNumber, this.email, this.profilePic, this.address, this.profile_pic_url});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    profilePic = json['profile_pic'];
    profile_pic_url = json['profile_pic_url'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['profile_pic'] = profilePic;
    data['profile_pic_url'] = profile_pic_url;
    data['address'] = address;
    return data;
  }
}
