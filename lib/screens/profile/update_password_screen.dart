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


class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
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
          appBar: appBar(context, "Update Password", Imagename.icBack,
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


                    //Other Information
                    CustomTextField(
                      context: context,
                      textFieldName: "Old Password",
                      hintText: "Enter Old Password",
                      numberOfLines: 1,
                      controller: controllerOtherInfo,
                      textInputAction: TextInputAction.next,
                      onChange: (v) {},
                    ),
                    sb(1.5.h),

                    //Other Information
                    CustomTextField(
                      context: context,
                      textFieldName: "New Password",
                      hintText: "Enter New Password",
                      numberOfLines: 1,
                      controller: controllerOtherInfo,
                      textInputAction: TextInputAction.next,
                      onChange: (v) {},
                    ),
                    sb(1.5.h),

                    //Other Information
                    CustomTextField(
                      context: context,
                      textFieldName: "Confirm New Password",
                      hintText: "Enter Confirm New Password",
                      numberOfLines: 1,
                      controller: controllerOtherInfo,
                      textInputAction: TextInputAction.next,
                      onChange: (v) {},
                    ),
                    sb(1.5.h),

                    spaceHeight(context),

                    sb(100)
                  ],
                ),
              ),
            ),
            Button(
              title: "Update Password",
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
