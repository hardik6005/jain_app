import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/main.dart';
import 'package:jain_app/screens/auth/data/login_repository.dart';
import 'package:jain_app/screens/auth/data/login_repository.dart';
import 'package:jain_app/screens/auth/model/forgot_request_model.dart';
import 'package:jain_app/screens/auth/model/login_model.dart';
import 'package:jain_app/screens/auth/model/success_model.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';
import 'package:jain_app/screens/home/home_screen.dart';
import 'package:jain_app/utils/app_preference.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/string_constants.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;
  // ModelAppliedFilter? modelAppliedFilters;

  LoginBloc({required LoginRepository repository})
      : _repository = repository,
        super(NotesInitial()) {
    on<LoginAPIEvent>(
      (event, emit) => loginAPIEvent(event, emit),
    );

    on<ForgotAPIEvent>(
      (event, emit) => forgotAPIEvent(event, emit),
    );
    on<ResetAPIEvent>(
      (event, emit) => resetAPIEvent(event, emit),
    );

    on<ValidationEvent>(
      (event, emit) => validationEvent(event, emit),
    );

    on<GetProfileAPIEvent>(
      (event, emit) => getProfileAPIEvent(event, emit),
    );

    on<StopLoaderEvent>(
      (event, emit) => stopLoaderEvent(event, emit),
    );
  }
  //Event for validation Login API
  validationEvent(ValidationEvent event, emit) async {
    String validationText = "";
    bool isValidate = true;
    if (event.birthYear!.isEmpty) {
      validationText = "${AppConstants.pleaseSelect} ${AppConstants.birthYear}";
    }else if (event.mobile == "555555555555") {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.memberId}";
    } else if (event.mobile.toString().length < 10) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.validPhone}";
    } else if (event.password!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.password}";
    } else {
      isValidate = false;

      add(
        LoginAPIEvent(
          context: event.context,
          phone: event.mobile,
          password: event.password,
          birthYear: event.birthYear,
        ),
      );
    }

    if (isValidate) {
      okAlert(event.context!, validationText);
    }
  }

  //Login API event
  loginAPIEvent(LoginAPIEvent event, emit) async {
    emit(state.copyWith(loginCallState: ApiCallState.busy));
    final result = await _repository.loginAPI(event.phone!, event.password!, event.birthYear!);
    result.when(success: (LoginModel model) async{
      String jsonModel = json.encode(model);
      AppPreference.instance.savePref(model.token!, Pref.myToken);
      emit(state.copyWith(loginDataModel: model));

      emit(state.copyWith(loginCallState: ApiCallState.success));
      emit(state.copyWith(loginCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(loginCallState: ApiCallState.failure));
      okAlert(event.context!, failure.toString());
    });
  }

  //Stop Loader event
  stopLoaderEvent(StopLoaderEvent event, emit) async {
    emit(state.copyWith(getProfileCallState: ApiCallState.none));
  }

  //Forgot pass API event
  forgotAPIEvent(ForgotAPIEvent event, emit) async {
    String validationText = "";
    bool isValidate = true;

    if (event.memebrId!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.memberId}";
    } else if (event.memebrId!.length < 5) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.validmemberId}";
    } else if (event.email!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.email}";
    } else if (!isValidEmail(event.email!)) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.validEmailId}";
    } else {
      isValidate = false;

      emit(state.copyWith(forgotCallState: ApiCallState.busy));
      final result =
          await _repository.forgotPasswordAPI(event.memebrId!, event.email!);
      result.when(success: (SuccessModel model) {
        // emit(state.copyWith(registerModel: model));
        emit(state.copyWith(successMsg: model.message));
        emit(state.copyWith(forgotCallState: ApiCallState.success));
        emit(state.copyWith(forgotCallState: ApiCallState.none));
      }, failure: (failure) {
        emit(state.copyWith(forgotCallState: ApiCallState.failure));
        okAlert(event.context!, failure.toString());
      });
    }

    if (isValidate) {
      okAlert(event.context!, validationText);
    }
  }

  //Reset pass API event
  resetAPIEvent(ResetAPIEvent event, emit) async {
    String validationText = "";
    bool isValidate = true;

    if (event.requestModel!.otp!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} otp";
    } else if (event.requestModel!.password!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.password}";
    } else if (event.requestModel!.password!.length < 8) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.strongpassword}";
    } else if (event.requestModel!.confPassword!.isEmpty) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.confPassword}";
    } else if (event.requestModel!.confPassword !=
        event.requestModel!.password) {
      validationText = "Confirm password is different then password";
    } else {
      isValidate = false;

      emit(state.copyWith(resetPassCallState: ApiCallState.busy));
      final result = await _repository.resetPasswordAPI(event.requestModel!);
      result.when(success: (SuccessModel model) {
        // emit(state.copyWith(registerModel: model));
        emit(state.copyWith(successMsg: model.message));
        emit(state.copyWith(resetPassCallState: ApiCallState.success));
        emit(state.copyWith(resetPassCallState: ApiCallState.none));
      }, failure: (failure) {
        emit(state.copyWith(resetPassCallState: ApiCallState.failure));
        okAlert(event.context!, failure.toString());
      });
    }

    if (isValidate) {
      okAlert(event.context!, validationText);
    }
  }

  //Get Profile API event
  getProfileAPIEvent(GetProfileAPIEvent event, emit) async {
    emit(state.copyWith(getProfileCallState: ApiCallState.busy));
    final result = await _repository.getProfilePI();
    result.when(success: (UserDataModel model) {
      String jsonModel = json.encode(model);
      userDataModel = model;
      AppPreference.instance.savePref(jsonModel, Pref.userData);
      emit(state.copyWith(userDataModel: model));
      emit(state.copyWith(getProfileCallState: ApiCallState.success));
      emit(state.copyWith(getProfileCallState: ApiCallState.none));
      emit(state.copyWith(loginCallState: ApiCallState.success));
      emit(state.copyWith(loginCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(getProfileCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }
}
