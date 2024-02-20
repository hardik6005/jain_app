import 'package:flutter/cupertino.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/utils/font_constants.dart';


class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextView(
          title,
          color: blackColor,
          fontFamily: FontName.nunitoSansBold,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        divider(),
      ],
    );
  }
}
