
import 'package:flutter/cupertino.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:lottie/lottie.dart';


class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/loader.json'),
    );
  }
}
