part of 'login_bloc.dart';

class LoginState {
  final ApiCallState? loginCallState;
  final ApiCallState? getProfileCallState;
  final ApiCallState? registerCallState;
  final ApiCallState? resetPassCallState;
  final int? page;
  final bool? validEmail;
  final LoginModel? loginDataModel;
  final UserDataModel? userDataModel;
  final String? successMsg;
  final bool? isRegValidate;

  LoginState({
    this.loginCallState = ApiCallState.none,
    this.registerCallState = ApiCallState.none,
    this.getProfileCallState = ApiCallState.none,
    this.resetPassCallState = ApiCallState.none,
    this.page = 0,
    this.validEmail = false,
    this.loginDataModel,
    this.successMsg,
    this.userDataModel,
    this.isRegValidate = true,
  });

  List<Object> get props => [
        loginCallState!,
        registerCallState!,
        resetPassCallState!,
        page!,
        validEmail!,
        loginDataModel!,
        successMsg!,
        userDataModel!,
        isRegValidate!,
      ];

  LoginState copyWith({
    ApiCallState? loginCallState,
    ApiCallState? registerCallState,
    ApiCallState? resetPassCallState,
    ApiCallState? getProfileCallState,
    int? page,
    bool? validEmail,
    LoginModel? loginDataModel,
    String? successMsg,
    UserDataModel? userDataModel,
    bool? isRegValidate,
  }) {
    return LoginState(
      loginCallState: loginCallState ?? this.loginCallState,
      registerCallState: registerCallState ?? this.registerCallState,
      page: page ?? this.page,
      validEmail: validEmail ?? this.validEmail,
      resetPassCallState: resetPassCallState ?? this.resetPassCallState,
      loginDataModel: loginDataModel ?? this.loginDataModel,
      getProfileCallState: getProfileCallState ?? this.getProfileCallState,
      successMsg: successMsg ?? this.successMsg,
      userDataModel: userDataModel ?? this.userDataModel,
      isRegValidate: isRegValidate ?? this.isRegValidate,
    );
  }
}

class NotesInitial extends LoginState {}
