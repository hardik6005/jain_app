import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_dialogue.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/auth/bloc/login_bloc.dart';
import 'package:jain_app/screens/auth/data/login_datasource.dart';
import 'package:jain_app/screens/auth/data/login_repository.dart';
import 'package:jain_app/screens/member/model/register_request_model.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerMobile = TextEditingController();
  TextEditingController controllerSamaj = TextEditingController();
  TextEditingController controllerReligious = TextEditingController();
  TextEditingController controllerDesignation = TextEditingController();
  TextEditingController controllerAdharCard = TextEditingController();
  TextEditingController controllerSpecialActivity = TextEditingController();
  TextEditingController controllerCity = TextEditingController();

  String noOfMember = "";

  List<DropDownModel> sanghsDD = [];
  String sanghs = "";
  String gender = "";
  List<DropDownModel> maritalStatusDD = [];
  String maritalStatus = "";
  List<DropDownModel> bloodGroupDD = [];
  String bloodGroup = "";
  List<DropDownModel> eduQualificaDD = [];
  String eduQualifica = "";
  List<DropDownModel> stateDD = [];
  String statee = "";

  List<DropDownModel> profiessionDD = [];
  String profiession = "";


  //Date picker variable
  DateTime dateTemp = DateTime.now();
  String selectedDate = "";

  String location = "";

  bool isAgree = false;

  LoginBloc loginBloc = LoginBloc(
    repository: LoginRepository(
      dataSource: LoginDataSource(),
    ),
  );

  @override
  void initState() {
    super.initState();

    sanghsDD = getDropDown("sanghs");
    maritalStatusDD = getDropDown("maritalStatusDropDown");
    bloodGroupDD = getDropDown("memberbloodGroupDropDown");
    eduQualificaDD = getDropDown("educationalQualificationDropDown");
    stateDD = getDropDown("states");
    profiessionDD = getDropDown("professions");

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        if (state.registerCallState == ApiCallState.success) {
          okAlert(context, "Registration successful! Thank you for registering. Our executive will reach you within 48 hours.", onTap: (){
            pop(context);
            // pop(context);
          });
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          bloc: loginBloc,
          builder: ((context, state) {
            return Container(
              color: whiteColor,
              child: SafeArea(
                top: false,
                child: Scaffold(
                  appBar: appBar(context, AppConstants.register,
                      Imagename.icBack, "", whiteIntColor, leadingAction: () {
                    pop(context);
                  }),
                  body: commonShapeContainer(bodyView(state)),
                  backgroundColor: clrApp,
                  resizeToAvoidBottomInset: false,
                ),
              ),
            );
          })),
    );
  }

  Widget bodyView(LoginState state) {
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
                  sb(3.h),
                  //Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Full Name*",
                    hintText: AppConstants.enterName,
                    numberOfLines: 1,
                    isValidate: state.isRegValidate,
                    controller: controllerFullName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomDropDownField(
                    context: context,
                    textFieldName: "Number Of Family Members*",
                    isValidate: state.isRegValidate,
                    list: [
                      DropDownModel(
                        name: "1",
                        id: "1",
                      ),
                      DropDownModel(
                        name: "2",
                        id: "2",
                      ),
                      DropDownModel(
                        name: "3",
                        id: "3",
                      ),
                      DropDownModel(
                        name: "4",
                        id: "4",
                      ),
                      DropDownModel(
                        name: "5",
                        id: "5",
                      ),
                      DropDownModel(
                        name: "6",
                        id: "6",
                      ),
                      DropDownModel(
                        name: "7",
                        id: "7",
                      ),
                      DropDownModel(
                        name: "8",
                        id: "8",
                      ),
                      DropDownModel(
                        name: "9",
                        id: "9",
                      ),
                      DropDownModel(
                        name: "10",
                        id: "10",
                      ),
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem:   DropDownModel(
                      name: noOfMember,
                      id: noOfMember,
                    ),
                    onTap: () {},
                    onChangeInt: (v) {
                      noOfMember = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(1.5.h),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Address*",
                    hintText: "Enter address",
                    isValidate: state.isRegValidate,
                    numberOfLines: 3,
                    controller: controllerAddress,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomDropDownField(
                    context: context,
                    textFieldName: "Select Sangh*",
                    isValidate: state.isRegValidate,
                    list: sanghsDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: sanghs.isNotEmpty
                        ? DropDownModel(
                            id: sanghs, name: dropDownName("sanghs", sanghs))
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      sanghs = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(1.5.h),

                  //Contact No.
                  CustomTextField(
                    context: context,
                    textFieldName: "Mobile Number*",
                    isValidate: state.isRegValidate,
                    hintText: 'Enter mobile number',
                    numberOfLines: 1,
                    maxLenght: 10,
                    controller: controllerMobile,
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
                      // if (controllerPhone.text.isNotEmpty) {
                      //   registerBloc
                      //       .add(RegValidationEvent(validPhone: true));
                      // }
                    },
                    onChange: (v) {
                      controllerMobile.text = v;
                      controllerMobile.selection = TextSelection.fromPosition(
                          TextPosition(offset: controllerMobile.text.length));
                      setState(() {});
                    },
                  ),
                  sb(1.5.h),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: AppConstants.selectGender+"*",
                    isValidate: state.isRegValidate,
                    list: [
                      DropDownModel(name: "Male", id: "Male"),
                      DropDownModel(name: "Female", id: "Female")
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
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
                  sb(1.5.h),

                  //Dob
                  CustomTextField(
                    context: context,
                    isDropDown: true,
                    textFieldName: AppConstants.dob+"*",
                    isValidate: state.isRegValidate,
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
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: maritalStatusDD,
                    textFieldName: AppConstants.selectMaritalStatus+"*",
                    isSuffixImage: true,
                    isValidate: state.isRegValidate,
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
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: bloodGroupDD,
                    textFieldName: "Blood Group*",
                    isValidate: state.isRegValidate,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: bloodGroup.isNotEmpty
                        ? DropDownModel(id: bloodGroup, name: bloodGroup)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      bloodGroup = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(1.5.h),

                  //Email
                  CustomTextField(
                    context: context,
                    textFieldName: "Samaj/Caste*",
                    hintText: "Enter samaj/caste",
                    isValidate: state.isRegValidate,
                    numberOfLines: 1,
                    controller: controllerSamaj,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {
                      // // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                      // controllerEmail.text = v;
                      // controllerEmail.selection = TextSelection.fromPosition(
                      //     TextPosition(offset: controllerEmail.text.length));
                      // setState(() {});
                    },
                  ),
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: eduQualificaDD,
                    textFieldName: "Educational Qualification*",
                    isValidate: state.isRegValidate,
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
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "Religious Education*",
                    hintText: "Enter religious education",
                    isValidate: state.isRegValidate,
                    numberOfLines: 1,
                    controller: controllerReligious,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

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
                  CustomTextField(
                    context: context,
                    textFieldName: "Designation*",
                    hintText: "Enter designation",
                    isValidate: state.isRegValidate,
                    numberOfLines: 1,
                    controller: controllerDesignation,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "Aadhar Card Number",
                    hintText: "Enter aadhar card number",
                    // isValidate: state.isRegValidate,
                    numberOfLines: 1,
                    controller: controllerAdharCard,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "Special Activity*",
                    hintText: "Enter special activity",
                    numberOfLines: 1,
                    isValidate: state.isRegValidate,
                    controller: controllerSpecialActivity,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Location*",
                    isValidate: state.isRegValidate,
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
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    textFieldName: "State*",
                    isDropDownHint: "Select State",
                    isValidate: state.isRegValidate,
                    // isValidate: state.addBusinessValidation,
                    list: stateDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: statee.isNotEmpty
                        ? DropDownModel(
                            id: statee,
                            name: dropDownName("states", statee),
                          )
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      statee = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "City Name*",
                    hintText: "Enter city name",
                    isValidate: state.isRegValidate,
                    numberOfLines: 1,
                    controller: controllerCity,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  //Privacy Agree
                  termWidget1(
                      "I agreed on terms & conditions and declared that I've shared correct information. Click Here to catch helpful instructions and guidelines for form filling of jain vasti ganatri",
                      isAgree,
                        (v) {
                    setState(() {
                      isAgree = !isAgree;
                    });
                  },
                    (state.isRegValidate!)
                        ? Colors.black
                        : (isAgree == false)
                        ? redColor
                        : Colors.black,
                  ),
                  sb(1.h),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextView(
                        "Note: ",
                        fontSize: f14,
                        fontFamily: FontName.nunitoSansBold,
                      ),
                      Expanded(
                        child: TitleTextView(
                          "You will update your family members details after approval of your profile.",
                          fontSize: f14,
                        ),
                      ),
                    ],
                  ),

                  spaceHeight(context),

                  sb(100)
                ],
              ),
            ),
          ),
          Button(
            title: AppConstants.signUp,
            fontColor: whiteColor,
            backgroundColor: clrApp,
            isLoading: state.registerCallState==ApiCallState.busy,
            ontap: () {
              unFocus(context);

              loginBloc.add(
                RegisterAPIEvent(
                  RegisterReqModel(
                    location: location,
                    gender: gender,
                    educational_qualification: eduQualifica,
                    mobile_number: controllerMobile.text,
                    state_id: statee,
                    special_activity: controllerSpecialActivity.text,
                    profession: profiession,
                    number_of_family_members: noOfMember,
                    marital_status: maritalStatus,
                    designation: controllerDesignation.text,
                    // country_id: coun
                    city: controllerCity.text,
                    blood_group: bloodGroup,
                    aadhar_card_no: controllerAdharCard.text,
                    address: controllerAddress.text,
                    date_of_birth: selectedDate,
                    head_off_family_full_name: controllerFullName.text,
                    religious_qualification: controllerReligious.text,
                    samaj_caste: controllerSamaj.text,
                    sangh_id: sanghs,
                    agree: isAgree?"1":"",
                    // country_id: "",
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
