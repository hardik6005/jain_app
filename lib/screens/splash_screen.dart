import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/componenets/custom_dialogue.dart';
import 'package:jain_app/screens/auth/login_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/screens/home/home_screen.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';


class SplashScreen extends StatefulWidget {
  final bool? fromMain;

  const SplashScreen({Key? key, this.fromMain = false}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 

  @override
  void initState() {
    super.initState();
    
    delay(1800).then((value){
      callNextScreenAndClearStack(context, LoginScreen());
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.all(45),
      child: Image.asset(Imagename.appLogo),
    );
  }
  
}
