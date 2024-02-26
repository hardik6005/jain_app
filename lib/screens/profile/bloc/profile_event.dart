part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();

  List<Object> get props => [];
}

//Variable Event
class VariableEvent extends ProfileEvent {
  final String? gender;
  VariableEvent({
    this.gender,
  });
}

//Address Selection Event
class AddressSelectEvent extends ProfileEvent {
  final bool? sameAsNative;
  final bool? sameAsPermanant;
  final bool? sameAsNative1;
  AddressSelectEvent({
    this.sameAsNative1,
    this.sameAsPermanant,
    this.sameAsNative,
  });
}

//Validation Event
class ValidationEvent extends ProfileEvent {
  final bool? validEmailO;
  final bool? validPhoneO;
  final bool? validPhoneH;
  ValidationEvent({
    this.validEmailO,
    this.validPhoneH,
    this.validPhoneO,
  });
}

//Save Profile API
class SaveProfileAPI extends ProfileEvent {
  ProfileRequestModel requestModel;
  SaveProfileAPI(this.requestModel);
}

//Dynamic DropDown API
class DropDownIDsEvent extends ProfileEvent {
  int? jobId;
  int? educationId;
  DropDownIDsEvent({
    this.jobId,
    this.educationId,
  });
}
