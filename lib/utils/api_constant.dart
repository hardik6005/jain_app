import 'package:flutter_dotenv/flutter_dotenv.dart';

class URLS {
  /* Client End Server*/
  static String baseUrl = "${dotenv.env['BASE_URL']!}/api/";
  static String imageUrl = dotenv.env['IMAGE_URL']!;

  //APIs
  static String memberLogin = "member-login";
  static String getProfile = "profile";
  static String members = "members";
  static String business_directory = "member-business-directory/list";
  static String matrimonial = "matrimonial";
  static String dropdowns = "dropdowns";
  static String createMember = "create-member";
  static String updateMember = "update-member";
  static String createBusinessDir = "member-business-directory/create";
  static String updateBusinessDir = "member-business-directory/update/";
  static String addMatrimonial = "add-matrimonial";
  static String updateMatrimonial = "update-matrimonial/";
  static String searchJobSeeker = "search-job-seeker";
  static String searchMatriMonialList = "search-matrimonial-list";
  static String searchMatriMonialMembPref = "search-matrimonial-member-preference/";
  static String updatePassword = "update-password";
  static String register = "new-member-request-form";

  //DropDown
  static String dynamicValue = "dynamicValue";
  static String dependDynamicValueAll = "dependDynamicValueAll";
  static String signup = "signup";
  static String mobileLogin = "mobileLogin";
  static String mobileForgotPassword = "mobileForgotPassword";
  static String mobileResetPassword = "mobileResetPassword";
  static String dependDynamicValue = "dependDynamicValue";
  static String memberSocialProfile = "memberSocialProfile";
  static String memberBusinessProfile = "memberBusinessProfile";
  static String matrimonialProfile = "matrimonialProfile";
  static String memberProfile = "memberProfile";
  static String memberProfileEdit = "memberProfileEdit";
  static String getSocialProfile = "getSocialProfile";
  static String getBusinessProfile = "getBusinessProfile";
  static String addFamilyMember = "addFamilyMember";
  static String searchMemberId = "searchMemberId";
  static String getFamilyMember = "getFamilyMember";
  static String addFamilyMemberId = "addFamilyMemberId";
  static String getfriendMember = "getfriendMember";
  static String addfriendMemberId = "addfriendMemberId";
  static String businessList = "businessList";
  static String matrimonialList = "matrimonialList";
  static String memberDirectoryList = "memberDirectoryList";
  static String getMatrimonialProfile = "getMatrimonialProfile";
  static String dashboard = "dashboard";
  static String siderList = "siderList";
  static String communityDirectory = "communityDirectory";
  static String mainBranchList = "mainBranchList";
  static String mainBranchDetails = "mainBranchDetails";
  static String subBranchList = "subBranchList";
  static String subBranchDetails = "subBranchDetails";

}

class PARAMS {
  static String deviceId = "device-id";
  static String deviceType = "device-type";
  static String deviceToken = "device-token";
  static String ram = "ram";
  static String rom = "rom";
  static String isMobile = "is-mobile";
  static String contentType = "Content-Type";

  static String type = "type";
  static String id = "id";

  //Register Param
  static String vanshId = "vansh_id";
  static String shakhaId = "shakha_id";
  static String subShakhaId = "sub_shakha_id";
  static String gotraId = "gotra_id";
  static String subGotraId = "sub_gotra_id";
  static String padviId = "padvi_id";
  static String surnameId = "surname_id";
  static String name = "name";
  static String fatherName = "father_name";
  static String mobileNo = "mobile_no";
  static String emailId = "email";
  static String genderId = "gender_id";
  static String maritalStatusId = "marital_status_id";
  static String dob = "dob";
  static String nativeAddress = "native_address";
  static String nativeState = "native_state_id";
  static String nativeDistict = "native_district_id";
  static String nativeSubDistict = "native_sub_district_id";
  static String nativeVillage = "native_village_id";
  static String permanentAddress = "permanent_address";
  static String permanentState = "permanent_state_id";
  static String permanentDistict = "permanent_district_id";
  static String permanentSubDistict = "permanent_sub_district_id";
  static String permanentVillage = "permanent_village_id";
  static String presentAddress = "present_address";
  static String permanent_pin_code = "permanent_pin_code";
  static String present_pin_code = "present_pin_code";
  static String presentState = "present_state_id";
  static String presentDistict = "present_district_id";
  static String presentSubDistict = "present_sub_district_id";
  static String presentVillage = "present_village_id";
  static String privacyPolicy = "privacy_policy";
  static String relation_side_id = "relation_side_id";
  static String relation_name_id = "relation_name_id";
  static String nativePinCode = "native_pin_code";
  static String presentPinCode = "present_pin_code";
  static String permenentPinCode = "permanent_pin_code";

