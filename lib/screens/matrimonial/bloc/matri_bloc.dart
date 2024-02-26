import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/matrimonial/data/matri_repository.dart';
import 'package:jain_app/screens/matrimonial/model/request_model.dart';
import 'package:jain_app/utils/api_constant.dart';

import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/string_constants.dart';


part 'matri_event.dart';
part 'matri_state.dart';

class MatriBloc extends Bloc<MatriEvent, MatriState> {
  final MatriRepository _repository;
  // ModelAppliedFilter? modelAppliedFilters;

  MatriBloc({required MatriRepository repository})
      : _repository = repository,
        super(NotesInitial()) {
    on<VariableEvent>(
      (event, emit) => variableSaveEvent(event, emit),
    );

    on<AddressSelectEvent>(
      (event, emit) => addressSelectEvent(event, emit),
    );

    on<ValidationAccEvent>(
      (event, emit) => validationEvent(event, emit),
    );

    on<SaveProfileAPI>(
      (event, emit) => saveProfileAPI(event, emit),
    );

    on<StepPageEvent>(
      (event, emit) => stepPageEvent(event, emit),
    );

    on<SaveMatriProfileAPI>(
      (event, emit) => saveMatriProfileAPI(event, emit),
    );

    on<SaveMatriProfileValidation>(
      (event, emit) => saveMatriProfileValidation(event, emit),
    );

    on<BusinessProfileAPIEvent>(
      (event, emit) => businessProfileAPIEvent(event, emit),
    );

    on<StateSetEvent>(
      (event, emit) => stateSetEvent(event, emit),
    );

    on<SubDropDownAccEvent>(
      (event, emit) => subDropDownEvent(event, emit),
    );
    on<DropDownIDsAccEvent>(
      (event, emit) => dropDownIDsEvent(event, emit),
    );
    on<ValidateEvent>(
      (event, emit) => validateEvent(event, emit),
    );
  }

  //Event for notes data
  variableSaveEvent(VariableEvent event, emit) async {
    emit(state.copyWith(gender: event.gender));
  }

  //Event for notes data
  stateSetEvent(StateSetEvent event, emit) async {
    emit(state.copyWith(stateList: event.stateList));
  }

  //Event for validation email & mobile
  validationEvent(ValidationAccEvent event, emit) async {
    emit(state.copyWith(validBusiEmail: event.validBusiEmail));
    emit(state.copyWith(validBusiPhone: event.validBusiPhone));
    emit(state.copyWith(validMatroPhone: event.validMatroPhone));
    emit(state.copyWith(validMatroEmail: event.validMatroEmail));
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

  //SaveProfileAPI
  saveProfileAPI(SaveProfileAPI event, emit) async {
    emit(state.copyWith(saveProfileCallState: ApiCallState.busy));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(saveProfileCallState: ApiCallState.success));
  }

  //Validate Event
  validateEvent(ValidateEvent event, emit) async {
    emit(state.copyWith(isValidate: false));
  }

