import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/matrimonial/data/matri_repository.dart';
import 'package:jain_app/screens/matrimonial/model/request_model.dart';
import 'package:jain_app/screens/member/model/add_success_model.dart';
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


    on<SaveMatriProfileValidation>(
      (event, emit) => saveMatriProfileValidation(event, emit),
    );

    on<StepPageEvent>(
      (event, emit) => stepPageEvent(event, emit),
    );


    on<StateSetEvent>(
      (event, emit) => stateSetEvent(event, emit),
    );
    on<ValidateEvent>(
      (event, emit) => validateEvent(event, emit),
    );

    on<SaveMatriProfileAPI>(
      (event, emit) => saveMatriProfileAPI(event, emit),
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

  //SaveProfileAPI
  saveMatriProfileAPI(SaveMatriProfileAPI event, emit) async {
    emit(state.copyWith(matriCallState: ApiCallState.busy));

    final result = await _repository.matriProfileAPI(event.requestModel!);
    result.when(success: (AddSuccessModel model) {

      //Success
      if(model.data.toString()=="[]"){

        emit(state.copyWith(matriCallState: ApiCallState.success));
        emit(state.copyWith(matriCallState: ApiCallState.none));

      }else{
        emit(state.copyWith(matriCallState: ApiCallState.none));
        Map map = model.data;
        List<String> errors = [];
        map.forEach((key, value) {
          errors.add(value.toString().replaceAll("[", "").replaceAll("]", ""));
        });
        okAlert(GlobalVariable.navState.currentContext!, errors[0].toString());
      }

    }, failure: (failure) async {
      // await okAlert(event.context!, failure.toString());
      // emit(state.copyWith(matriCallState: ApiCallState.failure));
    });

  }

  //SaveProfile Validation
  saveMatriProfileValidation(SaveMatriProfileValidation event, emit) async {
    String validationText = "";
    bool isValidate = true;

    emit(state.copyWith(page: event.steps!+1));

    print("HERE----${event.steps}");

/*    if (event.steps == 1) {
      if (event.requestModel.profilePic!.isEmpty) {
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
      } else {
        isValidate = false;
        emit(state.copyWith(isValidate: true));
      // }
    }

    if (event.steps == 2) {
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
      } else {
    }
        isValidate = false;
        emit(state.copyWith(isValidate: true));
      // }
    }

    if (event.steps == 3) {
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
      } else {
    }
        isValidate = false;
        emit(state.copyWith(isValidate: true));
      // }
    }

    if (event.steps == 4) {
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
      } else {
    }
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
  }*/
  }

  // //Step Page Event
  stepPageEvent(StepPageEvent event, emit) async {
    emit(state.copyWith(page: event.page));
  }
}
