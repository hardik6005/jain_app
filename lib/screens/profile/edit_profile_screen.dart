import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jain_app/componenets/browse_dialog.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/loader_widget_main.dart';
import 'package:jain_app/main.dart';
import 'package:jain_app/screens/home/home_screen.dart';
import 'package:jain_app/screens/matrimonial/circle_image_view.dart';
import 'package:jain_app/screens/profile/bloc/profile_bloc.dart';
import 'package:jain_app/screens/profile/data/profile_datasource.dart';
import 'package:jain_app/screens/profile/data/profile_repository.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  String urlProfile = "";

  bool passHide = true;

  //Date picker variable
  DateTime dateFeedback = DateTime.now();
  DateTime dateTempFeedback = DateTime.now();
  String selectedDate = "";

  ImagePicker picker = ImagePicker();
  List<PickerModel> pickerModelList = [];

  bool isLoading = false;

  ProfileBloc profileBloc = ProfileBloc(
    repository: ProfileRepository(
      dataSource: ProfileDataSource(),
    ),
  );

  @override
  void initState() {
    super.initState();
    controllerName.text = userDataModel.data!.name ?? "";
    controllerEmail.text = userDataModel.data!.email ?? "";
    controllerPhone.text = userDataModel.data!.phoneNumber ?? "";
    controllerAddress.text = userDataModel.data!.address ?? "";
    urlProfile = userDataModel.data!.profile_pic_url ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listener: (context, state) {
        if(state.getProfileCallState==ApiCallState.success){
          callNextScreenAndClearStack(context, const HomeScreen());
        }

        if(state.saveProfileCallState==ApiCallState.success){
          // callNextScreenAndClearStack(context, const HomeScreen());
          profileBloc.add(GetProfileAPIEvent());
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
                  appBar: appBar(context, "Update Profile", Imagename.icBack,
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
                                  await pickerModesWidget(
                                      picker, pickerModelList, str);
                                  setState(() {});
                                },
                              ),
                            );
                          },
                          child: DisplayImage(
                            networkImage: urlProfile.isNotEmpty && urlProfile.toString().contains("http")
                                    ? urlProfile
                                    : "",
                            captureImage: pickerModelList.isNotEmpty
                                ? pickerModelList[0].path:"",
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
                      controller: controllerName,
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

                    //Other Information
                    CustomTextField(
                      context: context,
                      textFieldName: "Address",
                      hintText: "Enter Address",
                      numberOfLines: 1,
                      controller: controllerAddress,
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
              title: AppConstants.saveProfile,
              fontColor: whiteColor,
              backgroundColor: clrOrange,
              isLoading: state.saveProfileCallState==ApiCallState.busy || state.getProfileCallState==ApiCallState.busy,
              ontap: () {
                // registerBloc.add(RegisterAPI());
                unFocus(context);
                profileBloc.add(
                  ValidationEvent(
                    address: controllerAddress.text,
                    name: controllerName.text,
                    email: controllerEmail.text,
                    image: pickerModelList.isNotEmpty?pickerModelList[0].path:"",
                  ),
                );
              },
            ),
            sb(10)
          ],
        ),
      ),
    );
  }
}
