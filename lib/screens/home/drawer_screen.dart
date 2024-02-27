import 'package:flutter/material.dart';
import 'package:jain_app/screens/business/business_list_screen.dart';
import 'package:jain_app/screens/job/job_list_screen.dart';
import 'package:jain_app/screens/matrimonial/matri_list_screen.dart';
import 'package:jain_app/screens/member/add_member_screen.dart';
import 'package:jain_app/screens/member/member_list_screen.dart';
import 'package:jain_app/screens/profile/edit_profile_screen.dart';
import 'package:jain_app/screens/profile/update_password_screen.dart';
import 'package:jain_app/utils/string_constants.dart';


import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        color: whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sb(10),
            Row(
              children: [
                sbw(15),
                commonClipOval("", 35,
                    placeHolder: Imagename.icProfileImage, padding: 0),
                sbw(15),
                TitleTextView(
                  "Elitech Head",
                  fontFamily: FontName.nunitoSansBold,
                  fontSize: f22,
                  color: blackColor,
                ),
              ],
            ),
            divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        callNextScreen(context, const MemberListScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        color: whiteColor,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(Imagename.icUser1, height: 20,),
                            sbw(10),
                            TitleTextView(
                              "Member List",
                              fontFamily: FontName.nunitoSansBold,
                              fontSize: f18,
                              color: blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    sb(10),
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        callNextScreen(context, JobListScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        color: whiteColor,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(Imagename.icJob, height: 20,),
                            sbw(10),
                            TitleTextView(
                              "Job Portal",
                              fontFamily: FontName.nunitoSansBold,
                              fontSize: f18,
                              color: blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    sb(10),
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        callNextScreen(context, BusinessListScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        color: whiteColor,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(Imagename.icMember, height: 20,),
                            sbw(10),
                            TitleTextView(
                              "Business Directory",
                              fontFamily: FontName.nunitoSansBold,
                              fontSize: f18,
                              color: blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    sb(10),
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        callNextScreen(context, MatriListScreen());

                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        color: whiteColor,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(Imagename.icMatri, height: 20,),
                            sbw(10),
                            TitleTextView(
                              "Matrimonial",
                              fontFamily: FontName.nunitoSansBold,
                              fontSize: f18,
                              color: blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    sb(10),
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        callNextScreen(context, EditProfileScreen());

                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        color: whiteColor,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(Imagename.icHome, height: 20,),
                            sbw(10),
                            TitleTextView(
                              "Update Profile",
                              fontFamily: FontName.nunitoSansBold,
                              fontSize: f18,
                              color: blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    sb(10),
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        callNextScreen(context, UpdatePasswordScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        color: whiteColor,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(Imagename.icPassword, height: 20,),
                            sbw(10),
                            TitleTextView(
                              "Update Password",
                              fontFamily: FontName.nunitoSansBold,
                              fontSize: f18,
                              color: blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    sb(10),
                    divider(color: clrAppLight4),
                    sb(16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    divider(color: clrAppLight4),
                    Row(
                      children: [
                        const Icon(Icons.share),
                        sbw(10),
                        TitleTextView(
                          "Share",
                          fontFamily: FontName.nunitoSansBold,
                          fontSize: f18,
                          color: blackColor,
                        ),
                      ],
                    ),
                    divider(color: clrAppLight4),
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        // logout();
                        // callNextScreenAndClearStack(
                        //     context, const LoginScreen());
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.logout_sharp),
                          sbw(10),
                          TitleTextView(
                            "Sign out",
                            fontFamily: FontName.nunitoSansBold,
                            fontSize: f18,
                            color: blackColor,
                          ),
                        ],
                      ),
                    ),
                    divider(color: clrAppLight4),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