  //Sub Drop Down PARAM
  static String subGotra = "sub_gotra";
  static String subShakha = "sub_shakha";
  static String relationName = "relation_sides";
  static String state = "state";
  static String stateId = "state_id";
  static String stateN = "stateN";
  static String stateP = "stateP";
  static String statePR = "statePR";
  static String district = "district";
  static String districtId = "district_id";
  static String districtN = "districtN";
  static String districtP = "districtP";
  static String districtPR = "districtPR";
  static String subDistrict = "sub_district";
  static String subDistrictId = "sub_district_id";
  static String subDistrictN = "sub_districtN";
  static String subDistrictP = "sub_districtP";
  static String subDistrictPR = "sub_districtPR";
  static String village = "village";
  static String villageId = "village_id";
  static String villageN = "villageN";
  static String villageP = "villageP";
  static String villagePR = "villagePR";
  static String maritalStatus = "maritalStatus";

  //Login PARAM
  static String memberId = "member_id";
  static String otp = "otp";
  static String passwordConfirmation = "password_confirmation";

  //Social Profile
  static String socialInstituteName = "name_of_social_institute";
  static String picodeInstitute = "institue_place_by_pincode";
  static String show = "show";

  //Business Profile
  static String firm_name = "firm_name";
  static String firm_address = "firm_address";
  static String contact_number = "contact_number";
  static String firm_email = "firm_email";
  static String firm_visiting_card = "firm_visiting_card";
  static String recruitment_available = "recruitment_available";
  static String no_of_male = "no_of_male";
  static String no_of_female = "no_of_female";
  static String approx_salary = "approx_salary";
  static String business_directory_firm_name = "business_directory_firm_name";
  static String business_directory_firm_address =
      "business_directory_firm_address";
  static String business_directory_firm_email = "business_directory_firm_email";
  static String business_directory_firm_visiting_card =
      "business_directory_firm_visiting_card";
  static String business_directory_recruitment_available =
      "business_directory_recruitment_available";
  static String business_directory_no_of_male = "business_directory_no_of_male";
  static String business_directory_no_of_female =
      "business_directory_no_of_female";
  static String business_directory_approx_salary =
      "business_directory_approx_salary";
  static String business_directory_contact_number =
      "business_directory_contact_number";

  //Add Profile
  static String jobId = "job_id";
  static String job_sector_id = "job_sector_id";
  static String job_specified = "job_specified";
  static String education_id = "education_id";
  static String education_detail = "education_detail";
  static String home_number = "home_number";
  static String office_number = "office_number";
  static String office_email = "office_email";
  static String visiting_card = "visiting_card";
  static String matrimonial_directorys_contact_info =
      "matrimonial_directorys_contact_info";
  static String matrimonial_directorys_email_id =
      "matrimonial_directorys_email_id";
  static String matrimonial_directorys_salary = "matrimonial_directorys_salary";
  static String matrimonial_directorys_visiting_card =
      "matrimonial_directorys_visiting_card";
  static String member_directorys_contact_info =
      "member_directorys_contact_info";
  static String member_directorys_email_id = "member_directorys_email_id";
  static String member_directorys_salary = "member_directorys_salary";
  static String member_directorys_visiting_card =
      "member_directorys_visiting_card";

  static String otherInformation = "other_information";

  // Add Family Member
  static String relationSideId = "relation_side_id";
  static String relationNameId = "relation_name_id";

