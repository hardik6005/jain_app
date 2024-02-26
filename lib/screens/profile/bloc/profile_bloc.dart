import 'package:bloc/bloc.dart';
import 'package:jain_app/screens/profile/data/profile_repository.dart';
import 'package:jain_app/screens/profile/model/profile_request_model.dart';

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
  validationEvent(ValidationEvent event, emit) async {
    emit(state.copyWith(validEmailO: event.validEmailO));
    emit(state.copyWith(validPhoneH: event.validPhoneH));
    emit(state.copyWith(validPhoneO: event.validPhoneO));
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


}
