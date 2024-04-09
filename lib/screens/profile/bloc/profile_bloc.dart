import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/main.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';
import 'package:jain_app/screens/member/model/add_success_model.dart';
import 'package:jain_app/screens/profile/data/profile_repository.dart';
import 'package:jain_app/screens/profile/model/common_model.dart';
import 'package:jain_app/utils/app_preference.dart';

import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/string_constants.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repository;
  // ModelAppliedFilter? modelAppliedFilters;

  ProfileBloc({required ProfileRepository repository})
      : _repository = repository,
        super(NotesInitial()) {
    on<VariableEvent>(
      (event, emit) => variableSaveEvent(event, emit),
    );

    on<AddressSelectEvent>(
      (event, emit) => addressSelectEvent(event, emit),
    );

    on<ValidationEvent>(
      (event, emit) => validationEvent(event, emit),
    );


    on<DropDownIDsEvent>(
      (event, emit) => dropDownIDsEvent(event, emit),
    );

    on<GetProfileAPIEvent>(
          (event, emit) => getProfileAPIEvent(event, emit),
    );
    on<UpdatePassEvent>(
          (event, emit) => updatePassEvent(event, emit),
    );
  }



  //Event for validation Update profile API
  validationEvent(ValidationEvent event, emit) async {
    String validationText = "";
    bool isValidate = true;
    if (event.name!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.name}";
    }  else if (event.email!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.email}";
    }  else if (event.address!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.addressN}";
    } else {
      isValidate = false;

      emit(state.copyWith(saveProfileCallState: ApiCallState.busy));
      final result = await _repository.updateProfileAPI(event.name!, event.email!, event.address!, event.image!);
      result.when(success: (CommonModel model) async{

        emit(state.copyWith(saveProfileCallState: ApiCallState.success));
        emit(state.copyWith(saveProfileCallState: ApiCallState.none));
      }, failure: (failure) {
        emit(state.copyWith(saveProfileCallState: ApiCallState.failure));
        okAlert(event.context!, failure.toString());
      });
    }

    if (isValidate) {
      okAlert(event.context!, validationText);
    }
  }





  //Event for notes data
  variableSaveEvent(VariableEvent event, emit) async {
    emit(state.copyWith(gender: event.gender));
  }

  //Dropdown item set event
  dropDownIDsEvent(DropDownIDsEvent event, emit) async {
    if (event.jobId != null) {
      emit(state.copyWith(jobId: event.jobId.toString()));
    }
    if (event.educationId != null) {
      emit(state.copyWith(educationId: event.educationId.toString()));
    }
  }


  //Event for notes data
  addressSelectEvent(AddressSelectEvent event, emit) async {
    emit(state.copyWith(sameAsNative: event.sameAsNative));
    if (event.sameAsNative1 ?? false) {
      emit(state.copyWith(sameAsPermanant: false));
      emit(state.copyWith(sameAsNative1: true));
    } else {
      emit(state.copyWith(sameAsNative1: false));
    }

    if (event.sameAsPermanant ?? false) {
      emit(state.copyWith(sameAsPermanant: true));
      emit(state.copyWith(sameAsNative1: false));
    } else {
      emit(state.copyWith(sameAsPermanant: false));
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
      emit(state.copyWith(getProfileCallState: ApiCallState.success));
      emit(state.copyWith(getProfileCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(getProfileCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }


//Get Profile API event
  updatePassEvent(UpdatePassEvent event, emit) async {
    emit(state.copyWith(updatePassCallState: ApiCallState.busy));
    final result = await _repository.updatePasswordAPI(event.name!, event.email!);
    result.when(success: (AddSuccessModel model) {
      // String jsonModel = json.encode(model);
      // userDataModel = model;
      // AppPreference.instance.savePref(jsonModel, Pref.userData);
      emit(state.copyWith(updatePassCallState: ApiCallState.success));
      emit(state.copyWith(updatePassCallState: ApiCallState.none));

    }, failure: (failure) {
      emit(state.copyWith(updatePassCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }


}
