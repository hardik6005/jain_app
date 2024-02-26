import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jain_app/componenets/cache_network_image.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/title_widget.dart';

import 'package:jain_app/main.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';

import 'package:jain_app/screens/profile/edit_profile_screen.dart';
import 'package:jain_app/screens/profile/update_password_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {


  String gender = "";
  String maritalStatus = "";
  String gotra = "";
  UserDataModel? userModel;

  @override
  void initState() {
    super.initState();
    // init();
  }

  // void init() {
  //   userModel = userDataModel!;
  //   dropDownData!.data!.gender!.asMap().forEach((key, value) {
  //     if (userDataModel!.data!.genderId ==
  //         dropDownData!.data!.gender![key].id) {
  //       gender = dropDownData!.data!.gender![key].genderType!;
  //     }
  //   });
  //
  //   dropDownData!.data!.maritalStatus!.asMap().forEach((key, value) {
  //     if (userDataModel!.data!.maritalStatusId ==
  //         dropDownData!.data!.maritalStatus![key].id) {
  //       maritalStatus =
  //           dropDownData!.data!.maritalStatus![key].maritalStatusType!;
  //     }
  //   });
  //   dropDownData!.data!.gotra!.asMap().forEach((key, value) {
  //     if (userDataModel!.data!.basicInformation!.gotraId ==
  //         dropDownData!.data!.gotra![key].id) {
  //       gotra = dropDownData!.data!.gotra![key].gotraName!;
  //     }
  //   });
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: bodyView1(),
        backgroundColor: clrApp,
      ),
    );
  }

  Widget bodyView1() {
    final model = userModel?.data!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: whiteColor,
      ),
      child: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: whiteColor,
                ),
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sb(1.h),
                    TitleTextView(
                      "Harry Gray",
                      fontSize: f24,
                      fontFamily: FontName.nunitoSansBold,
                      textAlign: TextAlign.center,
                    ),
                    sb(1.5.h),
                    divider(),
                    sb(0.5.h),
                    const TitleWidget(AppConstants.basicInfo),
                    sb(0.5.h),
                    commonItem(AppConstants.phone, "+91 1234567890"),
                    commonItem(AppConstants.email, "test@gmail.com"),

                    sb(2.5.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Button(
                            title: "Update Profile",
                            fontColor: whiteColor,
                            backgroundColor: clrOrange,
                            ontap: () {
                              // registerBloc.add(RegisterAPI());
                              callNextScreen(context, EditProfileScreen());

                            },
                          ),
                        ),
                        sbw(20),
                        Expanded(
                          child: Button(
                            title: "Update Password",
                            fontColor: whiteColor,
                            backgroundColor: clrOrange,
                            ontap: () {
                              // registerBloc.add(RegisterAPI());
                              unFocus(context);
                              callNextScreen(context, UpdatePasswordScreen());

                            },
                          ),
                        ),
                      ],
                    ),

                    sb(10.h)
                  ],
                ),
              ),
              sb(10),
            ],
          ),
        ),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: false,
              elevation: 0,
              toolbarHeight: 50,
              foregroundColor: clrOrange5,
              collapsedHeight: null,
              leading: Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    pop(context);
                  },
                  child: Image.asset(
                    Imagename.icBack,
                    color: clrApp,
                  ),
                ),
              ),
              actions: [

              ],
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * .4,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: CacheNetworkImage(
                  "",
                  imageHeight: MediaQuery.of(context).size.width,
                  placeHolderImage: Imagename.icProfileImage,
                ),
              ),
              titleSpacing: 0,
              primary: false,
              backgroundColor: clrOrange5,
            ),
          ];
        },
      ),
    );
  }

  Widget commonItem(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.9.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: TitleTextView(
              title.replaceAll(":", ""),
              fontFamily: FontName.nunitoSansSemiBold,
              fontSize: f15,
            ),
          ),
          sbw(7),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextView(
                  ":  ",
                  fontFamily: FontName.nunitoSansBold,
                  fontSize: f16,
                ),
                Flexible(
                  child: TitleTextView(
                    value,
                    fontFamily: FontName.nunitoSansBold,
                    fontSize: f16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
