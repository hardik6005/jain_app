class MemberRequest{
  String? id;
  String? form_no;
  String? number_of_family_members;
  String? address;
  String? full_name;
  String? gender;
  String? dob;
  String? blood_group;
  String? educational_qualification;
  String? religious_education;
  String? profession;
  String? designation;
  String? election_card_no;
  String? aadhar_card_no;
  String? social_group1;
  String? social_group2;
  String? social_group3;
  String? special_activity;
  String? location;
  String? state_id;
  String? country_id;
  String? city;
  String? relation_with_hod;
  String? mobile_no;
  String? marital_status;
  String? sanghs;

  MemberRequest(
      {this.id,
      this.form_no,
      this.sanghs,
      this.number_of_family_members,
      this.address,
      this.full_name,
      this.gender,
      this.dob,
      this.marital_status,
      this.blood_group,
      this.educational_qualification,
      this.religious_education,
      this.profession,
      this.designation,
      this.election_card_no,
      this.aadhar_card_no,
      this.social_group1,
      this.social_group2,
      this.social_group3,
      this.special_activity,
      this.location,
      this.state_id,
      this.country_id,
      this.city,
      this.relation_with_hod,
      this.mobile_no});
}