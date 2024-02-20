import 'package:flutter/cupertino.dart';

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:sizer/sizer.dart';




void bottomPicker(
  BuildContext context, {
  required Function onTap,
  required Widget child,
}) {
  showCupertinoModalPopup(
      context: context,
      builder: (_) => BottomDialogue(
            onTap: onTap,
            child: child,
          ));
}

//Bottom picker view
class BottomDialogue extends StatelessWidget {
  final Function onTap;
  final Widget child;
  const BottomDialogue({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          Container(
            color: clrApp,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    pop(context);
                  },
                  child: TitleTextView(
                    AppConstants.cancel,
                    color: whiteColor,
                    fontSize: 17,
                    fontFamily: FontName.nunitoSansRegular,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pop(context);
                    onTap();
                  },
                  child: TitleTextView(
                    AppConstants.select,
                    color: whiteColor,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}

//DatePicker view
class DatePickerView extends StatelessWidget {
  final Function(DateTime) date;
  final CupertinoDatePickerMode? mode;
  final DateTime? defaultDate;
  final DateTime? minDateTime;
  final DateTime? maxDateTime;
  const DatePickerView(
    this.date, {
    super.key,
    this.mode,
    this.defaultDate,
    this.minDateTime,
    this.maxDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: DatePicker(
        initialDateTime: defaultDate ?? DateTime(2005),
        minuteInterval: 1,
        maxDateTime: maxDateTime ?? DateTime(2005),
        minDateTime: minDateTime ?? DateTime(1800),
        mode: mode ?? CupertinoDatePickerMode.date,
        onDateChanged: (DateTime d) {
          date(d);
        },
        use24hFormat: false,
        dateOrder: DatePickerDateOrder.mdy,
        textStyle: TextStyle(
          color: blackColor,
          fontFamily: FontName.nunitoSansSemiBold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions1, description2, text1, text2;
  final Image? img;
  final Function(bool)? onTap;

  const CustomDialogBox({
    Key? key,
    this.title,
    this.descriptions1,
    this.description2,
    this.text1,
    this.text2,
    this.img,
    this.onTap,
  }) : super(key: key);

  @override
  CustomDialogBoxState createState() => CustomDialogBoxState();
}

class CustomDialogBoxState extends State<CustomDialogBox>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: scaleAnimation!,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 35),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    sb(5.h),
                    TitleTextView(
                      widget.title,
                      fontSize: f17,
                      fontFamily: FontName.nunitoSansBold,
                    ),
                    divider(),
                    sb(1.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TitleTextView(
                          widget.descriptions1,
                          fontSize: f17,
                        ),
                        TitleTextView(
                          widget.description2,
                          fontSize: f17,
                          fontFamily: FontName.nunitoSansBold,
                        ),
                      ],
                    ),
                    sb(3.h),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Button(
                              title: widget.text2,
                              fontColor: whiteColor,
                              fontWeight: FontWeight.w700,
                              backgroundColor: clrApp,
                              ontap: () {
                                widget.onTap!(false);
                              },
                            ),
                          ),
                          sbw(20),
                          Expanded(
                            child: Button(
                              title: widget.text1,
                              fontColor: whiteColor,
                              fontWeight: FontWeight.w700,
                              backgroundColor: clrApp,
                              ontap: () {
                                widget.onTap!(true);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(Imagename.appIcon),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
