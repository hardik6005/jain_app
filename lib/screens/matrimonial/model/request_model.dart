import 'package:jain_app/utils/app_utils.dart';

class SocialRequestModel {
  String memberId;
  String nameInstitute;
  String institutePinCode;
  bool isVisible;
  String id;

  SocialRequestModel({
    required this.memberId,
    required this.nameInstitute,
    required this.institutePinCode,
    required this.isVisible,
    required this.id,
  });
}

class MatriRequestModel {

  String? id ;
  String? FName ;
  String? LName ;
  String? MName ;
  String? Age ;
  String? Weight ;
  String? BirthPlace ;
  String? NoBrother ;
  String? NoBroMar ;
  String? NoSis ;
  String? NoSisMar ;
  String? NatPlace ;
  String? OtherDet ;
  String? profilePic ;
  String? otherPic ;

  String? gender ;
  String? marital ;
  String? height ;
  String? blood ;
  String? complextion ;
  String? phyDisa ;
  String? manglik ;
  String? rashi ;
  String? eduType ;
  String? eduField ;
  String? workWith ;
  String? workAs ;
  String? location ;
  String? subComm ;
  String? fatherStatus ;
  String? motherStatus ;
  String? motherToung ;
  String? motherToungMatch ;
  String? locationMatch ;
  String? eduTypeMatch ;
  String? eduFieldMatch ;
  String? genderMatch ;
  String? selectedDOB ;
  String? selectedBTime ;
  String? aggree ;

  MatriRequestModel(
      {
        this.id,
        this.FName,
      this.LName,
      this.selectedDOB,
      this.selectedBTime,
      this.profilePic,
      this.otherPic,
      this.MName,
      this.Age,
      this.Weight,
      this.BirthPlace,
      this.NoBrother,
      this.NoBroMar,
      this.NoSis,
      this.NoSisMar,
      this.NatPlace,
      this.OtherDet,
      this.gender,
      this.marital,
      this.height,
      this.blood,
      this.complextion,
      this.phyDisa,
      this.manglik,
      this.rashi,
      this.eduType,
      this.eduField,
      this.workWith,
      this.workAs,
      this.location,
      this.subComm,
      this.fatherStatus,
      this.motherStatus,
      this.motherToung,
      this.motherToungMatch,
      this.locationMatch,
      this.eduTypeMatch,
      this.eduFieldMatch,
      this.aggree,
      this.genderMatch});
}

