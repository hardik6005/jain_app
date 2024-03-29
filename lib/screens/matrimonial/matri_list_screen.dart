import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/loader_widget.dart';
import 'package:jain_app/screens/business/add_business_screen.dart';
import 'package:jain_app/screens/home/bloc/home_bloc.dart';
import 'package:jain_app/screens/home/data/home_datasource.dart';
import 'package:jain_app/screens/home/data/home_repository.dart';
import 'package:jain_app/screens/home/home_screen.dart';
import 'package:jain_app/screens/matrimonial/add_matrimonial_profile.dart';
import 'package:jain_app/screens/matrimonial/model/matri_list_model.dart';
import 'package:jain_app/screens/matrimonial/search_matri_screen.dart';
import 'package:jain_app/screens/member/add_member_screen.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MatriListScreen extends StatefulWidget {
  const MatriListScreen({Key? key}) : super(key: key);

  @override
  State<MatriListScreen> createState() => _MatriListScreenState();
}

class _MatriListScreenState extends State<MatriListScreen> {
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

  HomeBloc profileBloc = HomeBloc(
    repository: HomeRepository(
      dataSource: HomeDataSource(),
    ),
  );


  @override
  void initState() {
    super.initState();
    profileBloc.add(GetMatriListAPIEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: profileBloc,
      listener: (context, state) {},
      child: BlocBuilder<HomeBloc, HomeState>(
          bloc: profileBloc,
          builder: ((context, state) {
            return Container(
              color: whiteColor,
              child: SafeArea(
                top: false,
                child: Scaffold(
                  appBar: appBar(
                    context, "Matrimonial Directory", Imagename.icBack, "", whiteIntColor,
                    leadingAction: () {
                      pop(context);
                    }, action: [
                    homeWidget(context)
                  ],),
                  body: commonShapeContainer(bodyView(state)),
                  backgroundColor: clrOrange4,
                  resizeToAvoidBottomInset: false,
                ),
              ),);
          })),
    );
  }

  Widget bodyView(HomeState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: (state.matriCallState == ApiCallState.busy)
                    ? const LoaderWidget()
                    : (state.matriListModel != null &&
                    state.matriListModel!.data != null &&
                    state.matriListModel!.data!.memberList!
                        .isNotEmpty)
                    ? ListView.builder(
                    itemCount: state
                        .matriListModel!.data!.memberList!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final model = state.matriListModel!.data!.memberList![index];
                      return listItemView(model, index);
                    })
                    : noDataView(),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                callNextScreen(context, AddMatrimonialScreen());
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: clrOrange),
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
                        "Add Matrimonial Details",
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

  Widget listItemView(MemberList model, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10)
          .copyWith(top: (index == 0) ? 2.h : 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: (index == 0)
            ? whiteColor
            : (index == 1)
            ? lightRedColor
            : (index == 2)
            ? lightRedColor
            : (index == 3)
            ? whiteColor
            : (index == 4)
            ? lightRedColor
            : (index == 5)
            ? whiteColor
            : whiteColor,
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
                model.fullName,
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
                      ? "Rejected"
                      : (index == 2)
                      ? "Rejected"
                      : (index == 3)
                      ? "Active"
                      : (index == 4)
                      ? "Rejected"
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
                Imagename.icGender,
                height: 15,
              ),
              sbw(2.w),
              TitleTextView(model.gender, fontFamily: FontName.nunitoSansSemiBold,),
            ],
          ),
          sb(1.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      Imagename.dateIcon,
                      height: 15,
                      color: Colors.black,
                    ),
                    sbw(2.w),
                    TitleTextView(model.dob, fontFamily: FontName.nunitoSansSemiBold,),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  callNextScreen(context, AddMatrimonialScreen());
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
              ),
              sbw(10),
              GestureDetector(
                onTap: () {
                  callNextScreen(context, MatriSearchScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: clrAppLight1),
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    Imagename.icSearch,
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