  //SaveProfile Validation
  saveMatriProfileValidation(SaveMatriProfileValidation event, emit) async {
    String validationText = "";
    bool isValidate = true;

    print("HERE----${event.steps}");

    if (event.steps == 1) {
     /* if (event.requestModel.profilePic!.isEmpty) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.profile}";
      } else if (event.requestModel.vanshId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.vansh}";
      } else if (event.requestModel.shakhaId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.shakha}";
      } else if (event.requestModel.subShakha == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.subShakha}";
      } else if (event.requestModel.gotraId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.gotra}";
      } else if (event.requestModel.subGotraId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.subGotra}";
      } else if (event.requestModel.surnameId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.surname}";
      } else if (event.requestModel.padviId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.padvi}";
      } else if (event.requestModel.name == "") {
        validationText = "${AppConstants.pleaseEnter} ${AppConstants.name}";
      } else if (event.requestModel.phone == "") {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.phone}";
      } else if (event.requestModel.genderId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.gender}";
      } else if (event.requestModel.emailId == "") {
        validationText = "${AppConstants.pleaseEnter} ${AppConstants.emailId}";
      } else if (!isValidEmail(event.requestModel.emailId!)) {
        validationText =
            "${AppConstants.pleaseEnter} ${AppConstants.validEmailId}";
      } else if (event.requestModel.maritalId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.selectMaritalStatus}";
      } else if (event.requestModel.manglikEffectId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.manglikEffect}";
      } else if (event.requestModel.address == "") {
        validationText = "${AppConstants.pleaseEnter} ${AppConstants.addressN}";
      } else if (event.requestModel.state == "") {
        validationText = "${AppConstants.pleaseSearch} ${AppConstants.pincode}";
      } else if (event.requestModel.distict == "") {
        validationText = "${AppConstants.pleaseSearch} ${AppConstants.pincode}";
      } else if (event.requestModel.subDistict == "") {
        validationText = "${AppConstants.pleaseSearch} ${AppConstants.pincode}";
      } else if (event.requestModel.village == "") {
        validationText = "${AppConstants.pleaseSearch} ${AppConstants.pincode}";
      } else if (event.requestModel.heightId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.height}";
      } else if (event.requestModel.skinToneId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.skinTone}";
      } else if (event.requestModel.bodyTypeId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.bodyType}";
      } else {*/
        isValidate = false;
        emit(state.copyWith(isValidate: true));
      // }
    }

    if (event.steps == 2) {/*
      if (event.requestModel.educationId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.education1}";
      } else if (event.requestModel.jobId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.jobs}";
      } else if (event.requestModel.income == "") {
        validationText =
            "${AppConstants.pleaseEnter} ${AppConstants.annualIncome}";
      } else if (event.requestModel.fatherOccId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.fatherOccu}";
      } else if (event.requestModel.motherName!.isEmpty) {
        validationText =
            "${AppConstants.pleaseEnter} ${AppConstants.motherName}";
      } else if (event.requestModel.motherOccId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.motherOccu}";
      } else if (event.requestModel.motherVanshId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.motherVansh}";
      } else if (event.requestModel.motherShakhaId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.motherShakha}";
      } else if (event.requestModel.motherSubShakhaId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.subShakha}";
      } else if (event.requestModel.motherGotraId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.motherGotra}";
      } else if (event.requestModel.motherSubGotraId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.motherSubGotra}";
      } else if (event.requestModel.motherPadviId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.motherPadvi}";
      } else if (event.requestModel.motherSurnameId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.motherSurname}";
      } else if (event.requestModel.motherPlace == "") {
        validationText =
            "${AppConstants.pleaseEnter} ${AppConstants.motherNativePlace}";
      } else if (event.requestModel.dadiName!.isEmpty) {
        validationText = "${AppConstants.pleaseEnter} ${AppConstants.dadiName}";
      } else if (event.requestModel.dadiVanshId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.dadiVansh}";
      } else if (event.requestModel.dadiShakhaId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.dadiShakha}";
      } else if (event.requestModel.dadiSubShakhaId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.subShakha}";
      } else if (event.requestModel.dadiGotraId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.dadiGotra}";
      } else if (event.requestModel.dadiSubGotraId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.dadiSubGotra}";
      } else if (event.requestModel.dadiPadviId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.dadiPadvi}";
      } else if (event.requestModel.dadiSurnameId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.dadiSurname}";
      } else if (event.requestModel.dadiPlace == "") {
        validationText =
            "${AppConstants.pleaseEnter} ${AppConstants.dadiNativePlace}";
      } else if (event.requestModel.naniName!.isEmpty) {
        validationText = "${AppConstants.pleaseEnter} ${AppConstants.naniName}";
      } else if (event.requestModel.naniVanshId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.naniVansh}";
      } else if (event.requestModel.naniShakhaId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.naniShakha}";
      } else if (event.requestModel.naniSubShakhaId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.subShakha}";
      } else if (event.requestModel.naniGotraId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.naniGotra}";
      } else if (event.requestModel.naniSubGotraId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.naniSubGotra}";
      } else if (event.requestModel.naniPadviId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.naniPadvi}";
      } else if (event.requestModel.naniSurnameId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.naniSurname}";
      } else if (event.requestModel.naniPlace == "") {
        validationText =
            "${AppConstants.pleaseEnter} ${AppConstants.naniNativePlace}";
      } else if (event.requestModel.brotherMarried == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.brotherDatail}";
      } else if (event.requestModel.brotherUnMarried == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.brotherDatail}";
      } else if (event.requestModel.sisterMarried == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.sisterDatail}";
      } else if (event.requestModel.sisterUnMarried == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.sisterDatail}";
      } else {*/
        isValidate = false;
        emit(state.copyWith(isValidate: true));
      // }
    }

    if (event.steps == 3) {/*
      if (event.requestModel.patMaritalId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.selectMaritalStatus}";
      } else if (event.requestModel.patManglikEffectId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.manglikEffect}";
      } else if (event.requestModel.patAgeF == "" ||
          event.requestModel.patAgeT == "") {
        validationText = "${AppConstants.pleaseEnter} Partner Age";
      } else if (event.requestModel.patHeightFId == "" ||
          event.requestModel.patHeightTId == "") {
        validationText = "${AppConstants.pleaseEnter} Partner Height";
      } else if (event.requestModel.patSkinToneId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.skinTone}";
      } else if (event.requestModel.patBodyTypeId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.bodyType}";
      } else if (event.requestModel.patEducationId == null) {
        validationText =
            "${AppConstants.pleaseSelect} ${AppConstants.education1}";
      } else if (event.requestModel.patjobId == null) {
        validationText = "${AppConstants.pleaseSelect} ${AppConstants.jobs}";
      } else if (event.requestModel.patIncome == "") {
        validationText =
            "${AppConstants.pleaseEnter} ${AppConstants.annualIncome}";
      } else {*/
        isValidate = false;
        emit(state.copyWith(isValidate: true));
      // }
    }

    if (event.steps == 4) {/*
      if (event.requestModel.otherInfo!.isEmpty) {
        validationText =
            "${AppConstants.pleaseEnter} ${AppConstants.otherInfo}";
      } else if (event.requestModel.cvPdf == null) {
        validationText = "${AppConstants.pleaseSelect} CV";
      } else if (event.requestModel.docPdf == null) {
        validationText = "${AppConstants.pleaseSelect} Documents";
      } else if (event.requestModel.aggre1 == "0") {
        validationText = AppConstants.pleaseAcceptTerm;
      } else if (event.requestModel.aggre2 == "0") {
        validationText = AppConstants.pleaseAcceptTerm;
      } else if (event.requestModel.aggre3 == "0") {
        validationText = AppConstants.pleaseAcceptTerm;
      } else {*/
        print("HEREEEEEE--------2");
        isValidate = false;
        emit(state.copyWith(isValidate: true));

        emit(state.copyWith(saveMatriProfileCallState: ApiCallState.busy));

        // final result = await _repository.matriProfileAPI(event.requestModel!);
        // result.when(success: (AddMatriMonialDataModel model) {
        //   print("-------------------------");
        //   emit(state.copyWith(saveMatriProfileCallState: ApiCallState.success));
        //   emit(state.copyWith(saveMatriProfileCallState: ApiCallState.none));
        // }, failure: (failure) async {
        //   // await okAlert(event.context!, failure.toString());
        //   // emit(state.copyWith(matriCallState: ApiCallState.failure));
        // });

        // await saveMatriProfileAPI(
        //     SaveMatriProfileAPI(
        //       context: event.context,
        //       requestModel: event.requestModel,
        //     ),
        //     emit);
      // }
    }

    if (isValidate) {
      delay(100).then((value) {
        okAlert(event.context!, validationText);
      });
    }
  }

