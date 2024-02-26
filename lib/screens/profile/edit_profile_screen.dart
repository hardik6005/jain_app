import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/componenets/browse_dialog.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_dialogue.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/loader_widget_main.dart';
import 'package:jain_app/componenets/title_widget.dart';
import 'package:jain_app/screens/matrimonial/circle_image_view.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController controllerOtherInfo = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  //Permanant Address
  TextEditingController controllerAddressP = TextEditingController();

  //Present Address
  TextEditingController controllerAddressPR = TextEditingController();

  TextEditingController controllerPincodeN = TextEditingController();
  TextEditingController controllerPincodePR = TextEditingController();
  TextEditingController controllerPincodeP = TextEditingController();

  bool passHide = true;

  //Date picker variable
  DateTime dateFeedback = DateTime.now();
  DateTime dateTempFeedback = DateTime.now();
  String selectedDate = "";

  ImagePicker picker = ImagePicker();
  List<PickerModel> pickerModelList = [];

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
          appBar: appBar(context, AppConstants.editProfile, Imagename.icBack,
              "", whiteIntColor, leadingAction: () {
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
    return LoaderWidgetMain(
      isLoading: /* state.editProfileCallState == ApiCallState.busy ||*/
          isLoading,
      child: Container(
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              elevation: 10,
                              // backgroundColor: Colors.amber,
                              context: context,
                              builder: (ctx) => BrowseDialogue(
                                boolVideo: false,
                                value: (str) async {
                                  //value!(str);
                                  pop(context);
                                  await pickerModesWidget(picker, pickerModelList, str);
                                  setState(() {});
                                },
                              ),
                            );
                          },
                          child: DisplayImage(
                            imagePath: pickerModelList.isNotEmpty
                                ? pickerModelList[0].path
                                : StaticList.url,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),

                    sb(1.5.h),


                    //Contact No.
                    CustomTextField(
                      context: context,
                      textFieldName: AppConstants.phone,
                      hintText: AppConstants.enterPhone,
                      numberOfLines: 1,
                      maxLenght: 10,
                      controller: controllerPhone,
                      enable: false,
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
                    sb(1.5.h),

                    //Other Information
                    CustomTextField(
                      context: context,
                      textFieldName: "Name",
                      hintText: "Enter Name",
                      numberOfLines: 1,
                      controller: controllerOtherInfo,
                      textInputAction: TextInputAction.next,
                      onChange: (v) {},
                    ),
                    sb(1.5.h),

                    //Email
                    CustomTextField(
                      context: context,
                      textFieldName: AppConstants.email,
                      hintText: AppConstants.enterEmail,
                      numberOfLines: 1,
                      controller: controllerEmail,
                      enable: false,
                      textInputAction: TextInputAction.next,
                      onSumitted: () {
                        if (controllerEmail.text.isNotEmpty) {
                          // registerBloc
                          //     .add(RegValidationEvent(validEmail: true));
                        }
                      },
                      onChange: (v) {
                        // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                        controllerEmail.text = v;
                        controllerEmail.selection = TextSelection.fromPosition(
                            TextPosition(offset: controllerEmail.text.length));
                        setState(() {});
                      },
                    ),
                    validationText(
                      controllerEmail.text.isNotEmpty &&
                          /*state.validEmail! &&*/
                          !isValidEmail(controllerEmail.text),
                      ValidationConst.enterValidEmail,
                    ),
                    sb(1.5.h),


                    spaceHeight(context),

                    sb(100)
                  ],
                ),
              ),
            ),
            Button(
              title: AppConstants.saveProfile,
              fontColor: whiteColor,
              backgroundColor: clrOrange,
              ontap: () {
                // registerBloc.add(RegisterAPI());
                unFocus(context);
                // registerBloc.add(
                //   EditProfileEvent(
                //     requestModel: EditProfileRequestModel(
                //       mobileNo: controllerPhone.text,
                //       emailId: controllerEmail.text,
                //       maritalStatusId: state.maritalIdModel!.id.toString(),
                //       dob: selectedDate != ""
                //           ? selectedDate.toFormatDate(
                //               defaultFormat: DateFormate.dateToFormatyyyyMMdd)
                //           : "",
                //       presentAddress: controllerAddressPR.text,
                //       presentDistict: state.distictIdPR,
                //       presentState: state.stateIdPR,
                //       presentSubDistict: state.subDistictIdPR,
                //       presentVillage: state.villageIdPR,
                //       permanentAddress: controllerAddressP.text,
                //       permanentDistict: state.distictIdP,
                //       permanentState: state.stateIdPR,
                //       permanentSubDistict: state.subDistictIdP,
                //       permanentVillage: state.villageIdP,
                //       memberId: userDataModel!.data!.memberId!,
                //       otherInformation: controllerOtherInfo.text,
                //       permanentPincode: controllerPincodeP.text,
                //       presentPincode: controllerPincodePR.text,
                //     ),
                //   ),
                // );
              },
            ),
            sb(10)
          ],
        ),
      ),
    );
  }
}
