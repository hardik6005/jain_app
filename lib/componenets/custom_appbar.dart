import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/utils/font_constants.dart';


AppBar appBar(
  BuildContext context,
  String? title,
  String? leandingImage,
  String? color,
  int? tColor, {
  Function()? leadingAction,
  Function(int)? actionTapped,
  List<Widget>? action,
  List<double>? actionSize,
  bool? isActionText,
  bool? isLightColorStatus,
  double? elevation,
  bool? isBGImage,
  Widget? flexibleSpaceBG,
  bool? isCenterTitle,
  double? leandingWidth,
  double? leandingSize,
  double? titleSize,
  SystemUiOverlayStyle? systemUiOverlayStyle,
  Color? backgroundColor,
}) {
  return AppBar(
    // ignore: deprecated_member_use
    // brightness: isLightColorStatus != null
    //     ? (isLightColorStatus ? Brightness.dark : Brightness.light)
    //     : Brightness.dark,
    systemOverlayStyle: systemUiOverlayStyle,
    elevation: elevation ?? 0,
    backgroundColor: backgroundColor ?? clrApp,
    titleSpacing: 10,
    leadingWidth: leandingWidth ?? 50,
    leading: leandingImage == ""
        ? Container()
        : IconButton(
            onPressed: () {
              // ignore: unnecessary_statements
              if (kDebugMode) {
                print('button pressed');
              }
              leadingAction!();
            },
            icon: Image.asset(
              leandingImage!,
              color: whiteColor,
              height: leandingSize ?? 17,
              fit: BoxFit.cover,
            ),
          ),
    title: TitleTextView(
      title!,
      fontSize: titleSize ?? f201,
      fontFamily: FontName.nunitoSansBold,
      color: Color(tColor!),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    ),
    centerTitle: isCenterTitle == false ? false : true,
    bottom: PreferredSize(
      preferredSize: const Size(50, 1.5),
      child: horizontalLine(lineHeight: 0),
    ),
    actions: action ?? [],
    flexibleSpace: isBGImage == true ? flexibleSpaceBG : Container(),
  );
}
