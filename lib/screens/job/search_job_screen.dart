import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/screens/job/job_list_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:jain_app/componenets/title_widget.dart';


class JobSearchScreen extends StatefulWidget {
  const JobSearchScreen({Key? key}) : super(key: key);

  @override
  State<JobSearchScreen> createState() => _JobSearchScreenState();
}

class _JobSearchScreenState extends State<JobSearchScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerFatherName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPincodeN = TextEditingController();
  TextEditingController controllerPincodePR = TextEditingController();
  TextEditingController controllerPincodeP = TextEditingController();

  //Native Address
  TextEditingController controllerAddressN = TextEditingController();

  //Permanant Address
  TextEditingController controllerAddressP = TextEditingController();

  //Present Address
  TextEditingController controllerAddressPR = TextEditingController();

  bool passHide = true;

  //Date picker variable
  DateTime dateTemp = DateTime.now();
  String selectedDate = "";



  final subGotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final subShakhaKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final gotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();

  final distictPRKey = GlobalKey<DropdownSearchState<String>>();
  final statePRKey = GlobalKey<DropdownSearchState<String>>();
  final distictNKey = GlobalKey<DropdownSearchState<String>>();
  final stateNKey = GlobalKey<DropdownSearchState<String>>();
  final distictPKey = GlobalKey<DropdownSearchState<String>>();
  final statePKey = GlobalKey<DropdownSearchState<String>>();
  final subDistictPKey = GlobalKey<DropdownSearchState<String>>();
  final subDistictPRKey = GlobalKey<DropdownSearchState<String>>();
  final subDistictNKey = GlobalKey<DropdownSearchState<String>>();
  final villageNKey = GlobalKey<DropdownSearchState<String>>();
  final villagePKey = GlobalKey<DropdownSearchState<String>>();
  final villagePRKey = GlobalKey<DropdownSearchState<String>>();

  bool isNativeShow = false;
  bool isPresentShow = false;
  bool isPermenentShow = false;

  bool? termAccept = false;


  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: appBar(context, "Search Jobs",
              Imagename.icBack, "", whiteIntColor, leadingAction: () {
                pop(context);
              },action: [
                homeWidget(context)
              ],),
          body: commonShapeContainer(bodyView()),
          backgroundColor: clrApp,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  Widget bodyView() {
    return Container(
      color: whiteColor,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  sb(30),


                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Select Location",
                    isDropDownHint: "Select Location",
                    list: [DropDownModel(name: "Ahmedabad"), DropDownModel(name: "Rajkot")],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Field/Category",
                    isDropDownHint: "Select Field/Category",
                    list: [DropDownModel(name: "IT"), DropDownModel(name: "M.Com")],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Educational Qualification",
                    isDropDownHint: "Select Educational Qualification",
                    list: [DropDownModel(name: "HSC"), DropDownModel(name: "SSC")],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),


                  //Name
                  CustomTextField(
                    context: context,
                    textFieldName: "Extra Details",
                    hintText: "Enter Extra Details",
                    numberOfLines: 3,
                    controller: controllerName,
                    textInputAction: TextInputAction.next,
                    onChange: (v) {},
                  ),

                  sb(100)
                ],
              ),
            ),
          ),
          Button(
            title: "Search",
            fontColor: whiteColor,
            backgroundColor: clrOrange,
            ontap: () {
              unFocus(context);
              callNextScreen(context, const JobListScreen());
            },
          ),
          sb(10)
        ],
      ),
    );
  }


}
