import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/main.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';
import 'package:jain_app/screens/home/data/home_repository.dart';
import 'package:jain_app/screens/home/model/drop_down_model.dart';
import 'package:jain_app/screens/matrimonial/model/matri_list_model.dart';
import 'package:jain_app/screens/member/model/business_list_model.dart';
import 'package:jain_app/screens/member/model/member_list_model.dart';
import 'package:jain_app/screens/profile/model/common_model.dart';
import 'package:jain_app/utils/app_preference.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/string_constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  // ModelAppliedFilter? modelAppliedFilters;

  HomeBloc({required HomeRepository repository})
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

    on<GetMemberAPIEvent>(
      (event, emit) => getMemberAPIEvent(event, emit),
    );

    on<GetBusinessListAPIEvent>(
      (event, emit) => getBusinessListAPIEvent(event, emit),
    );

    on<GetMatriListAPIEvent>(
      (event, emit) => getMatriListAPIEvent(event, emit),
    );
    on<DropDownAPIEvent>(
      (event, emit) => dropDownAPIEvent(event, emit),
    );
  }

  //Event for validation Update profile API
  validationEvent(ValidationEvent event, emit) async {
    String validationText = "";
    bool isValidate = true;
    if (event.name!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.name}";
    } else if (event.email!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.email}";
    } else if (event.address!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.addressN}";
    } else {
      isValidate = false;

      emit(state.copyWith(saveProfileCallState: ApiCallState.busy));
      final result = await _repository.updateProfileAPI(
          event.name!, event.email!, event.address!, event.image!);
      result.when(success: (CommonModel model) async {
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

  //Get MemberAPIEvent API event
  getMemberAPIEvent(GetMemberAPIEvent event, emit) async {
    emit(state.copyWith(getMemberCallState: ApiCallState.busy));
    final result = await _repository.getMemberList();
    result.when(success: (MemberListModel model) {
      emit(state.copyWith(memberListModel: model));
      emit(state.copyWith(getMemberCallState: ApiCallState.success));
      emit(state.copyWith(getMemberCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(getMemberCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }

  //Get MemberAPIEvent API event
  getBusinessListAPIEvent(GetBusinessListAPIEvent event, emit) async {
    emit(state.copyWith(businessCallState: ApiCallState.busy));
    final result = await _repository.getBusinessListAPIEvent();
    result.when(success: (BusinessListModel model) {
      print("HERE--------3");
      emit(state.copyWith(businessListModel: model));
      emit(state.copyWith(businessCallState: ApiCallState.success));
      emit(state.copyWith(businessCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(businessCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }

  //Get MemberAPIEvent API event
  getMatriListAPIEvent(GetMatriListAPIEvent event, emit) async {
    emit(state.copyWith(matriCallState: ApiCallState.busy));
    final result = await _repository.getMatriListAPIEvent();
    result.when(success: (MatriListModel model) {
      emit(state.copyWith(matriListModel: model));
      emit(state.copyWith(matriCallState: ApiCallState.success));
      emit(state.copyWith(matriCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(matriCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }


  //Get MemberAPIEvent API event
  dropDownAPIEvent(DropDownAPIEvent event, emit) async {
    emit(state.copyWith(matriCallState: ApiCallState.busy));
    final result = await _repository.dropDownAPIEvent();
    result.when(success: (dynamic model) {
      log("DSDSDSDSDSDSD : "+json.encode(model["data"]).toString());

      AppPreference.instance.savePref(model["data"].toString(), Pref.dropDownJson);
      dropDownJson = model["data"];

      log("DSDSDSDSDSDSD : "+dropDownJson.toString());

      emit(state.copyWith(matriCallState: ApiCallState.success));
      emit(state.copyWith(matriCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(matriCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }


}
