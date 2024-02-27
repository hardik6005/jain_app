import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/componenets/title_child_widget.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:jain_app/componenets/title_widget.dart';


class AddBusinessScreen extends StatefulWidget {
  const AddBusinessScreen({Key? key}) : super(key: key);

  @override
  State<AddBusinessScreen> createState() => _AddBusinessScreenState();
}

class _AddBusinessScreenState extends State<AddBusinessScreen> {
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

  List<PickerModel> cvModelList = [];


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
          appBar: appBar(context, "Create Business Directory",
              Imagename.icBack, "", whiteIntColor, leadingAction: () {
                pop(context);
              },action: [
                homeWidget(context)
              ],),
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

                  const TitleWidget("Business Details"),
                  sb(10),


                  //Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Business Title",
                    hintText: "Enter Business Title",
                    numberOfLines: 1,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(10),

   //Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Owner Name",
                    hintText: "Enter Owner Name",
                    numberOfLines: 1,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(10),

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
                    inputFormatters: <TextInputFormatter>[
                      mobileInputFormatter
                    ],
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
                    textFieldName: "Business Category",
                    isDropDownHint: "Select Business Category",
                    list: [DropDownModel(name: "Automobiles"), DropDownModel(name: "Hardware")],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "State",
                    isDropDownHint: "Select State",
                    list: [DropDownModel(name: "Gujarat"), DropDownModel(name: "Maharastra")],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "City",
                    isDropDownHint: "Select City",
                    list: [DropDownModel(name: "Gujarat"), DropDownModel(name: "Maharastra")],
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
                    textFieldName: "Area",
                    hintText: "Enter Owner Name",
                    numberOfLines: 1,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: "Address Line 1",
                    hintText: "Enter House No. Building Name",
                    numberOfLines: 3,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: "Address Line 2",
                    hintText: "Enter Road Name, Colony",
                    numberOfLines: 3,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: "Pincode",
                    hintText: "Enter Pincode",
                    numberOfLines: 1,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(10),

                  //Upload CV
                  TitleChildWidget(
                    title: "Visiting Card",
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: clrAppLight5, width: 1),
                        color: clrAppLight5,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 11,
                              ),
                              child: TitleTextView(
                                cvModelList.isNotEmpty ? cvModelList[0].name : "No file chosen",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: Button(
                              title: AppConstants.upload,
                              // height: 30,
                              backgroundColor: clrApp,
                              fontColor: whiteColor,
                              ontap: () async {
                                await pickeFileWidget(cvModelList, TAG.document);
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  sb(10),


                  sb(100)
                ],
              ),
            ),
          ),
          Button(
            title: "Create Business Directory",
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



}
