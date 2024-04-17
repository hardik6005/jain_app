import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/job/job_list_screen.dart';
import 'package:jain_app/screens/job/model/search_job_request.dart';
import 'package:jain_app/screens/member/bloc/member_bloc.dart';
import 'package:jain_app/screens/member/data/member_datasource.dart';
import 'package:jain_app/screens/member/data/member_repository.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/image_constant.dart';

class JobSearchScreen extends StatefulWidget {
  const JobSearchScreen({Key? key}) : super(key: key);

  @override
  State<JobSearchScreen> createState() => _JobSearchScreenState();
}

class _JobSearchScreenState extends State<JobSearchScreen> {
  bool isNativeShow = false;
  bool isPresentShow = false;
  bool isPermenentShow = false;

  bool? termAccept = false;

  bool isLoading = false;

  MemberBloc memberBloc = MemberBloc(
    repository: MemberRepository(
      dataSource: MemberDataSource(),
    ),
  );

  List<DropDownModel> cityDD = [];
  List<DropDownModel> categoryDDD = [];
  List<DropDownModel> eduQualifiDDD = [];
  String city = "";
  String category = "";
  String eduQualifi = "";
  String jobType = "";
  TextEditingController controllerExtraDetail = TextEditingController();

  @override
  void initState() {
    super.initState();

    cityDD = getDropDown("cities");
    categoryDDD = getDropDown("categoryDropDown");
    eduQualifiDDD = getDropDown("educationalQualificationDropDown");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberBloc, MemberState>(
      bloc: memberBloc,
      listener: (context, state) {
        if (state.searchJobCallState == ApiCallState.success) {
          callNextScreen(
              context,
              JobListScreen(
                searchJobListModel: state.searchJobListModel,
              ));
        }
      },
      child: BlocBuilder<MemberBloc, MemberState>(
          bloc: memberBloc,
          builder: ((context, state) {
            return Container(
              color: whiteColor,
              child: SafeArea(
                top: false,
                child: Scaffold(
                  appBar: appBar(
                    context,
                    "Search Jobs",
                    Imagename.icBack,
                    "",
                    whiteIntColor,
                    leadingAction: () {
                      pop(context);
                    },
                    action: [homeWidget(context)],
                  ),
                  body: commonShapeContainer(bodyView(state)),
                  backgroundColor: clrApp,
                  resizeToAvoidBottomInset: false,
                ),
              ),
            );
          })),
    );
  }

  Widget bodyView(MemberState state) {
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
                    list: cityDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: city.isNotEmpty
                        ? DropDownModel(
                            id: city, name: dropDownName("cities", city))
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      city = v;
                      setState(() {});
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Field/Category",
                    isDropDownHint: "Select Field/Category",
                    list: categoryDDD,
                    selectedItem: category.isNotEmpty
                        ? DropDownModel(
                            id: city,
                            name: dropDownName("categoryDropDown", category))
                        : null,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    onChangeInt: (v) {
                      category = v;
                      setState(() {});
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
                    list: eduQualifiDDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: eduQualifi.isNotEmpty
                        ? DropDownModel(id: eduQualifi, name: eduQualifi)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      eduQualifi = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),

                  //Gender
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Job Type",
                    isDropDownHint: "Select Job Type",
                    list: [
                      DropDownModel(id: "Offline", name: "Offline"),
                      DropDownModel(
                          id: "Work From Home", name: "Work From Home"),
                    ],
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: jobType.isNotEmpty
                        ? DropDownModel(id: jobType, name: jobType)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      jobType = v;
                      setState(() {});
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
                    controller: controllerExtraDetail,
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
            isLoading: state.searchJobCallState == ApiCallState.busy,
            isDisable: state.searchJobCallState == ApiCallState.busy,
            ontap: () {
              unFocus(context);

              memberBloc.add(SearchJobSeekerEvent(
                  request: SearchJobRequest(
                      city_id: city,
                      educational_qualification: eduQualifi,
                      category: category,
                      extra_details: controllerExtraDetail.text,
                      job_type: jobType)));
            },
          ),
          sb(10)
        ],
      ),
    );
  }
}
