import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_dialogue.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/title_widget.dart';
import 'package:jain_app/screens/member/bloc/member_bloc.dart';
import 'package:jain_app/screens/member/data/member_datasource.dart';
import 'package:jain_app/screens/member/data/member_repository.dart';
import 'package:jain_app/screens/member/model/member_list_model.dart';
import 'package:jain_app/screens/member/model/member_request_model.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';

class AddMemberScreen extends StatefulWidget {
  final Member? member;

  const AddMemberScreen({Key? key, this.member}) : super(key: key);

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  TextEditingController controllerFormNo = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerDOB = TextEditingController();
  TextEditingController controllerAdhar = TextEditingController();
  TextEditingController controllerSpecial1 = TextEditingController();
  TextEditingController controllerSpecial2 = TextEditingController();
  TextEditingController controllerSpecial3 = TextEditingController();
  TextEditingController controllerSpecialAct = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerDesignation = TextEditingController();
  TextEditingController controllerReligious = TextEditingController();
  TextEditingController controllerEletcion = TextEditingController();

  bool passHide = true;

  //Date picker variable
  DateTime dateTemp = DateTime.now();
  String selectedDate = "";

  final subGotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final subShakhaKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final gotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();

  final distictPRKey = GlobalKey<DropdownSearchState<String>>();
  final statePRKey = GlobalKey<DropdownSearchState<String>>();
  final distictNKey = GlobalKey<DropdownSearchState<String>>();
  final stateNKey = GlobalKey<DropdownSearchState<String>>();
  final distictPKey = GlobalKey<DropdownSearchState<String>>();
  final statePKey = GlobalKey<DropdownSearchState<String>>();
  final subDistictPKey = GlobalKey<DropdownSearchState<String>>();
  final subDistictPRKey = GlobalKey<DropdownSearchState<String>>();
  final subDistictNKey = GlobalKey<DropdownSearchState<String>>();
  final villageNKey = GlobalKey<DropdownSearchState<String>>();
  final villagePKey = GlobalKey<DropdownSearchState<String>>();
  final villagePRKey = GlobalKey<DropdownSearchState<String>>();

  bool isNativeShow = false;
  bool isPresentShow = false;
  bool isPermenentShow = false;

  bool? termAccept = false;

  bool isLoading = false;

  List<DropDownModel> relationHofDD = [];
  String relationHOF = "";
  List<DropDownModel> sanghsDD = [];
  String sanghs = "";
  List<DropDownModel> maritalStatusDD = [];
  String maritalStatus = "";
  List<DropDownModel> bloodGroupDD = [];
  String bloodGroup = "";
  List<DropDownModel> eduQualificaDD = [];
  String eduQualifica = "";
  List<DropDownModel> profiessionDD = [];
  String profiession = "";
  List<DropDownModel> stateDD = [];
  String state = "";
  List<DropDownModel> countryDD = [];
  String country = "";
  List<DropDownModel> cityDD = [];
  String city = "";
  String gender = "";
  String location = "";

  MemberBloc memberBloc = MemberBloc(
    repository: MemberRepository(
      dataSource: MemberDataSource(),
    ),
  );

