// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  Function()? ontap;
  String image;
  double? height;
  double? width;
  Color? color;
  EdgeInsets? padding;
  Color? backColor;

  MyImage({
    Key? key,
    this.ontap,
    this.height,
    this.width,
    this.color,
    required this.image,
    this.padding,
    this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap!(),
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        color: backColor,
        child: Image.asset(
          image,
          height: height,
          width: width,
          color: color,
        ),
      ),
    );
  }
}
