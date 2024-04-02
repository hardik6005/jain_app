import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/auth/model/login_model.dart';
import 'package:jain_app/screens/business/model/business_request_model.dart';
import 'package:jain_app/screens/matrimonial/data/matri_repository.dart';
import 'package:jain_app/screens/matrimonial/model/request_model.dart';
import 'package:jain_app/screens/member/data/member_repository.dart';
import 'package:jain_app/screens/member/model/member_request_model.dart';
import 'package:jain_app/screens/member/model/add_success_model.dart';
import 'package:jain_app/utils/api_constant.dart';

import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/string_constants.dart';


part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final MemberRepository _repository;
  // ModelAppliedFilter? modelAppliedFilters;

  MemberBloc({required MemberRepository repository})
      : _repository = repository,
        super(NotesInitial()) {
    on<AddMemberEvent>(
      (event, emit) => addMemberEvent(event, emit),
    );

    on<AddBusinessEvent>(
      (event, emit) => addBusinessEvent(event, emit),
    );

  }

  //Get MemberAPIEvent API event
  addMemberEvent(AddMemberEvent event, emit) async {
    emit(state.copyWith(memberCallState: ApiCallState.busy));
    final result = await _repository.addMemberAPI(event.request!);
    result.when(success: (AddSuccessModel model) {
      // emit(state.copyWith(matriListModel: model));

      //Success
      if(model.data.toString()=="[]"){

        emit(state.copyWith(memberCallState: ApiCallState.success));
        emit(state.copyWith(memberCallState: ApiCallState.none));

      }else{
        emit(state.copyWith(memberCallState: ApiCallState.none));
        Map map = model.data;
        List<String> errors = [];
        map.forEach((key, value) {
          errors.add(value.toString().replaceAll("[", "").replaceAll("]", ""));
        });
        okAlert(GlobalVariable.navState.currentContext!, errors[0].toString());
      }

    }, failure: (failure) {
      emit(state.copyWith(memberCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }


  //Get MemberAPIEvent API event
  addBusinessEvent(AddBusinessEvent event, emit) async {
    emit(state.copyWith(addBusinessState: ApiCallState.busy));
    final result = await _repository.addBusinessAPI(event.request!);
    result.when(success: (AddSuccessModel model) {
      // emit(state.copyWith(matriListModel: model));

      //Success
      if(model.data.toString()=="[]"){

        emit(state.copyWith(addBusinessState: ApiCallState.success));
        emit(state.copyWith(addBusinessState: ApiCallState.none));

      }else{
        emit(state.copyWith(addBusinessState: ApiCallState.none));
        Map map = model.data;
        List<String> errors = [];
        map.forEach((key, value) {
          errors.add(value.toString().replaceAll("[", "").replaceAll("]", ""));
        });
        okAlert(GlobalVariable.navState.currentContext!, errors[0].toString());
      }

    }, failure: (failure) {
      emit(state.copyWith(addBusinessState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }

}
