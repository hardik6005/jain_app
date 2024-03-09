// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';

class Button extends StatelessWidget {
  Function()? ontap;
  String? title;
  FontWeight? fontWeight = FontWeight.w600;
  double? fontSize = 20;
  Color? fontColor;
  Color? backgroundColor;
  TextAlign? textAlign = TextAlign.center;
  bool? isBorderEnable = false;
  bool? isShadow = true;
  bool? isDisable = false;
  double? height;
  bool? isLoading;

  Button({
    Key? key,
    this.ontap,
    this.title,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.backgroundColor,
    this.textAlign,
    this.isBorderEnable,
    this.isShadow,
    this.isDisable = false,
    this.height,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.all(s.s8),
        decoration: BoxDecoration(
          borderRadius: radius(4),
          color: isDisable!
              ? greyColorLight1
              : backgroundColor ?? Theme.of(context).primaryColor,
          border: isBorderEnable != null
              ? (isBorderEnable!
                  ? Border.all(
                      color: fontColor == null ? blackColor : fontColor!,
                      width: 1)
                  : null)
              : null,
        ),
        height: height ?? 44,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(
          alignment: Alignment.center,
          child: (isLoading!)
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                      color: whiteColor, strokeWidth: 3),
                )
              : Text(
                  title!,
                  textScaleFactor: 1.0,
                  textAlign: textAlign ?? TextAlign.center,
                  style: TextStyle(
                      fontFamily: FontName.nunitoSansRegular,
                      decoration: TextDecoration.none,
                      fontWeight: fontWeight ?? FontWeight.normal,
                      fontSize: fontSize ?? f17,
                      color: fontColor == null ? blackColor : fontColor!),
                ),
        ),
      ),
    );
  }
}
