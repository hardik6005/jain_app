import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';
import 'package:jain_app/screens/splash_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_preference.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/screens/home/home_screen.dart';
import 'package:jain_app/screens/auth/login_screen.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


String baseUrl = "";
UserDataModel userDataModel = UserDataModel();
Map<String, dynamic> dropDownJson = {};


void main() async{
  await dotenv.load(fileName: ".env");
  baseUrl = dotenv.env['BASE_URL']!;
  String userData = await AppPreference.instance.getPref(Pref.userData);"";
  if(userData.isNotEmpty) {
    userDataModel = UserDataModel.fromJson(json.decode(userData));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'JainMahaSangh',
        navigatorKey: GlobalVariable.navState,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: clrApp),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
