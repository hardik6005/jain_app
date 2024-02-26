part of 'login_bloc.dart';

class LoginState {
  final ApiCallState? loginCallState;
  final ApiCallState? getProfileCallState;
  final ApiCallState? forgotCallState;
  final ApiCallState? resetPassCallState;
  final int? page;
  final bool? validEmail;
  final UserDataModel? loginDataModel;
  final String? successMsg;

  LoginState({
    this.loginCallState = ApiCallState.none,
    this.forgotCallState = ApiCallState.none,
    this.getProfileCallState = ApiCallState.busy,
    this.resetPassCallState = ApiCallState.none,
    this.page = 0,
    this.validEmail = false,
    this.loginDataModel,
    this.successMsg,
  });

  List<Object> get props => [
        loginCallState!,
        forgotCallState!,
        resetPassCallState!,
        page!,
        validEmail!,
        loginDataModel!,
        successMsg!,
      ];

  LoginState copyWith({
    ApiCallState? loginCallState,
    ApiCallState? forgotCallState,
    ApiCallState? resetPassCallState,
    ApiCallState? getProfileCallState,
    int? page,
    bool? validEmail,
    UserDataModel? loginDataModel,
    String? successMsg,
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
    );
  }
}

class NotesInitial extends LoginState {}
