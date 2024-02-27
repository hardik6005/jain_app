import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';

class MatriSearchListScreen extends StatefulWidget {
  const MatriSearchListScreen({Key? key}) : super(key: key);

  @override
  State<MatriSearchListScreen> createState() => _MatriSearchListScreenState();
}

class _MatriSearchListScreenState extends State<MatriSearchListScreen> {
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
          appBar: appBar(
            context,
            "Matched Profiles",
            Imagename.icBack,
            "",
            whiteIntColor,
            leadingAction: () {
              pop(context);
            },
            action: [homeWidget(context)],
          ),
          body: commonShapeContainer(bodyView()),
          backgroundColor: clrOrange4,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  Widget bodyView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: clrOrange4,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return listItemView(index);
                }),
          ),
        ],
      ),
    );
  }

  Widget listItemView(int index) {
    final image = NetworkImage(StaticList.url);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10)
          .copyWith(top: (index == 0) ? 2.h : 1.h),
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: clrOrange4,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sb(0.5.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: clrApp,
                      child: CircleAvatar(
                        backgroundImage: image as ImageProvider,
                        radius: 50,
                        backgroundColor: clrApp,
                      ),
                    ),
                    sb(15),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: clrApp),
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            Imagename.show,
                            color: whiteColor,
                          ),
                        ),
                        sbw(10),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: clrApp),
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            Imagename.icContact,
                            color: whiteColor,
                            height: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                sbw(10),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleTextView(
                            "Avani Nitin Shah",
                            fontFamily: FontName.nunitoSansExtraBold,
                            fontWeight: FontWeight.w600,
                            fontSize: f20,
                          ),
                        ],
                      ),
                      sb(2.h),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleTextView(
                                  "Age : ",
                                  fontFamily: FontName.nunitoSansBold,
                                ),
                                Expanded(
                                  child: TitleTextView(
                                    "24",
                                    fontFamily: FontName.nunitoSansRegular,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleTextView(
                                  "Weight : ",
                                  fontFamily: FontName.nunitoSansBold,
                                ),
                                Expanded(
                                  child: TitleTextView(
                                    "50",
                                    fontFamily: FontName.nunitoSansRegular,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Height : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              "5ft; 0inch; (1.52 mts)",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Marital Status : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              "Never Married",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Mother Tongue : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              "Gujarati",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Location : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              "Ahmedabad",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Education Type : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              "Bachelors",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Education Field : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              "Advertising/ Marketing",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(2.h),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: clrApp,
            height: 6,
          )
        ],
      ),
    );
  }
}
