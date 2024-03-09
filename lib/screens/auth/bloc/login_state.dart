part of 'login_bloc.dart';

class LoginState {
  final ApiCallState? loginCallState;
  final ApiCallState? getProfileCallState;
  final ApiCallState? forgotCallState;
  final ApiCallState? resetPassCallState;
  final int? page;
  final bool? validEmail;
  final LoginModel? loginDataModel;
  final UserDataModel? userDataModel;
  final String? successMsg;

  LoginState({
    this.loginCallState = ApiCallState.none,
    this.forgotCallState = ApiCallState.none,
    this.getProfileCallState = ApiCallState.none,
    this.resetPassCallState = ApiCallState.none,
    this.page = 0,
    this.validEmail = false,
    this.loginDataModel,
    this.successMsg,
    this.userDataModel,
  });

  List<Object> get props => [
        loginCallState!,
        forgotCallState!,
        resetPassCallState!,
        page!,
        validEmail!,
        loginDataModel!,
        successMsg!,
    userDataModel!,
      ];

  LoginState copyWith({
    ApiCallState? loginCallState,
    ApiCallState? forgotCallState,
    ApiCallState? resetPassCallState,
    ApiCallState? getProfileCallState,
    int? page,
    bool? validEmail,
    LoginModel? loginDataModel,
    String? successMsg,
    UserDataModel? userDataModel,

  }) {
    return LoginState(
      loginCallState: loginCallState ?? this.loginCallState,
      forgotCallState: forgotCallState ?? this.forgotCallState,
      page: page ?? this.page,
      validEmail: validEmail ?? this.validEmail,
      resetPassCallState: resetPassCallState ?? this.resetPassCallState,
      loginDataModel: loginDataModel ?? this.loginDataModel,
      getProfileCallState: getProfileCallState ?? this.getProfileCallState,
      successMsg: successMsg ?? this.successMsg,
      userDataModel: userDataModel ?? this.userDataModel,
    );
  }
}

class NotesInitial extends LoginState {}
