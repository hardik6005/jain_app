import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/utils/app_utils.dart';


class TitleChildWidget extends StatelessWidget {
  const TitleChildWidget({
    Key? key,
    this.title,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextView(
          title,
          fontSize: f13,
        ),
        sb(5),
        child ?? Container(),
      ],
    );
  }
}
