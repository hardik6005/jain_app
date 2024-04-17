import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jain_app/componenets/browse_dialog.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/title_child_widget.dart';
import 'package:jain_app/componenets/title_widget.dart';
import 'package:jain_app/screens/business/model/business_request_model.dart';
import 'package:jain_app/screens/member/bloc/member_bloc.dart';
import 'package:jain_app/screens/member/data/member_datasource.dart';
import 'package:jain_app/screens/member/data/member_repository.dart';
import 'package:jain_app/screens/member/model/business_list_model.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';

class AddBusinessScreen extends StatefulWidget {
  final MemberList? member;

  const AddBusinessScreen({Key? key, this.member}) : super(key: key);

  @override
  State<AddBusinessScreen> createState() => _AddBusinessScreenState();
}

class _AddBusinessScreenState extends State<AddBusinessScreen> {
  TextEditingController controllerBTitle = TextEditingController();
  TextEditingController controllerOwnerName = TextEditingController();
  TextEditingController controllerBobile = TextEditingController();
  TextEditingController controllerArea = TextEditingController();
  TextEditingController controllerAdd1 = TextEditingController();
  TextEditingController controllerAdd2 = TextEditingController();
  TextEditingController controllerPincode = TextEditingController();

  bool passHide = true;

  //Date picker variable
  DateTime dateTemp = DateTime.now();
  String selectedDate = "";

  ImagePicker picker = ImagePicker();
  List<PickerModel> pickerModelList = [];

  List<DropDownModel> stateDD = [];
  String statee = "";
  List<DropDownModel> cityDD = [];
  String city = "";
  List<DropDownModel> businessCategorieDD = [];
  String bCategory = "";

  MemberBloc memberBloc = MemberBloc(
    repository: MemberRepository(
      dataSource: MemberDataSource(),
    ),
  );