  @override
  void initState() {
    super.initState();
    relationHofDD = getDropDown("relationWithHOFDropDown");
    sanghsDD = getDropDown("sanghs");
    maritalStatusDD = getDropDown("maritalStatusDropDown");
    bloodGroupDD = getDropDown("memberbloodGroupDropDown");
    eduQualificaDD = getDropDown("educationalQualificationDropDown");
    profiessionDD = getDropDown("professions");
    stateDD = getDropDown("states");
    countryDD = getDropDown("countries");
    cityDD = getDropDown("cities");

    controllerFormNo.text = "1990";
    setState(() {});

    if (widget.member != null) {
      final mem = widget.member;
      controllerAdhar.text = mem!.aadharCardNo ?? "";
      bloodGroup = mem.bloodGroup.toString();
      city = mem.city.toString();
      // sanghs = mem..toString();
      state = mem.stateId.toString();
      country = mem.countryId.toString();
      profiession = mem.profession.toString();
      selectedDate = mem.dob.toString();
      eduQualifica = mem.educationalQualification.toString();
      controllerEletcion.text = mem.electionCardNo ?? "";
      controllerFormNo.text = mem.formNo ?? "";
      controllerName.text = mem.fullName ?? "";
      gender = mem.gender.toString();
      location = mem.location.toString();
      maritalStatus = mem.maritalStatus.toString();
      controllerPhone.text = mem.mobileNo ?? "";
      relationHOF = mem.relationWithHod.toString();
      controllerReligious.text = mem.religiousEducation ?? "";
      controllerSpecial1.text = mem.socialGroup1 ?? "";
      controllerSpecial2.text = mem.socialGroup1 ?? "";
      controllerSpecial3.text = mem.socialGroup3 ?? "";
      controllerSpecialAct.text = mem.specialActivity ?? "";
      controllerDesignation.text = mem.designation ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberBloc, MemberState>(
      bloc: memberBloc,
      listener: (context, state) {
        if (state.memberCallState == ApiCallState.success) {
          okAlert(
              GlobalVariable.navState.currentContext!,
              isDismiss: false,
              (widget.member != null)
                  ? "Profile updated successfully!"
                  : "Member created successfully.", onTap: () {
            pop(context, data: "true");
          });
        }
      },
      child: BlocBuilder<MemberBloc, MemberState>(
          bloc: memberBloc,
          builder: ((context, state) {
            return Container(
              color: whiteColor,
              child: SafeArea(
                top: false,
                child: Scaffold(
                  appBar: appBar(
                    context,
                    "Create Member",
                    Imagename.icBack,
                    "",
                    whiteIntColor,
                    leadingAction: () {
                      pop(context);
                    },
                    action: [homeWidget(context)],
                  ),
                  body: commonShapeContainer(bodyView(state)),
                  backgroundColor: clrApp,
                  resizeToAvoidBottomInset: false,
                ),
              ),
            );
          })),
    );
  }

  Widget bodyView(MemberState statee) {
    return Container(
      color: whiteColor,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  sb(30),

                  const TitleWidget("Form Details"),
                  sb(10),

                  //Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Form No.",
                    hintText: "Enter Form No.",
                    numberOfLines: 1,
                    enable: false,
                    controller: controllerFormNo,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(30),

                  const TitleWidget("Member Details"),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Relation With HOF*",
                    isValidate: statee.addMemberValidation,
                    list: relationHofDD,
                    showSearch: false,
                    isSuffixImage: true,
                    isDisable: widget.member != null,
                    suffixImage: Imagename.downArrow,
                    selectedItem: relationHOF.isNotEmpty
                        ? DropDownModel(id: relationHOF, name: relationHOF)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      relationHOF = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Name
                  CustomTextField(
                    context: context,
                    textFieldName: "${AppConstants.fullname}*",
                    isValidate: statee.addMemberValidation,
                    hintText: AppConstants.enterName,
                    numberOfLines: 1,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Contact No.
                  CustomTextField(
                    context: context,
                    textFieldName: "${AppConstants.phone}*",
                    hintText: AppConstants.enterPhone,
                    isValidate: statee.addMemberValidation,
                    enable: widget.member == null,
                    numberOfLines: 1,
                    maxLenght: 10,
                    controller: controllerPhone,
                    textInputAction: TextInputAction.done,
                    prefixWidget: TitleTextView(
                      "   +91  ",
                      fontFamily: FontName.nunitoSansSemiBold,
                      fontSize: f155,
                    ),
                    keboardType: textInputType(),
                    inputFormatters: <TextInputFormatter>[mobileInputFormatter],
                    isImage: true,
                    onSumitted: () {
                      if (controllerPhone.text.isNotEmpty) {
                        // registerBloc
                        //     .add(RegValidationEvent(validPhone: true));
                      }
                    },
                    onChange: (v) {
                      controllerPhone.text = v;
                      controllerPhone.selection = TextSelection.fromPosition(
                          TextPosition(offset: controllerPhone.text.length));
                      setState(() {});
                    },
                  ),
                  validationText(
                    controllerPhone.text.isNotEmpty &&
                        /*state.validPhone! &&*/
                        !isValidPhone(controllerPhone.text),
                    ValidationConst.enterValidPhone,
                  ),
                  sb(10),

                  if (widget.member == null) ...[

                    CustomDropDownField(
                      context: context,
                      textFieldName: "Select Sangh",
                      list: sanghsDD,
                      showSearch: false,
                      isSuffixImage: true,
                      isDisable: widget.member != null,
                      suffixImage: Imagename.downArrow,
                      selectedItem: sanghs.isNotEmpty
                          ? DropDownModel(id: sanghs, name: dropDownName("sanghs", sanghs))
                          : null,
                      onTap: () {},
                      onChangeInt: (v) {
                        sanghs = v;
                        setState(() {});
                        // registerBloc.add(DropDownIDsEvent(genderId: v));
                        // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                      },
                    ),
                    sb(10),

                  ],

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "${AppConstants.selectGender}*",
                    list: [
                      DropDownModel(name: "Male", id: "Male"),
                      DropDownModel(name: "Female", id: "Female")
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    isValidate: statee.addMemberValidation,
                    selectedItem: gender.isNotEmpty
                        ? DropDownModel(id: gender, name: gender)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      gender = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: maritalStatusDD,
                    textFieldName: "${AppConstants.selectMaritalStatus}*",
                    isSuffixImage: true,
                    isValidate: statee.addMemberValidation,
                    showSearch: false,
                    suffixImage: Imagename.downArrow,
                    selectedItem: maritalStatus.isNotEmpty
                        ? DropDownModel(id: maritalStatus, name: maritalStatus)
                        : null,
                    onChangeInt: (v) {
                      maritalStatus = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(10),

                  //Dob
                  CustomTextField(
                    context: context,
                    isDropDown: true,
                    textFieldName: "${AppConstants.dob}*",
                    isValidate: statee.addMemberValidation,
                    numberOfLines: 1,
                    controller: TextEditingController()
                      ..text = selectedDate == ""
                          ? ""
                          : selectedDate.toFormatDate(
                              defaultFormat: DateFormate.dateToFormatddMMMMYYYY,
                            ),
                    isSuffixImage: true,
                    suffixImage: Imagename.dateIcon,
                    textInputAction: TextInputAction.next,
                    enable: false,
                    onSumitted: () {},
                    onTap: () {
                      bottomPicker(context, child: DatePickerView(
                        (d) {
                          dateTemp = d;
                        },
                      ), onTap: () {
                        setState(() {
                          selectedDate = dateTemp.toString();
                        });
                      });
                    },
                    onChange: (v) {
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Blood Group" "*",
                    isValidate: statee.addMemberValidation,
                    list: bloodGroupDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: bloodGroup.isNotEmpty
                        ? DropDownModel(id: bloodGroup, name: bloodGroup)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      bloodGroup = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Educational Qualification" "*",
                    list: eduQualificaDD,
                    isValidate: statee.addMemberValidation,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: eduQualifica.isNotEmpty
                        ? DropDownModel(
                            id: eduQualifica,
                            name: dropDownName(
                                "educationalQualificationDropDown",
                                eduQualifica))
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      eduQualifica = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Religious Education",
                    hintText: "Enter Religious Education",
                    numberOfLines: 1,
                    controller: controllerReligious,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Profession",
                    list: profiessionDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: profiession.isNotEmpty
                        ? DropDownModel(id: profiession, name: profiession)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      profiession = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Designation",
                    hintText: "Enter Designation",
                    numberOfLines: 1,
                    controller: controllerDesignation,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Election Card Number",
                    hintText: "Enter Election Card Number",
                    numberOfLines: 1,
                    controller: controllerEletcion,
                    textInputAction: TextInputAction.next,
                    keboardType: TextInputType.phone,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Aadhar Card Number",
                    hintText: "Enter Aadhar Card Number",
                    numberOfLines: 1,
                    controller: controllerAdhar,
                    textInputAction: TextInputAction.next,
                    keboardType: TextInputType.phone,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Special Group 1",
                    hintText: "Enter Special Group 1",
                    numberOfLines: 1,
                    controller: controllerSpecial1,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Special Group 2",
                    hintText: "Enter Special Group 2",
                    numberOfLines: 1,
                    controller: controllerSpecial2,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Special Group 3",
                    hintText: "Enter Special Group 3",
                    numberOfLines: 1,
                    controller: controllerSpecial3,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Special Activity",
                    hintText: "Enter Special Activity",
                    numberOfLines: 1,
                    controller: controllerSpecialAct,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Location",
                    list: [
                      DropDownModel(name: "In India", id: "In India"),
                      DropDownModel(name: "Out of India", id: "Out of India")
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: location.isNotEmpty
                        ? DropDownModel(id: location, name: location)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      location = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  CustomDropDownField(
                    context: context,
                    textFieldName: "Country",
                    isDropDownHint: "Select Country",
                    list: countryDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: country.isNotEmpty
                        ? DropDownModel(
                            id: country,
                            name: dropDownName("countries", country))
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      country = v;
                      setState(() {});
                    },
                  ),
                  sb(10),

                  CustomDropDownField(
                    context: context,
                    textFieldName: "State",
                    isDropDownHint: "Select State",
                    list: stateDD,
                    isSuffixImage: true,
                    showSearch: false,
                    suffixImage: Imagename.downArrow,
                    selectedItem: state.isNotEmpty
                        ? DropDownModel(
                            id: state, name: dropDownName("states", state))
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      state = v;
                      setState(() {});
                    },
                  ),
                  sb(10),

                  CustomDropDownField(
                    context: context,
                    textFieldName: "City",
                    isDropDownHint: "Select City",
                    list: cityDD,
                    showSearch: false,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: city.isNotEmpty
                        ? DropDownModel(
                            id: city, name: dropDownName("cities", city))
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      city = v;
                      setState(() {});
                    },
                  ),
                  sb(10),

                  /*  //Privacy Agree
                  termWidget1(AppConstants.agreeTerm, termAccept!, (v) {
                    setState(() {
                      termAccept = !termAccept!;
                    });
                  }),
*/

                  spaceHeight(context),

                  sb(50)
                ],
              ),
            ),
          ),
          Button(
            title: "Create Member",
            fontColor: whiteColor,
            backgroundColor: clrOrange,
            isLoading: statee.memberCallState == ApiCallState.busy,
            ontap: () {
              unFocus(context);
              // pop(context);

              memberBloc.add(
                AddMemberEvent(
                  request: MemberRequest(
                    id: widget.member != null
                        ? widget.member!.id.toString()
                        : null,
                    address: state,
                    aadhar_card_no: controllerAdhar.text,
                    blood_group: bloodGroup,
                    city: city,
                    state_id: state,
                    country_id: country,
                    designation: controllerDesignation.text,
                    dob: selectedDate,
                    educational_qualification: eduQualifica,
                    election_card_no: controllerEletcion.text,
                    form_no: controllerFormNo.text,
                    full_name: controllerName.text,
                    gender: gender,
                    location: location,
                    marital_status: maritalStatus,
                    mobile_no: controllerPhone.text,
                    number_of_family_members: "",
                    profession: profiession,
                    relation_with_hod: relationHOF,
                    religious_education: controllerReligious.text,
                    social_group1: controllerSpecial1.text,
                    social_group2: controllerSpecial2.text,
                    social_group3: controllerSpecial3.text,
                    special_activity: controllerSpecialAct.text,
                    sanghs: sanghs,
                    // country_id:
                  ),
                ),
              );
            },
          ),
          sb(10)
        ],
      ),
    );
  }
}
