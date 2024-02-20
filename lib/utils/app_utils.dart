//If not display AppBar in Screen Use this for StatusBar Color
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/home_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';

//Standard Font Size
double f24 = 24;
double f23 = 23;
double f22 = 22;
double f21 = 21;
double f20 = 20;
double f201 = 20.5;
double f18 = 18;
double f17 = 17;
double f177 = 17.5;
double f16 = 16;
double f15 = 15;
double f155 = 15.5;
double f14 = 14;
double f13 = 13;
double f12 = 12;
double f11 = 11;
double f10 = 10;

Size appBarHeight = const Size.fromHeight(60);

TextInputFormatter mobileInputFormatter = FilteringTextInputFormatter.allow(
  RegExp(r'^\d+(?:\.\d+)?$'),
);

printLog(String text) {
  // ignore: avoid_print
  if (kDebugMode) {
    print(text);
  }
}

// Push to next screen
void callNextScreen(BuildContext context, StatefulWidget nextScreen) {
//  Navigator.push(context, SlideRightRoute(page: nextScreen));

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextScreen),
  );
  // Navigator.of(context).push(
  //   PageRouteBuilder(
  //       pageBuilder: (context, animation1, animation2) => nextScreen,
  //       transitionDuration: const Duration(milliseconds: 300),
  //       transitionsBuilder: (BuildContext context, Animation<double> animation,
  //           Animation<double> secondaryAnimation, Widget child) {
  //         return SlideTransition(
  //           position: Tween<Offset>(
  //             begin: const Offset(1.0, 0.0),
  //             end: Offset.zero,
  //           ).animate(animation),
  //           child: child,
  //         );
  //       }), //3 is count of your pages you want to pop
  // );
}

Future callNextScreenWithResult(
    BuildContext context, StatefulWidget nextScreen) async {
  var action = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextScreen),
  );
  return action;
}

void callNextScreenFromBottom(BuildContext context, StatefulWidget nextScreen) {
//  Navigator.push(context ,SlideBottomAnimation(page: nextScreen));
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
}

void callNextScreenFinishOld(BuildContext context, StatefulWidget nextScreen) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => nextScreen), (route) => false);
}

void callNextScreenAndClearStack(BuildContext context, Widget nextScreen) {
  Navigator.of(context).pushAndRemoveUntil(
    PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => nextScreen,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        }),
    (_) => false, //3 is count of your pages you want to pop
  );
}

BorderRadius radius(double radius) {
  return BorderRadius.circular(radius);
}

//Add sizebox with height
Widget sb(double size) {
  return SizedBox(height: size);
}

//Add sizebox with width
Widget sbw(double size) {
  return SizedBox(width: size);
}

//Go back screen
void pop(BuildContext context, {String? data}) {
  Navigator.of(context).pop(data);
}

AppBar noAppBar(bool isLoading, {Color? loaderTimeColor, Color? otherColor}) {
  return AppBar(
    toolbarHeight: 0,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: isLoading
          ? loaderTimeColor ?? Colors.transparent
          : otherColor ?? whiteColor,
    ),
  );
}

//Placeholder image
Widget placeHolder(String placeHolderImage) {
  return Container(
    padding: const EdgeInsets.all(13),
    decoration: const BoxDecoration(shape: BoxShape.circle),
    child: Image.asset(
      placeHolderImage,
    ),
  );
}

Widget horizontalLine({double? lineHeight, Color? color}) {
  return Container(
    alignment: Alignment.center,
    color: color ?? clrAppLight2,
    constraints: BoxConstraints.expand(height: lineHeight ?? 1.5),
  );
}

isWeb() {
  if (Platform.isAndroid || Platform.isIOS) {
    return false;
  } else {
    return true;
  }
}

//Email validations//
isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

//Mobile validations//
isValidPhone(String email) {
  return RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(email);
}

enum ApiCallState { none, busy, success, failure }

class GlobalVariable {
  /// This global key is used in material app for navigation through firebase notifications.
  /// [navState] usage can be found in [notification_notifier.dart] file.
  // static final GlobalKey<ScaffoldMessengerState> navState =
  //     GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}

Widget divider({double? thickness, Color? color}) {
  return Divider(
    thickness: thickness ?? 1,
    color: color ?? clrAppLight2,
  );
}

Widget validationText(bool display, String text) {
  return (display)
      ? TitleTextView(
          text,
          fontSize: 12,
          color: clrApp,
        )
      : Container();
}

unFocus(context) {
  return FocusScope.of(context).unfocus();
}

BoxDecoration myinputborder() {
  //return type is OutlineInputBorder
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(4)),
    border: Border.all(color: clrAppLight4, width: 1),
    color: clrAppLight5,
  );
}

