import 'package:bloc/bloc.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/business/model/business_request_model.dart';
import 'package:jain_app/screens/job/model/search_job_list_model.dart';
import 'package:jain_app/screens/job/model/search_job_request.dart';
import 'package:jain_app/screens/member/data/member_repository.dart';
import 'package:jain_app/screens/member/model/add_success_model.dart';
import 'package:jain_app/screens/member/model/member_request_model.dart';
import 'package:jain_app/utils/app_utils.dart';

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
    on<SearchJobSeekerEvent>(
      (event, emit) => searchJobSeekerEvent(event, emit),
    );
  }

  //Get MemberAPIEvent API event
  addMemberEvent(AddMemberEvent event, emit) async {
    final req = event.request;

    if (checkNUaEM(req!.relation_with_hod) &&
        checkNUaEM(req!.full_name) &&
        checkNUaEM(req!.mobile_no) &&
        checkNUaEM(req!.gender) &&
        checkNUaEM(req!.marital_status) &&
        checkNUaEM(req!.dob) &&
        checkNUaEM(req!.blood_group) &&
        checkNUaEM(req!.educational_qualification) &&
        checkNUaEM(req.location) &&
        checkNUaEM(req.state_id) &&
        checkNUaEM(req.city) && isValidPhone(req!.mobile_no??"")) {
      emit(state.copyWith(memberCallState: ApiCallState.busy));
      final result = await _repository.addMemberAPI(event.request!);
      result.when(success: (AddSuccessModel model) {
        // emit(state.copyWith(matriListModel: model));

        //Success
        if (model.data.toString() == "[]") {
          emit(state.copyWith(memberCallState: ApiCallState.success));
          emit(state.copyWith(memberCallState: ApiCallState.none));
        } else {
          emit(state.copyWith(memberCallState: ApiCallState.none));
          Map map = model.data;
          List<String> errors = [];
          map.forEach((key, value) {
            errors
                .add(value.toString().replaceAll("[", "").replaceAll("]", ""));
          });
          okAlert(
              GlobalVariable.navState.currentContext!, errors[0].toString());
        }
      }, failure: (failure) {
        emit(state.copyWith(memberCallState: ApiCallState.failure));
        okAlert(GlobalVariable.navState.currentContext!, failure.toString());
      });
    } else {
      emit(state.copyWith(addMemberValidation: false));
    }
  }

  //Get MemberAPIEvent API event
  addBusinessEvent(AddBusinessEvent event, emit) async {
    final req = event.request;

    if (checkNUaEM(req!.business_title!) &&
        checkNUaEM(req.owner_name) &&
        checkNUaEM(req.mobile_number) &&
        checkNUaEM(req.business_category_id) &&
        checkNUaEM(req.owner_name) &&
        checkNUaEM(req.area) &&
        checkNUaEM(req.address_line_1) &&
        checkNUaEM(req.address_line_2) &&
        checkNUaEM(req.visiting_card) && isValidPhone(req!.mobile_number??"")) {
      emit(state.copyWith(addBusinessState: ApiCallState.busy));
      final result = await _repository.addBusinessAPI(event.request!);
      result.when(success: (AddSuccessModel model) {
        // emit(state.copyWith(matriListModel: model));

        //Success
        if (model.data.toString() == "[]") {
          emit(state.copyWith(addBusinessState: ApiCallState.success));
          emit(state.copyWith(addBusinessState: ApiCallState.none));
        } else {
          emit(state.copyWith(addBusinessState: ApiCallState.none));
          Map map = model.data;
          List<String> errors = [];
          map.forEach((key, value) {
            errors
                .add(value.toString().replaceAll("[", "").replaceAll("]", ""));
          });
          okAlert(
              GlobalVariable.navState.currentContext!, errors[0].toString());
        }
      }, failure: (failure) {
        emit(state.copyWith(addBusinessState: ApiCallState.failure));
        okAlert(GlobalVariable.navState.currentContext!, failure.toString());
      });
    } else {
      emit(state.copyWith(addBusinessValidation: false));
    }
  }

  //Get MemberAPIEvent API event
  searchJobSeekerEvent(SearchJobSeekerEvent event, emit) async {
    emit(state.copyWith(searchJobCallState: ApiCallState.busy));
    final result = await _repository.searchJobSeeker(event.request!);
    result.when(success: (SearchJobListModel model) {
      // emit(state.copyWith(matriListModel: model));

      emit(state.copyWith(searchJobListModel: model));
      emit(state.copyWith(searchJobCallState: ApiCallState.success));
      emit(state.copyWith(searchJobCallState: ApiCallState.none));
    }, failure: (failure) {
      emit(state.copyWith(searchJobCallState: ApiCallState.failure));
      okAlert(GlobalVariable.navState.currentContext!, failure.toString());
    });
  }
}
