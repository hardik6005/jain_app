import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/loader_widget.dart';
import 'package:jain_app/screens/home_screen.dart';
import 'package:jain_app/screens/member/add_member_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({Key? key}) : super(key: key);

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
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

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    delay(2000).then((value){
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: appBar(
              context, "Member Directory", Imagename.icBack, "", whiteIntColor,
              leadingAction: () {
                pop(context);
              }, action: [
              homeWidget(context)
          ],),
        body: commonShapeContainer(bodyView()),
        backgroundColor: clrApp,
        resizeToAvoidBottomInset: false,
      ),
    ),);
  }

  Widget bodyView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: (isLoading)?const LoaderWidget():ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return listItemView(index);
                    }),
              ),
              sb(7.h),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                callNextScreen(context, AddMemberScreen());
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: clrApp),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Imagename.icMatri,
                      height: 17,
                      color: whiteColor,
                    ),
                    sbw(13),
                    Container(
                      child: TitleTextView(
                        AppConstants.addMember,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: f17,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItemView(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10)
          .copyWith(top: (index == 0) ? 2.h : 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: clrOrange4,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleTextView(
                (index == 0)
                    ? "Elitech Head"
                    : (index == 1)
                    ? "John Doe"
                    : (index == 2)
                    ? "James Dean"
                    : (index == 3)
                    ? "Carry Jackson"
                    : (index == 4)
                    ? "Dean Switson"
                    : (index == 5)
                    ? "Martin Chain"
                    : "Lalit roy",
                fontFamily: FontName.nunitoSansBold,
                fontWeight: FontWeight.w600,
                fontSize: f18,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: (index == 0)
                      ? greenColor
                      : (index == 1)
                      ? redColor
                      : (index == 2)
                      ? redColor
                      : (index == 3)
                      ? greenColor
                      : (index == 4)
                      ? redColor
                      : (index == 5)
                      ? greenColor
                      : greenColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: TitleTextView(
                  (index == 0)
                      ? "Active"
                      : (index == 1)
                      ? "Inactive"
                      : (index == 2)
                      ? "Inactive"
                      : (index == 3)
                      ? "Active"
                      : (index == 4)
                      ? "Inactive"
                      : (index == 5)
                      ? "Active"
                      : "Active",
                  color: whiteColor,
                  fontFamily: FontName.nunitoSansBold,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          sb(2.h),
          Row(
            children: [
              Image.asset(
                Imagename.icMobile,
                height: 15,
              ),
              sbw(2.w),
              TitleTextView((index == 0)
                  ? "9976236745"
                  : (index == 1)
                  ? "9978836745"
                  : (index == 2)
                  ? "9856236745"
                  : (index == 3)
                  ? "8876236745"
                  : (index == 4)
                  ? "8976236745"
                  : (index == 5)
                  ? "8976336745"
                  : "8076236745", fontFamily: FontName.nunitoSansSemiBold,),
            ],
          ),
          sb(1.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      Imagename.icRelation,
                      height: 15,
                    ),
                    sbw(2.w),
                    TitleTextView("Head of Family", fontFamily: FontName.nunitoSansSemiBold,),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      Imagename.icGender,
                      height: 15,
                    ),
                    sbw(2.w),
                    TitleTextView((index == 0)
                        ? "Male"
                        : (index == 1)
                        ? "Female"
                        : (index == 2)
                        ? "Male"
                        : (index == 3)
                        ? "Female"
                        : (index == 4)
                        ? "Male"
                        : (index == 5)
                        ? "Female"
                        : "Male", fontFamily: FontName.nunitoSansSemiBold),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  callNextScreen(context, AddMemberScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: clrApp),
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    Imagename.icEdit,
                    color: whiteColor,
                    height: 13,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
