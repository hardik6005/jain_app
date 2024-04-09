import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/profile/bloc/profile_bloc.dart';
import 'package:jain_app/screens/profile/data/profile_datasource.dart';
import 'package:jain_app/screens/profile/data/profile_repository.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:sizer/sizer.dart';

class UpdatePasswordScreen extends StatefulWidget {
  final bool? fromDrawer;

  const UpdatePasswordScreen({Key? key, this.fromDrawer}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  ProfileBloc profileBloc = ProfileBloc(
    repository: ProfileRepository(
      dataSource: ProfileDataSource(),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listener: (context, state) {
        if (state.updatePassCallState == ApiCallState.success) {
          okAlert(context, "Password changed successfully!", onTap: () {
            if (widget.fromDrawer ?? false) {
              pop(context);
            } else {
              pop(context);
              pop(context);
            }
          });
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: profileBloc,
          builder: ((context, state) {
            return Container(
              color: whiteColor,
              child: SafeArea(
                top: false,
                child: Scaffold(
                  appBar: appBar(context, "Update Password", Imagename.icBack,
                      "", whiteIntColor, leadingAction: () {
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

  Widget bodyView(ProfileState state) {
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

                  //Other Information
                  CustomTextField(
                    context: context,
                    textFieldName: "Old Password",
                    hintText: "Enter Old Password",
                    numberOfLines: 1,
                    controller: oldPassController,
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
                    controller: newPassController,
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
                    controller: confirmNewPassController,
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
            isLoading: state.updatePassCallState == ApiCallState.busy,
            backgroundColor: clrOrange,
            ontap: () {
              // registerBloc.add(RegisterAPI());
              unFocus(context);

              if (oldPassController.text.isEmpty) {
                okAlert(context, "Please enter old password");
              } else if (newPassController.text.isEmpty) {
                okAlert(context, "Please enter new password");
              } else if (confirmNewPassController.text.isEmpty) {
                okAlert(context, "Please enter confirm new password");
              } else if (newPassController.text !=
                  confirmNewPassController.text) {
                okAlert(context, "Old password & New password must be same");
              } else {
                profileBloc.add(
                  UpdatePassEvent(
                    name: oldPassController.text,
                    email: newPassController.text,
                  ),
                );
              }

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
    );
  }
}
