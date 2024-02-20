// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/font_constants.dart';


class TitleTextView extends StatelessWidget {
  final String? text;
  TextAlign textAlign = TextAlign.left;
  Color? color = blackColor;
  FontWeight? fontWeight = FontWeight.normal;
  double? fontSize = 1;
  bool softWrap = true;
  int? maxLines;
  bool isStrikeText = false;
  TextOverflow? overflow;
  double? lineHeight;
  bool? isUnderline;
  String? fontFamily;
  TextDirection? textDirection;

  TitleTextView(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.left,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.softWrap = true,
    this.maxLines,
    this.isStrikeText = false,
    this.overflow,
    this.lineHeight,
    this.isUnderline,
    this.fontFamily,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '-',
      textAlign: textAlign,
      overflow: (overflow == null) ? TextOverflow.clip : overflow,
      softWrap: softWrap,
      maxLines: maxLines,
      textScaleFactor: 1.0,
      textDirection: textDirection,
      style: TextStyle(
          fontFamily: (fontFamily == null) ? FontName.nunitoSansRegular : fontFamily,
          height: lineHeight ?? 1.2,
          color: (color == null) ? Colors.black : color,
          fontSize: (fontSize == null) ? 14 : fontSize,
          fontWeight: fontWeight,
          decoration: (isUnderline != null && isUnderline!)
              ? TextDecoration.underline
              : (isStrikeText)
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
    );
  }
}
