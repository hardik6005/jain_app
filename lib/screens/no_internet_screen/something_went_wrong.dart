
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';

Widget someThingWentWrong(BuildContext context, ) {
  return Container(
    padding: EdgeInsets.all(45),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Imagename.icUser),
        sb(40),
        TitleTextView(
          AppConstants.somethingwentwrong,
          fontSize: 20,
          fontFamily: FontName.nunitoSansSemiBold,
        ),
        sb(15),
        TitleTextView(
          AppConstants.somethingwentwrong,
          fontSize: 15,
          textAlign: TextAlign.center,
        ),
        sb(40),
        Button(
            title: AppConstants.tryAgain,
            backgroundColor: Theme.of(context).primaryColor,
            fontColor: whiteColor,
            isShadow: false,
            ontap: () {
              Navigator.pop(context);
            })
      ],
    ),
  );
}
