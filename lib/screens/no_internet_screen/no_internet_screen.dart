

import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/main.dart';
import 'package:jain_app/screens/no_internet_screen/something_went_wrong.dart';

import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class NoInternetScreen extends StatefulWidget {
  final String? title;
  const NoInternetScreen({Key? key, this.title}) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrApp,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: TitleTextView(
          widget.title??AppConstants.nointernet,
          fontSize: 17,
          fontFamily: FontName.nunitoSansBold,
          color: whiteColor,
        ),
        automaticallyImplyLeading: false,
      ),
      body: widget.title != null?someThingWentWrong(context):myBody(),
    );
  }

  Widget myBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(Imagename.icSetting),
          sb(40),
          TitleTextView(
            AppConstants.nointernet,
            fontSize: 20,
            fontFamily: FontName.nunitoSansSemiBold,
            color: clrApp,
          ),
          sb(15),
          TitleTextView(
            "",
            fontSize: 15,
            textAlign: TextAlign.center,
          ),
          sb(40),
          Button(
            title: AppConstants.tryAgain,
            backgroundColor: Theme.of(context).primaryColor,
            fontColor: whiteColor,
            isShadow: false,
            ontap: () async{
              if((await checkConnection()) != ConnectivityResult.none){
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

}
