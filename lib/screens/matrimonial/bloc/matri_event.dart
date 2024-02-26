part of 'matri_bloc.dart';

abstract class MatriEvent {
  const MatriEvent();

  List<Object> get props => [];
}

//Variable Event
class VariableEvent extends MatriEvent {
  final String? gender;
  VariableEvent({
    this.gender,
  });
}

//Address Selection Event
class AddressSelectEvent extends MatriEvent {
  final bool? sameAsNative;
  final bool? sameAsPermanant;
  final bool? sameAsNative1;
  AddressSelectEvent({
    this.sameAsNative1,
    this.sameAsPermanant,
    this.sameAsNative,
  });
}

//Variable Event
class ValidationAccEvent extends MatriEvent {
  final bool? validBusiEmail;
  final bool? validBusiPhone;
  final bool? validMatroEmail;
  final bool? validMatroPhone;
  ValidationAccEvent({
    this.validBusiEmail,
    this.validBusiPhone,
    this.validMatroEmail,
    this.validMatroPhone,
  });
}

//Step page event
class StepPageEvent extends MatriEvent {
  final int page;
  StepPageEvent(this.page);
}

//Save Profile API
class SaveProfileAPI extends MatriEvent {
  SaveProfileAPI();
}


//Validate Event
class ValidateEvent extends MatriEvent {
  bool? isValidate;
  ValidateEvent(this.isValidate);
}

//Save Business Profile Validations
class SaveMatriProfileValidation extends MatriEvent {
  MatriRequestModel? requestModel;
  BuildContext? context;
  int? steps;
  SaveMatriProfileValidation(
      {this.requestModel, this.context, this.steps});
}

//Save Business Profile API
class SaveMatriProfileAPI extends MatriEvent {
  MatriRequestModel? requestModel;
  BuildContext? context;
  SaveMatriProfileAPI({this.requestModel, this.context});
}

class AllValidEvent extends MatriEvent {
  bool? allValid;
  AllValidEvent({this.allValid});
}

//Save Social Profile API
class SocialProfileAPIEvent extends MatriEvent {
  SocialRequestModel requestModel;
  BuildContext context;
  SocialProfileAPIEvent(this.requestModel, this.context);
}

//Get Social Profile API
class GetSocialProfileAPIEvent extends MatriEvent {
  GetSocialProfileAPIEvent();
}

//Get Business Profile API
class GetBusinessProfileAPIEvent extends MatriEvent {
  GetBusinessProfileAPIEvent();
}

//Save Business Profile API
class BusinessProfileAPIEvent extends MatriEvent {
  BusinessRequestModel requestModel;
  BuildContext context;
  BusinessProfileAPIEvent(this.requestModel, this.context);
}

//Dynamic DropDown API
class DropDownAPIEvent extends MatriEvent {
  DropDownAPIEvent();
}

//Dynamic DropDown API
class StateSetEvent extends MatriEvent {
  List<DropDownModel>? stateList;
  StateSetEvent(this.stateList);
}

//Depend Dynamic DropDown API
class DependDropDownAPIEvent extends MatriEvent {
  DependDropDownAPIEvent();
}

//Dynamic DropDown API
class DropDownIDsAccEvent extends MatriEvent {
  String? stateId;
  String? distictId;
  String? subDistictId;
  String? villageId;
  DropDownIDsAccEvent({
    this.stateId,
    this.distictId,
    this.subDistictId,
    this.villageId,
  });
}

//SubDropDown Set Event
class SubDropDownAccEvent extends MatriEvent {
  List<DropDownModel>? list;
  String? type;
  SubDropDownAccEvent({this.list, this.type});
}
