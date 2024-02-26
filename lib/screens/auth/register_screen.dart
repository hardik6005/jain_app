import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_dialogue.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/title_widget.dart';
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
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerFatherName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPincodeN = TextEditingController();
  TextEditingController controllerPincodePR = TextEditingController();
  TextEditingController controllerPincodeP = TextEditingController();

  //Native Address
  TextEditingController controllerAddressN = TextEditingController();

  //Permanant Address
  TextEditingController controllerAddressP = TextEditingController();

  //Present Address
  TextEditingController controllerAddressPR = TextEditingController();

  bool passHide = true;

  //Date picker variable
  DateTime dateTemp = DateTime.now();
  String selectedDate = "";

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: appBar(context, AppConstants.register, Imagename.icBack, "",
              whiteIntColor, leadingAction: () {
            pop(context);
          }),
          body: commonShapeContainer(bodyView()),
          backgroundColor: clrApp,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  Widget bodyView() {
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
                    textFieldName: "Full Name",
                    hintText: AppConstants.enterName,
                    numberOfLines: 1,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomDropDownField(
                    context: context,
                    textFieldName: "Number Of Family Members",
                    list: [
                      DropDownModel(
                        name: "1",
                      ),
                      DropDownModel(
                        name: "2",
                      ),
                      DropDownModel(
                        name: "3",
                      ),
                      DropDownModel(
                        name: "4",
                      )
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(1.5.h),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Address",
                    hintText: "Enter address",
                    numberOfLines: 3,
                    controller: controllerFatherName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomDropDownField(
                    context: context,
                    textFieldName: "Select Sangh",
                    list: [
                      DropDownModel(
                        name: "Navrangpura Jain Sangh",
                      ),
                      DropDownModel(
                        name: "Shilekh Jain Sangh",
                      )
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(1.5.h),

                  //Contact No.
                  CustomTextField(
                    context: context,
                    textFieldName: "Mobile Number",
                    hintText: 'Enter mobile number',
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
                      // if (controllerPhone.text.isNotEmpty) {
                      //   registerBloc
                      //       .add(RegValidationEvent(validPhone: true));
                      // }
                    },
                    onChange: (v) {
                      controllerPhone.text = v;
                      controllerPhone.selection = TextSelection.fromPosition(
                          TextPosition(offset: controllerPhone.text.length));
                      setState(() {});
                    },
                  ),
                  sb(1.5.h),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: AppConstants.selectGender,
                    list: [
                      DropDownModel(name: "Male"),
                      DropDownModel(name: "Female"),
                      DropDownModel(name: "Other")
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(1.5.h),

                  //Dob
                  CustomTextField(
                    context: context,
                    isDropDown: true,
                    textFieldName: AppConstants.dob,
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
                    list: [
                      DropDownModel(name: "Single"),
                      DropDownModel(name: "Married"),
                      DropDownModel(name: "Divorced")
                    ],
                    textFieldName: AppConstants.selectMaritalStatus,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: [
                      DropDownModel(name: "A+ve"),
                      DropDownModel(name: "A-ve")
                    ],
                    textFieldName: "Blood Group",
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(1.5.h),

                  //Email
                  CustomTextField(
                    context: context,
                    textFieldName: "Samaj/Caste",
                    hintText: "Enter samaj/caste",
                    numberOfLines: 1,
                    controller: controllerEmail,
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
                    list: [
                      DropDownModel(name: "BE"),
                      DropDownModel(name: "M.Com")
                    ],
                    textFieldName: "Educational Qualification",
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: [
                      DropDownModel(name: "BE"),
                      DropDownModel(name: "M.Com")
                    ],
                    textFieldName: "Educational Qualification",
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "Religious Education",
                    hintText: "Enter religious education",
                    numberOfLines: 1,
                    controller: controllerEmail,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "Profession",
                    hintText: "Enter profession",
                    numberOfLines: 1,
                    controller: controllerEmail,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "Designation",
                    hintText: "Enter designation",
                    numberOfLines: 1,
                    controller: controllerEmail,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "Aadhar Card Number",
                    hintText: "Enter aadhar card number",
                    numberOfLines: 1,
                    controller: controllerEmail,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "Special Activity",
                    hintText: "Enter special activity",
                    numberOfLines: 1,
                    controller: controllerEmail,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: [
                      DropDownModel(name: "In India"),
                      DropDownModel(name: "Out of India")
                    ],
                    textFieldName: "Location",
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(1.5.h),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: [
                      DropDownModel(name: "Gujarat"),
                      DropDownModel(name: "Assam")
                    ],
                    textFieldName: "Select State",
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(1.5.h),

                  CustomTextField(
                    context: context,
                    textFieldName: "City Name",
                    hintText: "Enter city name",
                    numberOfLines: 1,
                    controller: controllerEmail,
                    textInputAction: TextInputAction.next,
                    onSumitted: () {},
                    onChange: (v) {},
                  ),
                  sb(1.5.h),


                  //Privacy Agree
                  termWidget1("I agreed on terms & conditions and declared that I've shared correct information. Click Here to catch helpful instructions and guidelines for form filling of jain vasti ganatri", termAccept!, (v) {
                    setState(() {
                      termAccept = !termAccept!;
                    });
                  }),
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
            ontap: () {
              unFocus(context);
            },
          ),
          sb(10)
        ],
      ),
    );
  }
}
