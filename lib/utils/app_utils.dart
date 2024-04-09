//If not display AppBar in Screen Use this for StatusBar Color
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/home/home_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';

import '../main.dart';

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

//Show ok Alert dialog
okCancelAlert(BuildContext context, String msg,
    {Function? onTap, bool? isDismiss = true}) async {
  final result = await showOkCancelAlertDialog(
      context: context,
      title: AppConstants.appTitle,
      message: msg.replaceAll(":", ""),
      onWillPop: () => Future.value(isDismiss),
      barrierDismissible: true,
      okLabel: "Yes",
      cancelLabel: "No");

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
          fillColor: (selected)
              ? MaterialStateProperty.all<Color>(blackColor)
              : MaterialStateProperty.all<Color>(whiteColor),
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

//Agree Term Common Widget
Widget termWidget(String title, bool selected, Function(bool) onTap, Color backColor) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
          // checkColor: backColor,
          // overlayColor: MaterialStateProperty.all<Color>(backColor),
          fillColor: (selected)
              ? MaterialStateProperty.all<Color>(blackColor)
              : MaterialStateProperty.all<Color>(whiteColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(width: 2.0, color: backColor),
          ),
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
            color: clrApp,
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

Future<void> pickeFileWidget(List<PickerModel> pickerModel, String str) async {
  if (str == TAG.document) {
    FileType _pickingType = FileType.custom;
    final FilePickerResult? photo = await FilePicker.platform.pickFiles(
      type: _pickingType,
      allowedExtensions: ["pdf"],
    );
    if (photo != null) {
      pickerModel.clear();
      pickerModel.add(
          PickerModel(TAG.document, photo.paths[0]!, photo.names[0]!, "pdf"));
    }
  }
}

//Browse picker modes
Future<void> pickerModesWidget(
    ImagePicker picker, List<PickerModel> pickerModel, String str) async {
  if (str == TAG.camera) {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      pickerModel.clear();
      pickerModel.add(PickerModel(
          TAG.camera, photo.path, photo.name, photo.mimeType ?? ""));
    }
  } else if (str == TAG.gallery) {
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      pickerModel.clear();
      pickerModel.add(PickerModel(TAG.gallery, photo.path, photo.name,
          photo.mimeType != null ? photo.mimeType! : ""));
    }
  }
}

//Check internet connnection
Future<ConnectivityResult> checkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult;
}

getDropDown(String name) {
  List<DropDownModel> relationHofDD = [];
  Map relationHOD = dropDownJson[name] ?? {};
  relationHOD.forEach((key, value) {
    if (key.toString().isNotEmpty) {
      relationHofDD.add(DropDownModel(id: key, name: value));
    }
  });
  return relationHofDD;
}

dropDownName(String type, String id) {
  Map relationHOD = dropDownJson[type] ?? {};


  return relationHOD[id] ?? "";
}

List<String> validationStrings = [
  "Relation With HOF*",
  "${AppConstants.fullname}*",
  "${AppConstants.phone}*",
  "${AppConstants.selectGender}*",
  "${AppConstants.selectMaritalStatus}*",
  "${AppConstants.dob}*",
  "Blood Group" "*",
  "Educational Qualification" "*",

  "Business Title" "*",
  "Owner Name" "*",
  "${AppConstants.phone}*",
  "Business Category" "*",
  "Select State" "*",
  "Select City" "*",
  "Area" "*",
  "Address Line 1" "*",
  "Address Line 2" "*",
  "Visiting Card" "*",
  "First Name" "*",
  "Middle Name" "*",
  "Last Name" "*",
  "${AppConstants.selectGender}*",
  "${AppConstants.dob}*",
  "${AppConstants.selectMaritalStatus}*",
  "Age" "*",
  "${AppConstants.height}*",
  "Weight" "*",
  "Blood Group" "*",
  'Complextion' "*",
  'Physical Disability' "*",
  'Manglik' "*",
  'Rashi' "*",
  'Education Type' "*",
  'Education Field' "*",
  'Working With' "*",
  'Working As' "*",
  "Birth Place" "*",
  "Birth Time" "*",
  'Mother Tongue' "*",
  "Sub Community" "*",
  "Father Status" "*",
  "Mother Status" "*",
  "Photos" "*",
  "I agreed on terms & conditions and declared that I've shared correct information.",
];

List<String> addMemberRequired = [
  "Relation With HOF*",
  "${AppConstants.fullname}*",
  "${AppConstants.phone}*",
  "${AppConstants.selectGender}*",
  "${AppConstants.selectMaritalStatus}*",
  "${AppConstants.dob}*",
  "Blood Group" "*",
  "Educational Qualification" "*"
];

List<String> addBusinessRequired = [
  "Business Title" "*",
  "Owner Name" "*",
  "${AppConstants.phone}*",
  "Business Category" "*",
  "Select State" "*",
  "Select City" "*",
  "Area" "*",
  "Address Line 1" "*",
  "Address Line 2" "*",
  "Visiting Card" "*",
];

List<String> addMatriRequired1 = [
  "First Name" "*",
  "Middle Name" "*",
  "Last Name" "*",
  "${AppConstants.selectGender}*",
  "${AppConstants.dob}*",
  "${AppConstants.selectMaritalStatus}*",
  "Age" "*",
  "${AppConstants.height}*",
  "Weight" "*",
  "Blood Group" "*",
  'Complextion' "*",
  'Physical Disability' "*",
  'Manglik' "*",
  'Rashi' "*",
  'Education Type' "*",
  'Education Field' "*",
  'Working With' "*",
  'Working As' "*",
  "Birth Place" "*",
  "Birth Time" "*",
  'Mother Tongue' "*",
];
List<String> addMatriRequired2 = [
  "Sub Community" "*",
  "Father Status" "*",
  "Mother Status" "*",
];
List<String> addMatriRequired4 = [
  "Photos" "*",
  "I agreed on terms & conditions and declared that I've shared correct information.",
];


checkNUaEM(String? value){
  return value != null && value.isNotEmpty;
}

enum StatusMatrimonial{
  Rejected, Approved, AwaitingForApproval
}

enum StatusUser{
  Deleted, Active, Blocked
}

enum StatusJobPortal{
  Rejected, Approved, AwaitingForApproval
}

enum StatusBusinessAdvert{
  Rejected, Approved, AwaitingForApproval
}