class TAG {
  static String camera = "camera";
  static String gallery = "gallery";
  static String document = "document";
  static String video = "video";
}

class PickerModel {
  String pickerTag, path, name, fileType;

  PickerModel(this.pickerTag, this.path, this.name, this.fileType);
}

TextInputType textInputType() =>
    const TextInputType.numberWithOptions(decimal: true);

enum FilterClass {
  memberDirectory,
  matriMonial,
  jobs,
  events,
  business,
}

Widget commonShapeContainer(Widget child) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      color: whiteColor,
    ),
    child: child,
  );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

spaceHeight(BuildContext context) {
  if (MediaQuery.of(context).viewInsets.bottom == 0) {
    return sb(50);
  } else {
    return sb(270);
  }
}

extension DateExtensionsString on String? {
  String toFormatDate({
    String defaultValue = '',
    String defaultFormat = DateFormate.dateToFormat,
  }) {
    if (this != null) {
      return DateFormat(defaultFormat).format(DateTime.parse(this!)).toString();
    } else {
      return defaultValue;
    }
  }
}

Future delay(int millisecond) {
  return Future.delayed(Duration(milliseconds: millisecond), () {});
}

//Show ok Alert dialog
okAlert(BuildContext context, String msg,
    {Function? onTap, bool? isDismiss = true}) async {
  final result = await showOkAlertDialog(
    context: context,
    title: AppConstants.appTitle,
    message: msg.replaceAll(":", ""),
    onWillPop: () => Future.value(isDismiss),
    barrierDismissible: true,
    okLabel: AppConstants.ok,
  );

  if (result.name == "ok") {
    if (onTap != null) {
      onTap();
    }
  }
}

Widget homeWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      callNextScreenAndClearStack(context, HomeScreen());
    },
    child: Container(
      margin: EdgeInsets.only(right: 15),
      child: Image.asset(
        Imagename.icHome,
        height: 18,
        color: whiteColor,
      ),
    ),
  );
}

//Agree Term Common Widget
Widget termWidget1(String title, bool selected, Function(bool) onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
          checkColor: whiteColor,
          fillColor: (selected)?MaterialStateProperty.all<Color>(blackColor):MaterialStateProperty.all<Color>(whiteColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          value: selected,
          onChanged: (v) {
            onTap(v!);
          },
        ),
        sbw(10),
        Expanded(
          child: TitleTextView(
            title,
            fontSize: f14,
          ),
        )
      ],
    ),
  );
}

Widget commonClipOval(String profilePic, double radius,
    {Color? backColor, placeHolder, double? padding}) {
  return ClipOval(
    child: SizedBox.fromSize(
      size: Size.fromRadius(radius),
      child: Container(
        color: backColor ?? clrApp,
        padding: EdgeInsets.all(
          profilePic == "" ? padding ?? 8 : 0,
        ),
        alignment: Alignment.center,
        child: profilePic != ""
            ? Image.network(profilePic, fit: BoxFit.cover)
            : Image.asset(placeHolder ?? Imagename.appIcon),
      ),
    ),
  );
}

//Left Filter Items
List<String> memberDirectoryCommItem = [
  "RSS",
  "Bajarang Dal",
  "Rawat Rajput",
  "Raghuvanshi Dal"
];
List<String> memberDirectoryStateItem = ["Gujara", "Bajarang Dal"];
List<DropDownModel> relationSideList = [
  DropDownModel(name: "Father Side", id: 1),
  DropDownModel(name: "Mother Side", id: 2),
  DropDownModel(name: "In-Lows Side", id: 3)
];

List<String> businessfilters = [
  "Address",
];

List<String> filters = [
  "Address",
  "Gotra",
  "Vansh",
  "Shakha",
  "Padvi",
];

//Is null or emtpy field
extension IsNullOrEmpty on String? {
  bool isNullOrEmpty() {
    return this == null || this == "";
  }
}

//No Data View
Widget noDataView() {
  return Center(
    child: Opacity(
      opacity: 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Imagename.icNoData,
            height: 50,
          ),
          sb(7),
          TitleTextView(
            "No Data",
            fontSize: 15,
            fontFamily: FontName.nunitoSansBold,
          ),
        ],
      ),
    ),
  );
}
