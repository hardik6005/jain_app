part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();

  List<Object> get props => [];
}


//Validation Event
class ValidationEvent extends ProfileEvent {
  String? mobile;
  String? name;
  String? email;
  String? image;
  String? address;
  BuildContext? context;
  ValidationEvent({
    this.mobile,
    this.name,
    this.context,
    this.email,
    this.image,
    this.address,
  });
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


//Dynamic DropDown API
class DropDownIDsEvent extends ProfileEvent {
  int? jobId;
  int? educationId;
  DropDownIDsEvent({
    this.jobId,
    this.educationId,
  });
}

//GetProfile API Event
class GetProfileAPIEvent extends ProfileEvent {
  GetProfileAPIEvent();
}