  //SaveProfileAPI
  saveMatriProfileAPI(SaveMatriProfileAPI event, emit) async {
    emit(state.copyWith(matriCallState: ApiCallState.busy));

    // final result = await _repository.matriProfileAPI(event.requestModel!);
    // result.when(success: (AddMatriMonialDataModel model) {
    //   print("-------------------------");
    //   emit(state.copyWith(matriCallState: ApiCallState.success));
    //   emit(state.copyWith(matriCallState: ApiCallState.none));
    // }, failure: (failure) async {
    //   // await okAlert(event.context!, failure.toString());
    //   // emit(state.copyWith(matriCallState: ApiCallState.failure));
    // });

  }

  //Step Page Event
  stepPageEvent(StepPageEvent event, emit) async {
    emit(state.copyWith(page: event.page));
  }


  //Business Profile API Event
  businessProfileAPIEvent(BusinessProfileAPIEvent event, emit) async {
    String validationText = "";
    bool isValidate = true;

    if (event.requestModel.firmName!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.nameFirm}";
    } else if (event.requestModel.description!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.aboutFirm}";
    } else if (event.requestModel.firmAddress!.isEmpty) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.addressFirm}";
    } else if (event.requestModel.phone!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.contactNum}";
    } else if (event.requestModel.firmAddress!.isEmpty) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.addressFirm}";
    } else if (event.requestModel.state == "") {
      validationText = "${AppConstants.pleaseSearch} ${AppConstants.pincode}";
    } else if (event.requestModel.distict == "") {
      validationText = "${AppConstants.pleaseSearch} ${AppConstants.pincode}";
    } else if (event.requestModel.subDistict == "") {
      validationText = "${AppConstants.pleaseSearch} ${AppConstants.pincode}";
    } else if (event.requestModel.village == "") {
      validationText = "${AppConstants.pleaseSearch} ${AppConstants.pincode}";
    } else if (event.requestModel.firmEmail!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.emailId}";
    } else if (!isValidEmail(event.requestModel.firmEmail!)) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.validEmailId}";
    } else if (event.requestModel.recruitAvail!.isEmpty) {
      validationText =
          "${AppConstants.pleaseSelect} ${AppConstants.recruitAvail}";
    } else if (event.requestModel.noMale!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.noMale}";
    } else if (event.requestModel.noFeMale!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.noFemale}";
    } else if (event.requestModel.approxSalary!.isEmpty) {
      validationText =
          "${AppConstants.pleaseEnter} ${AppConstants.approxSalary}";
    } else if (event.requestModel.jobTitle!.isEmpty) {
      validationText = "${AppConstants.pleaseEnter} ${AppConstants.jobTitle}";
    } else {
      isValidate = false;

      emit(state.copyWith(saveBusiProfileCallState: ApiCallState.busy));

      // final result = await _repository.businessProfileAPI(event.requestModel);
      // result.when(success: (BusinessProfileAddModel model) {
      //   // emit(state.copyWith(successMsg: model.message!));
      //   emit(state.copyWith(successMsg: model.message));
      //   emit(state.copyWith(saveBusiProfileCallState: ApiCallState.success));
      //   emit(state.copyWith(saveBusiProfileCallState: ApiCallState.none));
      // }, failure: (failure) {
      //   emit(state.copyWith(saveBusiProfileCallState: ApiCallState.failure));
      //   okAlert(event.context, failure.toString());
      // });
    }

    if (isValidate) {
      delay(100).then((value) {
        okAlert(event.context, validationText);
      });
    }
  }

  //Event for notes data
  dropDownIDsEvent(DropDownIDsAccEvent event, emit) async {
    //Address
    if (event.stateId != null) {
      emit(state.copyWith(stateId: event.stateId));
    }
    if (event.distictId != null) {
      emit(state.copyWith(distictId: event.distictId));
    }

    if (event.subDistictId != null) {
      emit(state.copyWith(subDistictId: event.subDistictId));
    }

    if (event.villageId != null) {
      emit(state.copyWith(villageId: event.villageId));
    }
  }

  subDropDownEvent(SubDropDownAccEvent event, emit) async {
    if (event.type == PARAMS.state) {
      emit(state.copyWith(stateList: event.list));
    }
    if (event.type == PARAMS.district) {
      emit(state.copyWith(distictList: event.list));
    }

    if (event.type == PARAMS.subDistrict) {
      emit(state.copyWith(subDistictList: event.list));
    }

    if (event.type == PARAMS.village) {
      emit(state.copyWith(villageList: event.list));
    }
  }
}