  static String phone = "phone_no";
  static String income = "annual_income";
  static String patIncome = "partner_annual_income";
  static String distict = "distict_id";
  static String subDistict = "sub_district_id";
  static String profilePic = "profile_pic";
  static String manglikEffectId = "manglik_effect_id";
  static String address = "address";
  static String pincode = "pincode";
  static String pin_code = "pin_code";
  static String description = "description";
  static String jobTitle = "job_title";
  static String heightId = "height";
  static String patHeightFId = "partner_heigh_from";
  static String patHeightTId = "partner_heigh_to";
  static String skinToneId = "skin_tone_id";
  static String patSkinToneId = "partner_skin_id";
  static String bodyTypeId = "body_type_id";
  static String patBodyTypeId = "partner_body_type_id";
  static String educationId = "education_id";
  static String jobSectId = "job_sector_id";
  static String patEducationId = "partner_education_id";
  static String patjobId = "partner_job_sector_id";
  static String fatherOccId = "father_occupations_id";
  static String motherOccId = "mother_occupations_id";
  static String motherName = "mother_name";
  static String motherVanshId = "mother_vansh_id";
  static String dadiVanshId = "dadi_vansh_id";
  static String naniVanshId = "nani_vansh_id";
  static String motherShakhaId = "mother_shakha_id";
  static String dadiShakhaId = "dadi_shakha_id";
  static String naniShakhaId = "nani_shakha_id";
  static String motherSubShakhaId = "mother_sub_shakha_id";
  static String dadiSubShakhaId = "dadi_sub_shakha_id";
  static String naniSubShakhaId = "nani_sub_shakha_id";
  static String motherGotraId = "mother_gotra_id";
  static String dadiGotraId = "dadi_gotra";
  static String naniGotraId = "nani_gotra_id";
  static String motherSubGotraId = "mother_sub_gotra_id";
  static String dadiSubGotraId = "dadi_sub_gotra_id";
  static String naniSubGotraId = "nani_sub_gotra_id";
  static String motherPadviId = "mother_padvi_id";
  static String dadiPadviId = "dadi_padvi_id";
  static String naniPadviId = "nani_padvi_id";
  static String motherSurnameId = "mother_surname_id";
  static String dadiSurnameId = "dadi_surname_id";
  static String naniSurnameId = "nani_surname_id";
  static String motherPlace = "mother_native_place";
  static String dadiPlace = "nani_native_place";
  static String naniPlace = "dadi_native_place";
  static String dadiName = "dadi_name";
  static String naniName = "nani_name";
  static String brotherMarried = "brother_details_married_count";
  static String brotherUnMarried = "brother_details_un_married_count";
  static String sisterUnMarried = "sister_details_married_count";
  static String sisterMarried = "sister_details_un_married_count";
  static String patMaritalId = "partner_marital_status_id";
  static String maritalId = "marital_status_id";
  static String patManglikEffectId = "partner_manglik_effect_id";
  static String patAgeF = "partner_age_from";
  static String patAgeT = "partner_age_to";
  static String other_info = "other_info";
  static String partner_age_from = "partner_age_from";
  static String partner_age_to = "partner_age_to";
  static String otherInfo = "";
  static String cvPdf = "";
  static String docPdf = "";
  static String aggre1 = "send_profile_details";
  static String aggre2 = "matrimonial_managements";
  static String aggre3 = "rrs_matrimonial_terms_conditions";

  static String communityId = "community_id";
  static String mainBranchId = "main_branch_id";
  static String subBranchId = "sub_branch_id";

  //This App
  static String phone_number = "phone_number";
  static String password = "password";
  static String birth_year = "birth_year";

  //Business
  static String business_title = "business_title";
  static String owner_name = "owner_name";
  static String mobile_number = "mobile_number";
  static String business_category_id = "business_category_id";
  static String state_id = "state_id";
  static String city_id = "city_id";
  static String area = "area";
  static String address_line_1 = "address_line_1";
  static String address_line_2 = "address_line_2";
}
