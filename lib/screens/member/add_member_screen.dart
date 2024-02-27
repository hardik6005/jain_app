import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/title_widget.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  TextEditingController controllerFormNo = TextEditingController();
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

  @override
  void initState() {
    super.initState();

    controllerFormNo.text = "1990";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                    textFieldName: "Relation With HOF",
                    list: [
                      DropDownModel(name: "Sample 1"),
                      DropDownModel(name: "Sample 2")
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Name
                  CustomTextField(
                    context: context,
                    textFieldName: AppConstants.name,
                    hintText: AppConstants.enterName,
                    numberOfLines: 1,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: AppConstants.fatherName,
                    hintText: AppConstants.enterName,
                    numberOfLines: 1,
                    controller: controllerFatherName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Contact No.
                  CustomTextField(
                    context: context,
                    textFieldName: AppConstants.phone,
                    hintText: AppConstants.enterPhone,
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

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: AppConstants.selectGender,
                    list: [
                      DropDownModel(name: "Male"),
                      DropDownModel(name: "Female")
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Marital Status
                  CustomDropDownField(
                    context: context,
                    list: [
                      DropDownModel(name: "Single"),
                      DropDownModel(name: "Married")
                    ],
                    textFieldName: AppConstants.selectMaritalStatus,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(10),

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
                      // bottomPicker(context, child: DatePickerView(
                      //       (d) {
                      //     dateTemp = d;
                      //   },
                      // ), onTap: () {
                      //   setState(() {
                      //     selectedDate = dateTemp.toString();
                      //   });
                      // });
                    },
                    onChange: (v) {
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),

                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Aadhar Card Number",
                    hintText: "Enter Aadhar Card Number",
                    numberOfLines: 1,
                    controller: controllerFatherName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Father Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Special Group 1",
                    hintText: "Enter Special Group 1",
                    numberOfLines: 1,
                    controller: controllerFatherName,
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
                    controller: controllerFatherName,
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
                    controller: controllerFatherName,
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
                    controller: controllerFatherName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Location",
                    list: [
                      DropDownModel(name: "In India"),
                      DropDownModel(name: "Out of India")
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  CustomDropDownField(
                    context: context,
                    textFieldName: "State",
                    isDropDownHint: "Select State",
                    list: [
                      DropDownModel(name: "Gujarat"),
                      DropDownModel(name: "Maharastra")
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: "City Name",
                    hintText: "Enter city name",
                    numberOfLines: 1,
                    controller: controllerFatherName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
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
            ontap: () {
              unFocus(context);
              pop(context);
            },
          ),
          sb(10)
        ],
      ),
    );
  }

  //
  //Present address widget
  Widget presentAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sb(20),
        const TitleWidget(AppConstants.presAddress),
        Row(
          children: [
            Checkbox(
              visualDensity:
                  const VisualDensity(horizontal: -4.0, vertical: -4.0),
              checkColor: whiteColor,
              fillColor: MaterialStateProperty.all<Color>(whiteColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              value: false,
              onChanged: (v) {
                // registerBloc.add(
                //   AddressSelectEvent(
                //     sameAsNative1: !state.sameAsNative1!,
                //   ),
                // );

                // sameAsNativePRMethod(state);
              },
            ),
            TitleTextView(
              AppConstants.sameNative,
              fontSize: 12,
            )
          ],
        ),
        Row(
          children: [
            Checkbox(
              visualDensity:
                  const VisualDensity(horizontal: -4.0, vertical: -4.0),
              checkColor: whiteColor,
              fillColor: MaterialStateProperty.all<Color>(whiteColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              value: false,
              onChanged: (v) {
                // registerBloc.add(AddressSelectEvent(
                //   sameAsPermanant: !state.sameAsPermanant!,
                // ));
                //
                // sameAsPermanentPRMethod(state);
              },
            ),
            TitleTextView(
              AppConstants.samePermanant,
              fontSize: 12,
            )
          ],
        ),
        sb(10),
        Column(
          children: [
            CustomTextField(
              context: context,
              textFieldName: AppConstants.addressN,
              hintText: AppConstants.enterAddressN,
              numberOfLines: 3,
              height: 10,
              controller: controllerAddressPR,
              textInputAction: TextInputAction.next,
              onSumitted: () {},
              onChange: (v) {
                // authBloc.add(EmailEvent(controllerEmail.text.trim()));
              },
            ),
            sb(10),
            CustomTextField(
              context: context,
              textFieldName: AppConstants.searchPincode,
              hintText: AppConstants.search,
              numberOfLines: 1,
              fillColor: clrAppLight4,
              controller: controllerPincodePR,
              suffixImage: Imagename.icSearch,
              keboardType: TextInputType.phone,
              style: TextStyle(
                color: blackColor,
                fontSize: f155,
                fontFamily: FontName.nunitoSansBold,
              ),
              maxLenght: 11,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              onSuffixTap: () async {
                if (controllerPincodePR.text.isNotEmpty) {
                  unFocus(context);
                  // await presentAddressCall();
                }
              },
              onSumitted: () async {
                if (controllerPincodePR.text.isNotEmpty) {
                  unFocus(context);
                  // await presentAddressCall();
                }
              },
              isSuffixImage: true,
              textInputAction: TextInputAction.done,
              onChange: (v) {
                if (isPresentShow) {
                  isPresentShow = false;
                  // clearPresentAdd(state);
                  setState(() {});
                }

                if (v.length == 6) {
                  delay(300).then((value) async {
                    if (controllerAddressPR.text.isNotEmpty) {
                      unFocus(context);
                      // await presentAddressCall();
                    }
                  });
                }
              },
            ),
            if (isPresentShow) ...[
              sb(10),
              SingleDropDownField(
                context: context,
                fieldKey: statePRKey,
                textFieldName: AppConstants.stateN,
                isSuffixImage: true,
                suffixImage: Imagename.downArrow,
                // selectedItem: state.stateIdPR,
                isSubType: true,
                onChange: (v) {
                  // registerBloc.add(DropDownIDsEvent(stateIdPR: v));
                },
              ),
              sb(10),
              SingleDropDownField(
                context: context,
                fieldKey: distictPRKey,
                textFieldName: AppConstants.districtN,
                isSuffixImage: true,
                suffixImage: Imagename.downArrow,
                // selectedItem: state.distictIdPR,
                isSubType: true,
                onChange: (v) {
                  // registerBloc.add(DropDownIDsEvent(distictIdPR: v));
                },
              ),
              sb(10),
              SingleDropDownField(
                context: context,
                fieldKey: subDistictPRKey,
                textFieldName: AppConstants.subDistrictN,
                isSuffixImage: true,
                suffixImage: Imagename.downArrow,
                isSubType: true,
                // selectedItem: state.subDistictIdPR,
                onChange: (v) {
                  // registerBloc.add(DropDownIDsEvent(subDistictIdPR: v));
                },
              ),
              sb(10),
              SingleDropDownField(
                context: context,
                fieldKey: villagePRKey,
                textFieldName: AppConstants.villageN,
                isSuffixImage: true,
                suffixImage: Imagename.downArrow,
                isSubType: true,
                // selectedItem: state.villageIdPR,
                onChange: (v) {
                  // registerBloc.add(DropDownIDsEvent(villageIdPR: v));
                },
              ),
            ]
          ],
        )
      ],
    );
  }

  //Permanant address widget
  Widget permanantAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sb(10),
        const TitleWidget(AppConstants.permAddress),
        Row(
          children: [
            Checkbox(
              visualDensity:
                  const VisualDensity(horizontal: -4.0, vertical: -4.0),
              checkColor: whiteColor,
              fillColor: MaterialStateProperty.all<Color>(whiteColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              value: false,
              onChanged: (v) {
                // registerBloc.add(
                //   AddressSelectEvent(
                //     sameAsNative: !state.sameAsNative!,
                //   ),
                // );

                // sameAsNativeMethod(state);
              },
            ),
            TitleTextView(
              AppConstants.sameNative,
              fontSize: 12,
            )
          ],
        ),
        sb(10),
        CustomTextField(
          context: context,
          textFieldName: AppConstants.addressN,
          hintText: AppConstants.enterAddressN,
          numberOfLines: 3,
          height: 10,
          controller: controllerAddressP,
          textInputAction: TextInputAction.next,
          onSumitted: () {},
          onChange: (v) {
            // authBloc.add(EmailEvent(controllerEmail.text.trim()));
          },
        ),
        sb(10),
        CustomTextField(
          context: context,
          textFieldName: AppConstants.searchPincode,
          hintText: AppConstants.search,
          numberOfLines: 1,
          fillColor: clrAppLight4,
          controller: controllerPincodeP,
          suffixImage: Imagename.icSearch,
          keboardType: TextInputType.phone,
          style: TextStyle(
            color: blackColor,
            fontSize: f155,
            fontFamily: FontName.nunitoSansBold,
          ),
          maxLenght: 11,
          inputFormatters: [
            UpperCaseTextFormatter(),
          ],
          onSuffixTap: () async {
            if (controllerPincodeP.text.isNotEmpty) {
              unFocus(context);
              // await permenentAddressCall();
            }
          },
          onSumitted: () async {
            if (controllerPincodeP.text.isNotEmpty) {
              unFocus(context);
              // await permenentAddressCall();
            }
          },
          isSuffixImage: true,
          textInputAction: TextInputAction.done,
          onChange: (v) {
            if (isPermenentShow) {
              isPermenentShow = false;
              // clearPermenentAdd(state);
              setState(() {});
            }

            if (v.length == 6) {
              delay(300).then((value) async {
                if (controllerPincodeP.text.isNotEmpty) {
                  unFocus(context);
                  // await permenentAddressCall();
                }
              });
            }
          },
        ),
        if (isPermenentShow) ...[
          sb(10),
          SingleDropDownField(
            context: context,
            fieldKey: statePKey,
            textFieldName: AppConstants.stateN,
            isSuffixImage: true,
            suffixImage: Imagename.downArrow,
            // selectedItem: state.stateIdP,
            isSubType: true,
            onChange: (v) {
              // registerBloc.add(DropDownIDsEvent(stateIdP: v));
            },
          ),
          sb(10),
          SingleDropDownField(
            context: context,
            fieldKey: distictPKey,
            textFieldName: AppConstants.districtN,
            isSuffixImage: true,
            suffixImage: Imagename.downArrow,
            // selectedItem: state.distictIdP,
            isSubType: true,
            onChange: (v) {
              // registerBloc.add(DropDownIDsEvent(distictIdP: v));
            },
          ),
          sb(10),
          SingleDropDownField(
            context: context,
            fieldKey: subDistictPKey,
            textFieldName: AppConstants.subDistrictN,
            isSuffixImage: true,
            suffixImage: Imagename.downArrow,
            isSubType: true,
            // selectedItem: state.subDistictIdP,
            onChange: (v) {
              // registerBloc.add(DropDownIDsEvent(subDistictIdP: v));
            },
          ),
          sb(10),
          SingleDropDownField(
            context: context,
            fieldKey: villagePKey,
            textFieldName: AppConstants.villageN,
            isSuffixImage: true,
            suffixImage: Imagename.downArrow,
            isSubType: true,
            // selectedItem: state.villageIdP,
            onChange: (v) {
              // registerBloc.add(DropDownIDsEvent(villageIdP: v));
            },
          ),
        ]
      ],
    );
  }

  //Native address widget
  Widget nativeAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sb(10),
        const TitleWidget(AppConstants.nativeAddress),
        sb(10),
        CustomTextField(
          context: context,
          textFieldName: AppConstants.addressN,
          hintText: AppConstants.enterAddressN,
          numberOfLines: 3,
          height: 10,
          controller: controllerAddressN,
          textInputAction: TextInputAction.next,
          onSumitted: () {},
          onChange: (v) async {
            // authBloc.add(EmailEvent(controllerEmail.text.trim()));
          },
        ),
        sb(10),
        CustomTextField(
          context: context,
          textFieldName: AppConstants.searchPincode,
          hintText: AppConstants.search,
          numberOfLines: 1,
          fillColor: clrAppLight4,
          controller: controllerPincodeN,
          suffixImage: Imagename.icSearch,
          keboardType: TextInputType.phone,
          style: TextStyle(
            color: blackColor,
            fontSize: f155,
            fontFamily: FontName.nunitoSansBold,
          ),
          maxLenght: 6,
          inputFormatters: [
            UpperCaseTextFormatter(),
          ],
          onSuffixTap: () async {
            if (controllerPincodeN.text.isNotEmpty) {
              unFocus(context);
              // await nativeAddressCall();
            }
          },
          onSumitted: () async {
            if (controllerPincodeN.text.isNotEmpty) {
              unFocus(context);
              // await nativeAddressCall();
            }
          },
          isSuffixImage: true,
          textInputAction: TextInputAction.done,
          onChange: (v) async {
            if (isNativeShow) {
              isNativeShow = false;
              // clearNativeAdd();
              setState(() {});
            }

            if (v.length == 6) {
              delay(300).then((value) async {
                if (controllerPincodeN.text.isNotEmpty) {
                  unFocus(context);
                  // await nativeAddressCall();
                }
              });
            }
          },
        ),
        if (isNativeShow) ...[
          sb(10),
          SingleDropDownField(
            context: context,
            fieldKey: stateNKey,
            textFieldName: AppConstants.stateN,
            isSuffixImage: true,
            suffixImage: Imagename.downArrow,
            // selectedItem: state.stateIdN,
            isSubType: true,
            onChange: (v) {
              // registerBloc.add(DropDownIDsEvent(stateIdN: v));
              // clearDistrictN(state);
            },
          ),
          sb(10),
          SingleDropDownField(
            context: context,
            fieldKey: distictNKey,
            textFieldName: AppConstants.districtN,
            isSuffixImage: true,
            suffixImage: Imagename.downArrow,
            // selectedItem: state.distictIdN,
            isSubType: true,
            onChange: (v) {
              // registerBloc.add(DropDownIDsEvent(distictIdN: v));
              // clearDistrictN(state);
            },
          ),
          sb(10),
          SingleDropDownField(
            context: context,
            fieldKey: subDistictNKey,
            textFieldName: AppConstants.subDistrictN,
            isSuffixImage: true,
            suffixImage: Imagename.downArrow,
            isSubType: true,
            // selectedItem: state.subDistictIdN,
            onChange: (v) {
              // registerBloc.add(DropDownIDsEvent(subDistictIdN: v));
              // clearVillageN(state);
            },
          ),
          sb(10),
          SingleDropDownField(
            context: context,
            fieldKey: villageNKey,
            textFieldName: AppConstants.villageN,
            isSuffixImage: true,
            suffixImage: Imagename.downArrow,
            isSubType: true,
            // isDisable: state.subDistictIdN == null,
            // selectedItem: state.villageIdN,
            onValidation: () {
              okAlert(
                context,
                ValidationConst.pleaseSelectSubDistrict,
              );
            },
            onChange: (v) {
              // registerBloc.add(DropDownIDsEvent(villageIdN: v));
            },
          ),
        ]
      ],
    );
  }
}