  @override
  void initState() {
    super.initState();

    stateDD = getDropDown("states");
    cityDD = getDropDown("cities");
    businessCategorieDD = getDropDown("businessCategories");

    if (widget.member != null) {
      final mem = widget.member;
      controllerBTitle.text = mem!.businessTitle ?? "";
      controllerOwnerName.text = mem.ownerName.toString();
      city = mem.city!.id.toString();
      statee = mem.state!.id.toString();
      controllerArea.text = mem.area.toString();
      controllerAdd1.text = mem.addressLine1.toString();
      controllerAdd2.text = mem.addressLine2.toString();
      controllerBobile.text = mem.mobileNumber.toString();
      bCategory = mem.businessCategory!.id.toString();
      pickerModelList
          .add(PickerModel("", mem.visitingCardUrl!, mem.visitingCardUrl!, ""));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberBloc, MemberState>(
      bloc: memberBloc,
      listener: (context, state) {
        if (state.addBusinessState == ApiCallState.success) {
          okAlert(
              GlobalVariable.navState.currentContext!,
              isDismiss: false,
              (widget.member == null)
                  ? "Business directory created successfully."
                  : "Business directory updated successfully.", onTap: () {
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
                  (widget.member == null)
                      ? "Create Business Directory":"Update Business Directory",
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
        }),
      ),
    );
  }

  Widget bodyView(MemberState state) {
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
                    textFieldName: "Business Title" + "*",
                    isValidate: state.addBusinessValidation,
                    hintText: "Enter Business Title",
                    numberOfLines: 1,
                    controller: controllerBTitle,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {
                      setState(() {});
                    },
                  ),

                  sb(10),

                  //Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Owner Name" + "*",
                    isValidate: state.addBusinessValidation,
                    hintText: "Enter Owner Name",
                    numberOfLines: 1,
                    controller: controllerOwnerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {
                      setState(() {});
                    },
                  ),

                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: AppConstants.phone + "*",
                    isValidate: state.addBusinessValidation,
                    hintText: AppConstants.enterPhone,
                    numberOfLines: 1,
                    maxLenght: 10,
                    controller: controllerBobile,
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
                      if (controllerBobile.text.isNotEmpty) {
                        // registerBloc
                        //     .add(RegValidationEvent(validPhone: true));
                      }
                    },
                    onChange: (v) {
                      controllerBobile.text = v;
                      controllerBobile.selection = TextSelection.fromPosition(
                          TextPosition(offset: controllerBobile.text.length));
                      setState(() {});
                    },
                  ),
                  validationText(
                    controllerBobile.text.isNotEmpty &&
                        /*state.validPhone! &&*/
                        !isValidPhone(controllerBobile.text),
                    ValidationConst.enterValidPhone,
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Business Category" + "*",
                    isValidate: state.addBusinessValidation,
                    isDropDownHint: "Select Business Category",
                    list: businessCategorieDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: bCategory.isNotEmpty
                        ? DropDownModel(
                            id: bCategory,
                            name: dropDownName("businessCategories", bCategory))
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      bCategory = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "State" + "*",
                    isDropDownHint: "Select State" ,
                    isValidate: state.addBusinessValidation,
                    list: stateDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: statee.isNotEmpty
                        ? DropDownModel(
                            id: statee, name: dropDownName("states", statee))
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      statee = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "City" + "*",
                    isDropDownHint: "Select City",
                    isValidate: state.addBusinessValidation,
                    list: cityDD,
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
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: "Area" + "*",
                    hintText: "Enter Area",
                    isValidate: state.addBusinessValidation,
                    numberOfLines: 1,
                    controller: controllerArea,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {
                      setState(() {});
                    },
                  ),

                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: "Address Line 1" + "*",
                    hintText: "Enter House No. Building Name",
                    isValidate: state.addBusinessValidation,
                    numberOfLines: 3,
                    controller: controllerAdd1,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {
                      setState(() {});
                    },
                  ),

                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: "Address Line 2" + "*",
                    hintText: "Enter Road Name, Colony",
                    isValidate: state.addBusinessValidation,
                    numberOfLines: 3,
                    controller: controllerAdd2,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {
                      setState(() {});
                    },
                  ),

                  sb(10),

                  CustomTextField(
                    context: context,
                    textFieldName: "Pincode",
                    hintText: "Enter Pincode",
                    numberOfLines: 1,
                    controller: controllerPincode,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(10),

                  //Upload CV
                  TitleChildWidget(
                    title: "Visiting Card" + "*",
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                            color: (state.addBusinessValidation!)
                                ? clrAppLight5
                                : (pickerModelList.isEmpty)
                                    ? redColor
                                    : clrAppLight5,
                            width: 1),
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
                                pickerModelList.isNotEmpty
                                    ? pickerModelList[0].name
                                    : "No file chosen",
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
                                showModalBottomSheet(
                                  elevation: 10,
                                  // backgroundColor: Colors.amber,
                                  context: context,
                                  builder: (ctx) => BrowseDialogue(
                                    boolVideo: false,
                                    value: (str) async {
                                      //value!(str);
                                      pop(context);
                                      await pickerModesWidget(
                                          picker, pickerModelList, str);
                                      setState(() {});
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  sb(10),

                  spaceHeight(context),

                  sb(50)
                ],
              ),
            ),
          ),
          Button(
            title: (widget.member == null)
                ?"Create Business Directory":"Update Business Directory",
            fontColor: whiteColor,
            backgroundColor: clrOrange,
            isLoading: state.addBusinessState == ApiCallState.busy,
            isDisable: state.addBusinessState == ApiCallState.busy,
            ontap: () {
              unFocus(context);

              memberBloc.add(AddBusinessEvent(
                  request: BusinessRequest(
                      id: widget.member != null
                          ? widget.member!.id.toString()
                          : null,
                      state_id: statee,
                      address_line_1: controllerAdd1.text,
                      address_line_2: controllerAdd2.text,
                      area: controllerArea.text,
                      business_category_id: bCategory,
                      business_title: controllerBTitle.text,
                      city_id: city,
                      mobile_number: controllerBobile.text,
                      owner_name: controllerOwnerName.text,
                      pincode: controllerPincode.text,
                      visiting_card: pickerModelList.isEmpty
                          ? ""
                          : pickerModelList[0].path)));
            },
          ),
          sb(10)
        ],
      ),
    );
  }
}
