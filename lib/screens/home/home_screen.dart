import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jain_app/screens/business/business_list_screen.dart';
import 'package:jain_app/screens/home/widget/home_slider_widget.dart';
import 'package:jain_app/screens/job/search_job_screen.dart';
import 'package:jain_app/screens/matrimonial/matri_list_screen.dart';
import 'package:jain_app/screens/member/add_member_screen.dart';
import 'package:jain_app/screens/member/member_list_screen.dart';
import 'package:jain_app/screens/home/model/slider_model.dart';
import 'package:jain_app/screens/profile/view_profile_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/componenets/cache_network_image.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/screens/home/drawer_screen.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';


import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late CarouselSlider carouselSlider;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    _synthesizeText();
  }

  Future<void> _synthesizeText() async {
    final String endpoint =
        'https://texttospeech.googleapis.com/v1/text:synthesize';
    final String text = 'Hello, world!'; // Te// xt to synthesize

    final requestBody = {
      "audioConfig": {
        "audioEncoding": "LINEAR16",
        "effectsProfileId": [
          "small-bluetooth-speaker-class-device"
        ],
        "pitch": 0,
        "speakingRate": 1
      },
      "input": {
        "text": "Failed with status code: 400"
      },
      "voice": {
        "languageCode": "en-US",
        "name": "en-US-Standard-A"
      }
    };

    final response = await http.post(
      Uri.parse('$endpoint?key=${"AIzaSyB-guHweEQyBN7F5CvQeABugg21lvAbysw"}'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      // Request was successful
      print('Audio content: ${response.body}');
    } else {
      // Request failed
      print('Failed with status code: ${response.statusCode}');
      print('Error message: ${response.body}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          key: scaffoldKey,
          drawer: const Drawer(
            // shape: ShapeBorder,
            child: DrawerScreen(),
          ),
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
          ),
          body: bodyView(),
          backgroundColor: clrApp,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  Widget bodyView() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        color: clrApp,
        child: Column(
          children: [
            //AppBar
            appBarWidget(),

            //Body Data
            mainBodydata()
          ],
        ),
      ),
    );
  }

  //AppBar Widget
  Widget appBarWidget() {
    return Container(
      color: clrApp,
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          sbw(5),
          GestureDetector(
            onTap: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(13).copyWith(right: 5, left: 5),
              child: Image.asset(
                Imagename.icMenu,
                color: whiteColor,
                height: 30,
                width: 30,
              ),
            ),
          ),
          sbw(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextView(
                  "Jain App",
                  fontFamily: FontName.nunitoSansBold,
                  fontSize: 22,
                  color: whiteColor,
                ),
                sb(5),
                TitleTextView(
                  "Welcome, Elitech Head",
                  fontFamily: FontName.nunitoSansBold,
                  fontSize: 14,
                  color: whiteColor,
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // callNextScreen(context, const NotificationScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    Imagename.icNotification,
                    height: f21,
                  ),
                ),
              ),
              sbw(7),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          callNextScreen(context, const ViewProfileScreen());
                        },
                        child: commonClipOval(
                          "",
                          20,
                          backColor: clrAppLight3,
                          placeHolder: Imagename.icProfileImage,
                          padding: 0,
                        ),
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }

  //Main Body Home screen
  Widget mainBodydata() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: whiteColor,
        ),
        child: Column(
          children: [
            sb(10),
            // if (state.dashboardModel != null)

            sb(10),
            // if (state.sliderModel != null &&
            //     state.sliderModel!.data!.isNotEmpty)
              CarouselWithIndicator(data: [
                SliderData(link: Imagename.slider1),
                SliderData(link: Imagename.slider2),
                SliderData(link: Imagename.slider3),
                SliderData(link: Imagename.slider4),
                SliderData(link: Imagename.slider5),
                SliderData(link: Imagename.slider6),
              ]),
            sb(4.h),
            Row(
              children: [
                Expanded(
                  child: commonItemView(
                    Imagename.icMemberDir,
                    isDisable: false,
                    AppConstants.memberDirectory,
                        () {
                      callNextScreen(context, const MemberListScreen());
                    },
                  ),
                ),
                sbw(20),
                Expanded(
                  child: commonItemView(
                    Imagename.icJobs,
                    AppConstants.jobs,
                        () {
                      callNextScreen(context, const JobSearchScreen());
                    },
                  ),
                ),
                sbw(20),
                Expanded(
                  child: commonItemView(
                    Imagename.icMatroMonial,
                    isDisable: false,
                    AppConstants.matromonial,
                        () {
                      callNextScreen(context, const MatriListScreen());
                    },
                  ),
                ),

              ],
            ),
            sb(30),
            Row(
              children: [
                Expanded(
                  child: commonItemView(
                    Imagename.icBusiness,
                    AppConstants.business,
                        () {
                      callNextScreen(context, const BusinessListScreen());
                    },
                  ),
                ),
                sbw(20),
                Expanded(
                  child: Container(),
                ),
                sbw(20),
                Expanded(
                  child: Container(),
                ),
              ],
            ),

            sb(20),
          ],
        ),
      ),
    );
  }

  Widget commonItemView(String image, String title, Function() onTap,
      {bool? isDisable = false}) {
    return GestureDetector(
      onTap: isDisable! ? null : onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isDisable)
            Image.asset(
              Imagename.icBlockUser,
              height: 50,
              width: 50,
            )
          else ...[
            if (image.contains("assets"))
              Image.asset(
                image,
                height: 50,
                width: 50,
                color: isDisable ? greyColor : null,
              )
            else
              CacheNetworkImage(
                image,
                placeHolderImage: Imagename.appIcon,
                imageHeight: 13,
              ),
          ],
          sb(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TitleTextView(
              title,
              fontFamily: FontName.nunitoSansBold,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              fontSize: f15,
            ),
          )
        ],
      ),
    );
  }
}
