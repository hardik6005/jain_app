part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();

  List<Object> get props => [];
}

//Forgot Password API call
class ForgotAPIEvent extends LoginEvent {
  final BuildContext? context;
  final String? memebrId;
  final String? email;

  ForgotAPIEvent({this.context, this.email, this.memebrId});
}

//Reset Password API call
class ResetAPIEvent extends LoginEvent {
  final BuildContext? context;
  final ForgotRequestModel? requestModel;

  ResetAPIEvent({
    this.context,
    this.requestModel,
  });
}

//Validation Event
class ValidationEvent extends LoginEvent {
  String? mobile;
  String? password;
  String? birthYear;
  BuildContext? context;

  ValidationEvent({
    this.mobile,
    this.password,
    this.context,
    this.birthYear,
  });
}

//Validation Event
class LoginAPIEvent extends LoginEvent {
  BuildContext? context;
  String? phone;
  String? password;
  String? birthYear;

  LoginAPIEvent({
    this.context,
    this.phone,
    this.password,
    this.birthYear,
  });
}

//GetProfile API Event
class GetProfileAPIEvent extends LoginEvent {
  GetProfileAPIEvent();
}

//GetProfile API Event
class RegisterAPIEvent extends LoginEvent {
  RegisterReqModel req;
  RegisterAPIEvent(this.req);
}

//Stop Loader Event
class StopLoaderEvent extends LoginEvent {
  StopLoaderEvent();
}
