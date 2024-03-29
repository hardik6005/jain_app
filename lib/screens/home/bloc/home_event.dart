part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();

  List<Object> get props => [];
}


//Validation Event
class ValidationEvent extends HomeEvent {
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
class VariableEvent extends HomeEvent {
  final String? gender;
  VariableEvent({
    this.gender,
  });
}

//Address Selection Event
class AddressSelectEvent extends HomeEvent {
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
class DropDownIDsEvent extends HomeEvent {
  int? jobId;
  int? educationId;
  DropDownIDsEvent({
    this.jobId,
    this.educationId,
  });
}

//GetProfile API Event
class GetProfileAPIEvent extends HomeEvent {
  GetProfileAPIEvent();
}

//Get Member API Event
class GetMemberAPIEvent extends HomeEvent {
  GetMemberAPIEvent();
}

//Get BusinessList API Event
class GetBusinessListAPIEvent extends HomeEvent {
  GetBusinessListAPIEvent();
}

//Get BusinessList API Event
class GetMatriListAPIEvent extends HomeEvent {
  GetMatriListAPIEvent();
}


//Get BusinessList API Event
class DropDownAPIEvent extends HomeEvent {
  DropDownAPIEvent();
}

