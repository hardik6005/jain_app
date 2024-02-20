import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/componenets/custom_dialogue.dart';
import 'package:jain_app/screens/register_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/screens/home_screen.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';



class LoginScreen extends StatefulWidget {
  final bool? fromMain;

  const LoginScreen({Key? key, this.fromMain = false}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerMemberId = TextEditingController();
  TextEditingController controllerBirth = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool passHide = true;
  int calledValue = 0;

  //Date picker variable
  DateTime dateTemp = DateTime.now();
  String selectedDate = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          // appBar: noAppBar(false, otherColor: whiteColor, loaderTimeColor: clrApp),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: bodyView(),
          backgroundColor: whiteColor,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  Widget bodyView() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [clrApp, clrApp, clrApp, clrApp, clrAppLight5, whiteColor],
          begin: Alignment.bottomCenter,
          // transform: GradientRotation(pi / 8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // sb(s.s200),

                Image.asset(Imagename.appLogo, width: 70.w,),

                sb(2.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 50.w),
                      alignment: Alignment.centerLeft,
                      // margin: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Container(),
                    ),
                    sb(10),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TitleTextView(
                        "Member Login",
                        color: clrApp,
                        fontFamily: FontName.nunitoSansExtraBold,
                        fontWeight: FontWeight.bold,
                        fontSize: f23,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TitleTextView(
                        AppConstants.contineSign,
                        color: clrApp,
                        fontFamily: FontName.nunitoSansSemiBold,
                        fontSize: f16,
                      ),
                    ),
                  ],
                ),

                sb(10),

                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: radius(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: clrAppLight3,
                            offset: Offset.zero,
                            blurRadius: 5),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      sb(5),
                      // sb(5.h),

                      // Image.asset(Imagename.appIcon),

                      CustomTextField(
                        context: context,
                        isDropDown: true,
                        textFieldName: AppConstants.birthYear,
                        hintText: AppConstants.selBirthYear,
                        numberOfLines: 1,
                        controller: TextEditingController()
                          ..text = selectedDate == ""
                              ? ""
                              : selectedDate.toFormatDate(
                            defaultFormat:
                            DateFormate.dateToFormatddMMMMYYYY,
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
                      sb(2.h),


                      //Email password textfields
                      CustomTextField(
                        context: context,
                        textFieldName: "Mobile No",
                        hintText: "Mobile No",
                        numberOfLines: 1,
                        controller: controllerMemberId,
                        isSuffixImage: true,
                        suffixImage: Imagename.icUser1,
                        textInputAction: TextInputAction.next,
                        maxLenght: 10,
                        keboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                            RegExp(
                              "[0-9]",
                            ),
                          ),
                        ],
                      ),
                      sb(2.h),
                      CustomTextField(
                        context: context,
                        textFieldName: AppConstants.password,
                        hintText: AppConstants.enterpassword,
                        numberOfLines: 1,
                        controller: controllerPassword,
                        textInputAction: TextInputAction.done,
                        suffixImage:
                        passHide ? Imagename.show : Imagename.hide,
                        isObsecure: passHide,
                        onSumitted: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                          // authBloc.add(LoginValidate(context));
                        },
                        isSuffixImage: true,
                        onSuffixTap: () {
                          passHide = !passHide;
                          setState(() {});
                        },
                        onChange: (v) {
                          // authBloc.add(PasswordEvent(controllerPassword.text.trim()));
                        },
                      ),
                      sb(2.h),
                      InkWell(
                        onTap: () {
                          // callNextScreen(context, const ForgotPassScreen());
                        },
                        child: TitleTextView(
                          AppConstants.forgotPassword,
                          color: clrApp,
                          textAlign: TextAlign.right,
                          fontSize: f13,
                          fontFamily: FontName.nunitoSansRegular,
                        ),
                      ),
                      sb(1.5.h),

                      //Signin Button
                      Button(
                        title: AppConstants.signIn,
                        fontColor: whiteColor,
                        backgroundColor: clrApp,
                        ontap: () {
                          unFocus(context);
                          callNextScreen(context, const HomeScreen());

                          // loginBloc.add(
                          //   ValidationEvent(
                          //     memberId: controllerMemberId.text.isEmpty
                          //         ? "555555555555"
                          //         : controllerMemberId.text,
                          //     password: controllerPassword.text,
                          //     context: context,
                          //   ),
                          // );
                        },
                      ),
                      sb(5),
                    ],
                  ),
                ),

                sb(4.h),
                Column(
                  children: [
                    TitleTextView(
                      AppConstants.donthaveAcc,
                      color: whiteColor,
                      textAlign: TextAlign.center,
                      fontSize: f13,
                      fontFamily: FontName.nunitoSansRegular,
                    ),
                    GestureDetector(
                      onTap: () async{
                        unFocus(context);
                        callNextScreen(context, const RegisterScreen());
                        // if (!await launchUrl(Uri.parse("https://jainmahasangh.tolobolo.com/public/jain-vasti-ganatri"))) {
                          // throw Exception('Could not launch $_url');
                        // }
                      },
                      child: TitleTextView(
                        AppConstants.register,
                        color: whiteColor,
                        textAlign: TextAlign.center,
                        fontSize: f20,
                        fontFamily: FontName.nunitoSansBold,
                      ),
                    )
                  ],
                ),


                sb(100),

                // sb(s.s180),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
