import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/matrimonial/bloc/matri_bloc.dart';
import 'package:jain_app/screens/matrimonial/data/matri_datasource.dart';
import 'package:jain_app/screens/matrimonial/data/matri_repository.dart';
import 'package:jain_app/screens/matrimonial/matri_search_list_screen.dart';
import 'package:jain_app/screens/matrimonial/model/member_preference_model.dart';
import 'package:jain_app/screens/matrimonial/model/search_matri_request_model.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/image_constant.dart';

class MatriSearchScreen extends StatefulWidget {
  MemberPreferenceModel? memberPreferenceModel;

  MatriSearchScreen({Key? key, this.memberPreferenceModel}) : super(key: key);

  @override
  State<MatriSearchScreen> createState() => _MatriSearchScreenState();
}

class _MatriSearchScreenState extends State<MatriSearchScreen> {
  String gender = "";
  String location = "";
  List<DropDownModel> locationDD = [];
  List<DropDownModel> maritalDD = [];
  String marital = "";
  List<DropDownModel> motherToungDD = [];
  String motherToung = "";
  List<DropDownModel> eduTypeDD = [];
  String eduType = "";
  List<DropDownModel> eduFieldDD = [];
  String eduField = "";

  MatriBloc matriBloc = MatriBloc(
    repository: MatriRepository(
      dataSource: MatriDataSource(),
    ),
  );

  @override
  void initState() {
    super.initState();

    final model = widget.memberPreferenceModel!.data;

    locationDD.add(DropDownModel(id: "0", name: "All"));
    locationDD.addAll(getDropDown("cities"));
    location = model!.expectedCityId.toString();
    gender = model.expectedGender.toString();
    maritalDD.add(DropDownModel(id: "All", name: "All"));
    maritalDD.addAll(getDropDown("maritalStatusDropDown"));
    motherToungDD.add(DropDownModel(id: "All", name: "All"));
    motherToungDD.addAll(getDropDown("motherTongueDropDown"));
    eduTypeDD.add(DropDownModel(id: "All", name: "All"));
    eduTypeDD.addAll(getDropDown("educationTypeDropdown"));
    motherToung = model.expectedMotherTongue.toString();
    eduType = model.expectedEducationType.toString();
    eduFieldDD.add(DropDownModel(id: "All", name: "All"));
    eduFieldDD.addAll(getDropDown("educationFieldDropdown"));
    eduField = model.expectedEducationField.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MatriBloc, MatriState>(
      bloc: matriBloc,
      listener: (context, matristate) {
        if (matristate.searchMatriListCallState == ApiCallState.success) {
          callNextScreen(
              context,
              MatriSearchListScreen(
                matchProfileListModel: matristate.matchProfileListModel,
              ));
        }
      },
      child: BlocBuilder<MatriBloc, MatriState>(
          bloc: matriBloc,
          builder: ((context, matristate) {
            return Container(
              color: whiteColor,
              child: SafeArea(
                top: false,
                child: Scaffold(
                  appBar: appBar(
                    context,
                    "Search Matrimonials",
                    Imagename.icBack,
                    "",
                    whiteIntColor,
                    leadingAction: () {
                      pop(context);
                    },
                    action: [homeWidget(context)],
                  ),
                  body: commonShapeContainer(bodyView(matristate)),
                  backgroundColor: clrApp,
                  resizeToAvoidBottomInset: false,
                ),
              ),
            );
          })),
    );
  }

  Widget bodyView(MatriState matristate) {
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
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Gender",
                    isDropDownHint: "Select Gender",
                    list: [
                      DropDownModel(name: "Male", id: "Male"),
                      DropDownModel(name: "Female", id: "Female")
                    ],
                    isSuffixImage: true,
                    // isValidate: state.fistValidate,
                    suffixImage: Imagename.downArrow,
                    selectedItem: gender.isNotEmpty
                        ? DropDownModel(id: gender, name: gender)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      gender = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(genderId: v));
                      // authBloc.add(EmailEvent(controllerEmail.text.trim()));
                    },
                  ),
                  sb(10),
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Select Location",
                    isDropDownHint: "Select Location",
                    list: locationDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    selectedItem: location.isNotEmpty
                        ? DropDownModel(
                            id: location,
                            name: dropDownName("cities", location).toString().isEmpty?"All":dropDownName("cities", location),
                          )
                        : null,
                    onChangeInt: (v) {
                      location = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(10),
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Marital Status",
                    isDropDownHint: "Select Marital Status",
                    list: maritalDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    selectedItem: marital.isNotEmpty
                        ? DropDownModel(id: marital, name: marital)
                        : null,
                    onChangeInt: (v) {
                      marital = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(10),
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Mother Tongue",
                    isDropDownHint: "Select Mother Tongue",
                    list: motherToungDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    selectedItem: motherToung.isNotEmpty
                        ? DropDownModel(id: motherToung, name: motherToung)
                        : null,
                    onChangeInt: (v) {
                      motherToung = v;
                      setState(() {});
                      // registerBloc.add(DropDownIDsEvent(maritalId: v));
                    },
                  ),
                  sb(10),
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Education Type",
                    isDropDownHint: "Select Education Type",
                    list: eduTypeDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    onTap: () {},
                    selectedItem: eduType.isNotEmpty
                        ? DropDownModel(id: eduType, name: eduType)
                        : null,
                    onChangeInt: (v) {
                      eduType = v;
                      setState(() {});
                    },
                  ),
                  sb(10),
                  CustomDropDownField(
                    context: context,
                    textFieldName: "Education Field",
                    isDropDownHint: "Select Education Type",
                    list: eduFieldDD,
                    isSuffixImage: true,
                    suffixImage: Imagename.downArrow,
                    selectedItem: eduField.isNotEmpty
                        ? DropDownModel(id: eduField, name: eduField)
                        : null,
                    onTap: () {},
                    onChangeInt: (v) {
                      eduField = v;
                      setState(() {});
                    },
                  ),
                  sb(10),
                  sb(100)
                ],
              ),
            ),
          ),
          Button(
            title: "Search",
            fontColor: whiteColor,
            backgroundColor: clrOrange,
            isLoading: matristate.searchMatriListCallState == ApiCallState.busy,
            ontap: () {
              unFocus(context);
              // callNextScreen(context, const MatriSearchListScreen());

              matriBloc.add(
                SearchMatriListEvent(
                  requestModel: SearchMatriRequestModel(
                    motherToung: motherToung,
                    eduType: eduType,
                    eduField: eduField,
                    gender: gender,
                    location: location,
                    maritalStatus: marital,
                  ),
                ),
              );
            },
          ),
          sb(10)
        ],
      ),
    );
  }
}
