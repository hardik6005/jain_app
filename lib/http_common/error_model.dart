class ErrorModel {
  Error? error;

  ErrorModel({this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Error {
  int? code;
  String? field;
  String? errorMessage;

  Error({this.code, this.field, this.errorMessage});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    field = json['field'];
    errorMessage = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['field'] = field;
    data['error_message'] = errorMessage;
    return data;
  }
}
