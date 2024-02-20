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
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class JobListScreen extends StatefulWidget {
  const JobListScreen({Key? key}) : super(key: key);

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
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


  List<String> name = ["Chetan Mehta", "Sahil", "Mayank Patel", "Krutik Gohel", "Sardar Patel"];
  List<String> mobile = ["9945872376", "9845872376", "8845872376", "8145872376", "9045872376"];

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
              context, "Jobs", Imagename.icBack, "", whiteIntColor,
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
      height: 100.h,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        child: /*StaggeredGridView.countBuilder(
          staggeredTileBuilder: (index) =>
              StaggeredTile.fit(1), //cross axis cell count
          mainAxisSpacing: 8, // vertical spacing between items
          crossAxisSpacing: 8, // horizontal spacing between items
          crossAxisCount: 2, // no. of virtual columns in grid
          itemCount: address.length,
          itemBuilder: (context, index) => buildImageCard(index),
        )*/
        (isLoading)?const LoaderWidget():ListView.builder(
            itemCount: name.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return buildImageCard(index);
            }),
      ),
    );
  }

  Widget buildImageCard(int index) => Container(
    margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10)
        .copyWith(top: (index == 0) ? 2.h : 1.h),
    padding: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
      children: [
        sb(0.5.h),
        TitleTextView(name[index], color: clrApp, fontFamily: FontName.nunitoSansBold, fontSize: f20,),
        sb(1.h),
        TitleTextView(mobile[index], color: blueColor, fontFamily: FontName.nunitoSansSemiBold,),
        TitleTextView("Elitech systems", fontSize: f16),
        sb(1.3.h),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextView("Qualification : ", color: blackColor, fontFamily: FontName.nunitoSansBold,),
            TitleTextView("Post Graduate")
          ],
        ),
        sb(0.3.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextView("Job Type : ", color: blackColor, fontFamily: FontName.nunitoSansBold,),
            TitleTextView("Offline")
          ],
        ),
        sb(0.3.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextView("Location : ", color: blackColor, fontFamily: FontName.nunitoSansBold,),
            TitleTextView("Ahmedabad City")
          ],
        ),
        sb(1.h),

        Container(
          color: clrApp,
          height: 6,
        )
      ],
    ),
  );

}
