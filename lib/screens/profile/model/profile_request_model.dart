import 'package:jain_app/utils/app_utils.dart';

class ProfileRequestModel {
  String? member_id;
  String? jobId;
  String? job_specified;
  String? education_id;
  String? education_detail;
  String? home_number;
  String? office_number;
  String? office_email;
  String? approx_salary;
  String? matrimonial_directorys_contact_info;
  String? matrimonial_directorys_email_id;
  String? matrimonial_directorys_salary;
  String? matrimonial_directorys_visiting_card;
  String? member_directorys_contact_info;
  String? member_directorys_email_id;
  String? member_directorys_salary;
  String? member_directorys_visiting_card;
  PickerModel? visitingCardPath;

  ProfileRequestModel({
    this.member_id,
    this.jobId,
    this.job_specified,
    this.education_id,
    this.education_detail,
    this.home_number,
    this.office_number,
    this.office_email,
    this.matrimonial_directorys_contact_info,
    this.matrimonial_directorys_email_id,
    this.matrimonial_directorys_salary,
    this.matrimonial_directorys_visiting_card,
    this.member_directorys_contact_info,
    this.member_directorys_email_id,
    this.member_directorys_salary,
    this.member_directorys_visiting_card,
    this.approx_salary,
    this.visitingCardPath,
  });
}
