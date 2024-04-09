import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/loader_widget.dart';
import 'package:jain_app/screens/business/add_business_screen.dart';
import 'package:jain_app/screens/home/bloc/home_bloc.dart';
import 'package:jain_app/screens/home/data/home_datasource.dart';
import 'package:jain_app/screens/home/data/home_repository.dart';
import 'package:jain_app/screens/member/model/business_list_model.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:sizer/sizer.dart';

class BusinessListScreen extends StatefulWidget {
  const BusinessListScreen({Key? key}) : super(key: key);

  @override
  State<BusinessListScreen> createState() => _BusinessListScreenState();
}

class _BusinessListScreenState extends State<BusinessListScreen> {
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
    profileBloc.add(GetBusinessListAPIEvent());
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
                    context,
                    "Business Directory",
                    Imagename.icBack,
                    "",
                    whiteIntColor,
                    leadingAction: () {
                      pop(context);
                    },
                    action: [homeWidget(context)],
                  ),
                  body: commonShapeContainer(bodyView(state)),
                  backgroundColor: clrOrange4,
                  resizeToAvoidBottomInset: false,
                ),
              ),
            );
          })),
    );
  }

  Widget bodyView(HomeState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: (state.businessCallState == ApiCallState.busy)
                    ? const LoaderWidget()
                    : (state.businessListModel != null &&
                            state.businessListModel!.data != null &&
                            state.businessListModel!.data!.memberList!
                                .isNotEmpty)
                        ? ListView.builder(
                            itemCount: state
                                .businessListModel!.data!.memberList!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final model = state
                                  .businessListModel!.data!.memberList![index];
                              return listItemView(model, index);
                            })
                        : noDataView(),
              ),
              sb(7.h),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                callNextScreenWithResult(context, AddBusinessScreen()).then((value){
                  if(value!=null && value=="true"){
                    profileBloc.add(GetBusinessListAPIEvent());
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                        "Add Business Directory",
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

  Widget listItemView(MemberList member, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10)
          .copyWith(top: (index == 0) ? 2.h : 1.h),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: member.status == 0
            ? lightRedColor
            : (member.status == 1)?greenLightColor: whiteColor,
        boxShadow: const [
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
                member.businessTitle ?? "",
                fontFamily: FontName.nunitoSansBold,
                fontWeight: FontWeight.w600,
                fontSize: f18,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: member.status == 0
                      ? redColor
                      : (member.status == 1)
                          ? greenColor
                          : (member.status == 2)?blueColor:Colors.yellow,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: TitleTextView(
                  member.status == 0
                      ? "Rejected" : (member.status == 1)?"Approved":(member.status == 2)?"Awaiting For Approval":"",
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
                Imagename.icUser1,
                height: 15,
              ),
              sbw(2.w),
              TitleTextView(
                member.ownerName ?? "",
                fontFamily: FontName.nunitoSansBold,
              ),
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
              TitleTextView(
                member.mobileNumber ?? "",
                fontFamily: FontName.nunitoSansSemiBold,
              ),
            ],
          ),
          sb(1.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      Imagename.icCateogry,
                      height: 15,
                    ),
                    sbw(2.w),
                    TitleTextView(
                      member.businessCategory!.name ?? "",
                      fontFamily: FontName.nunitoSansSemiBold,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  callNextScreenWithResult(context, AddBusinessScreen(member: member,)).then((value){
                    if(value!=null && value=="true"){
                      profileBloc.add(GetBusinessListAPIEvent());
                    }
                  });
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
