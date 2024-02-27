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
  String? memberId;
  String? password;
  BuildContext? context;
  ValidationEvent({
    this.memberId,
    this.password,
    this.context,
  });
}

//Validation Event
class LoginAPIEvent extends LoginEvent {
  BuildContext? context;
  String? memberId;
  String? password;
  LoginAPIEvent({
    this.context,
    this.memberId,
    this.password,
  });
}

//GetProfile API Event
class GetProfileAPIEvent extends LoginEvent {
  GetProfileAPIEvent();
}

//Stop Loader Event
class StopLoaderEvent extends LoginEvent {
  StopLoaderEvent();
}