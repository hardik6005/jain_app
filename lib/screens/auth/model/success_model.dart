class SuccessModel {
  String? message;
  bool? error;
  int? code;

  SuccessModel({
    this.message,
    this.error,
    this.code,
  });

  SuccessModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['code'] = code;
    return data;
  }
}
