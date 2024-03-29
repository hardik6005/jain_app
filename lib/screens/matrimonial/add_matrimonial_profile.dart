import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jain_app/componenets/browse_dialog.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_button.dart';
import 'package:jain_app/componenets/custom_dialogue.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/loader_widget_main.dart';
import 'package:jain_app/componenets/title_child_widget.dart';
import 'package:jain_app/componenets/title_widget.dart';
import 'package:jain_app/screens/matrimonial/bloc/matri_bloc.dart';
import 'package:jain_app/screens/matrimonial/circle_image_view.dart';
import 'package:jain_app/screens/matrimonial/data/matri_datasource.dart';
import 'package:jain_app/screens/matrimonial/data/matri_repository.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';

class AddMatrimonialScreen extends StatefulWidget {
  const AddMatrimonialScreen({Key? key}) : super(key: key);

  @override
  State<AddMatrimonialScreen> createState() => _AddMatrimonialScreenState();
}

class _AddMatrimonialScreenState extends State<AddMatrimonialScreen> {
  TextEditingController controllerGotra = TextEditingController();
  TextEditingController controllerPadvi = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDadiName = TextEditingController();
  TextEditingController controllerNaniName = TextEditingController();
  TextEditingController controllerFName = TextEditingController();
  TextEditingController controllerMName = TextEditingController();
  TextEditingController controllerEmailO = TextEditingController();
  TextEditingController controllerPhoneH = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerPatAgeF = TextEditingController();
  TextEditingController controllerPatAgeT = TextEditingController();
  TextEditingController controllerPatHeightF = TextEditingController();
  TextEditingController controllerPatHeightT = TextEditingController();
  TextEditingController controllerAnnIncome = TextEditingController();
  TextEditingController controllerPatAnnIncome = TextEditingController();

  TextEditingController controllerMotherPlace = TextEditingController();
  TextEditingController controllerDadiPlace = TextEditingController();
  TextEditingController controllerNaniPlace = TextEditingController();
  TextEditingController controllerOther = TextEditingController();

  final subGotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final subShakhaKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final mothersubShakhaKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final mothersubGotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final dadisubGotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final nanisubGotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final nanisubShakhaKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final dadisubShakhaKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final gotraKey = GlobalKey<DropdownSearchState<DropDownModel>>();
  final stateNKey = GlobalKey<DropdownSearchState<String>>();
  final villageNKey = GlobalKey<DropdownSearchState<String>>();
  final distictNKey = GlobalKey<DropdownSearchState<String>>();
  final subDistictNKey = GlobalKey<DropdownSearchState<String>>();

  bool passHide = true;

  bool aggree1 = false;
  bool aggree2 = false;
  bool aggree3 = false;

  //Date picker variable
  DateTime dateFeedback = DateTime.now();
  DateTime dateTempFeedback = DateTime.now();
  String selectedDate = "";

  //New image picker variables
  ImagePicker picker = ImagePicker();
  List<PickerModel> pickerModelList = [];
  List<PickerModel> cvModelList = [];
  List<PickerModel> documentModelList = [];

  late ScrollController controller;

  //Fields data
  List<DropDownModel> educationList = [];
  List<DropDownModel> jobList = [];
  List<DropDownModel> occupationList = [];
  List<DropDownModel> countList = [];
  List<DropDownModel> motherSubShakha = [];
  List<DropDownModel> dadiSubShakha = [];
  List<DropDownModel> naniSubShakha = [];
  List<DropDownModel> motherSubGotra = [];
  List<DropDownModel> dadiSubGotra = [];
  List<DropDownModel> naniSubGotra = [];

  int? motherVanshId;
  int? motherShakhaId;
  int? dadiShakhaId;
  int? naniShakhaId;
  DropDownModel? motherSubShakhaId = DropDownModel();
  int? motherGotraId;
  DropDownModel? motherSubGotraId = DropDownModel();
  int? motherPadviId;
  int? motherSurnameId;
  int? dadiVanshId;
  DropDownModel? dadiSubShakhaId = DropDownModel();
  int? dadiGotraId;
  DropDownModel? dadiSubGotraId = DropDownModel();
  int? dadiPadviId;
  int? dadiSurnameId;
  int? naniVanshId;
  DropDownModel? naniSubShakhaId = DropDownModel();
  int? naniGotraId;
  DropDownModel? naniSubGotraId = DropDownModel();
  int? naniPadviId;
  int? naniSurnameId;
  int? educationId;
  int? jobId;
  int? foccupationId;
  int? moccupationId;
  int? countId;
  int? patMariStatusId;
  int? patManglikId;
  int? patSkinToneId;
  int? patBodyTypeId;
  int? patEduId;
  int? patJobId;
  int? brotherMarriedCount;
  int? brotherUnMarriedCount;
  int? sisterMarriedCount;
  int? sisterUnMarriedCount;
  int? id;

  // List<Addresses> addressNativeList = [];
  TextEditingController controllerPincodeN = TextEditingController();
  bool isNativeShow = false;
  bool isLoading = false;

  MatriBloc typeAccountBloc = MatriBloc(
    repository: MatriRepository(
      dataSource: MatriDataSource(),
    ),
  );

  DateTime dateTemp = DateTime.now();

  @override
  void initState() {
    super.initState();

    controller = ScrollController();
    controller.addListener(() {});
    // registerBloc.add(GetMatriProfileAPIEvent());
    // registerBloc.add(DropDownLocalEvent());
    initList();
  }

  void _scrollUp() {
    controller.animateTo(
      controller.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MatriBloc, MatriState>(
      bloc: typeAccountBloc,
      listener: (context, state) {
        if (state.saveMatriProfileCallState == ApiCallState.success) {
          pop(context, data: "Refresh");
        }

        if (state.isValidate == true) {
          typeAccountBloc.add(ValidateEvent(false));
          if (state.page! < 4) {
            _scrollUp();
            typeAccountBloc.add(StepPageEvent(state.page! + 1));
          }
        }
      },
      child: BlocBuilder<MatriBloc, MatriState>(
        bloc: typeAccountBloc,
        builder: ((context, state) {
          return Container(
            color: whiteColor,
            child: SafeArea(
              top: false,
              child: Scaffold(
                appBar: appBar(
                  context,
                  AppConstants.matriProfile,
                  Imagename.icBack,
                  "",
                  whiteIntColor,
                  leadingAction: () {
                    pop(context);
                  },
                  action: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          TitleTextView(
                            "Step.",
                            fontSize: f13,
                            color: whiteColor,
                          ),
                          sbw(3),
                          TitleTextView(
                            "${state.page!}/",
                            fontFamily: FontName.nunitoSansBold,
                            color: whiteColor,
                            fontSize: f20,
                          ),
                          TitleTextView(
                            "4",
                            color: whiteColor,
                            fontSize: f13,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                body: commonShapeContainer(bodyView(state)),
                backgroundColor: clrApp,
                resizeToAvoidBottomInset: false,
              ),
            ),
          );
        }),
      ),
    );
  }

/*

  void setExistData() {
    int? vanshId;
    int? shakhaId;
    int? gotraId;
    int? subShakhaId;
    int? subGotraId;
    int? surnameId;
    int? padviId;
    String? name;
    String? fatherName;
    String? mobileNo;
    int? genderId;
    String? email;
    int? maritalStatusId;
    PresentAddress? presentAdd;
    int? manglikEff;
    int? height;
    int? skinTone;
    int? bodyType;
    String? profilePic;

    //API data
    if (stateReg.myMatrimonialDataModel!.data != null) {
      // model = stateReg.myMatrimonialDataModel!.data;
      final model = stateReg.myMatrimonialDataModel!.data!;
      id = model.id;
      vanshId = model.vanshId;
      shakhaId = model.shakhaId;
      gotraId = model.gotraId;
      subShakhaId = model.subShakhaId;
      subGotraId = model.subGotraId;
      surnameId = model.surnameId;
      padviId = model.padviId;
      name = model.name;
      fatherName = model.fatherName;
      mobileNo = model.phoneNo;
      genderId = model.genderId;
      email = model.email;
      maritalStatusId = model.maritalStatusId;
      presentAdd = PresentAddress(
        present_pin_code: model.pinCode!,
        presentStateId: model.stateId!,
        presentDistrictId: model.districtId!,
        presentSubDistrictId: model.subDistrictId!,
        presentVillageId: model.villageId!,
        presentAddress: model.address,
      );
      manglikEff = int.parse(model.manglikEffectId!);
      height = model.height!;
      skinTone = model.skinToneId!;
      bodyType = model.bodyTypeId!;
      if (profilePic != null) {
        pickerModelList
            .add(PickerModel("", URLS.imageUrl + profilePic, "", ""));
      }
      educationId = model.educationId;
      jobId = model.jobSectorId;
      controllerAnnIncome.text = model.annualIncome ?? "";
      foccupationId = model.fatherOccupationsId;
      moccupationId = model.motherOccupationsId;
      //Mother
      controllerMName.text = model.motherName ?? "";
      motherVanshId = model.motherVanshId;
      motherShakhaId = model.motherShakhaId;
      motherGotraId = model.motherGotraId;
      motherPadviId = model.motherPadviId;
      motherSurnameId = model.motherSurnameId;
      motherSubGotraId = DropDownModel(
          id: model.motherSubGotraId,
          name: getSubIdName(model.motherSubGotraId!, model.motherGotraId!,
              DropType.subGotra));
      motherSubShakhaId = DropDownModel(
          id: model.motherSubShakhaId,
          name: getSubIdName(model.motherSubShakhaId!, model.motherShakhaId!,
              DropType.subGotra));
      controllerMotherPlace.text = model.motherNativePlace ?? "";
      //Dadi
      controllerDadiName.text = model.dadiName ?? "";
      dadiVanshId = model.dadiVanshId;
      dadiShakhaId = model.dadiShakhaId;
      dadiGotraId = model.dadiGotra;
      dadiPadviId = model.dadiPadviId;
      dadiSurnameId = int.parse(model.dadiSurnameId!);
      dadiSubGotraId = DropDownModel(
          id: model.dadiSubGotraId,
          name: getSubIdName(
              model.dadiSubGotraId!, model.dadiGotra!, DropType.subGotra));
      dadiSubShakhaId = DropDownModel(
          id: model.dadiSubShakhaId,
          name: getSubIdName(
              model.dadiSubShakhaId!, model.dadiShakhaId!, DropType.subGotra));
      controllerDadiPlace.text = model.dadiNativePlace ?? "";
      //Nani
      controllerNaniName.text = model.naniName ?? "";
      naniVanshId = model.naniVanshId;
      naniShakhaId = model.naniShakhaId;
      naniGotraId = model.naniGotraId;
      naniPadviId = model.naniPadviId;
      naniSurnameId = model.naniSurnameId!;
      naniSubGotraId = DropDownModel(
          id: model.naniSubGotraId,
          name: getSubIdName(
              model.naniSubGotraId!, model.naniGotraId!, DropType.subGotra));
      naniSubShakhaId = DropDownModel(
          id: model.naniSubShakhaId,
          name: getSubIdName(
              model.naniSubShakhaId!, model.naniShakhaId!, DropType.subGotra));
      controllerNaniPlace.text = model.naniNativePlace ?? "";
      brotherMarriedCount = int.parse(model.brotherDetailsMarriedCount!);
      brotherUnMarriedCount = int.parse(model.brotherDetailsUnMarriedCount!);
      sisterMarriedCount = int.parse(model.sisterDetailsMarriedCount!);
      sisterUnMarriedCount = int.parse(model.sisterDetailsUnMarriedCount!);
      patMariStatusId = model.partnerMaritalStatusId;
      patManglikId = model.partnerManglikEffectId;
      controllerPatAgeF.text = model.partnerAgeFrom ?? "";
      controllerPatAgeT.text = model.partnerAgeTo ?? "";
      controllerPatHeightF.text = model.partnerHeighFrom ?? "";
      controllerPatHeightT.text = model.partnerHeighTo ?? "";
      patSkinToneId = model.partnerSkinId;
      patBodyTypeId = model.partnerBodyTypeId;
      patEduId = model.partnerEducationId;
      patJobId = model.partnerJobSectorId;
      controllerPatAnnIncome.text = model.partnerAnnualIncome ?? "";
      controllerOther.text = model.otherInfo ?? "";
      documentModelList.add(
          PickerModel("", model.uploadDocument!, model.uploadDocument!, ""));
      cvModelList.add(PickerModel("", model.uploadCv!, model.uploadCv!, ""));
      aggree1 = model.sendProfileDetails == 1 ? true : false;
      aggree2 = model.matrimonialManagements == 1 ? true : false;
      aggree3 = model.rrsMatrimonialTermsConditions == 1 ? true : false;
    }

    //Profile Data
    else {
      final model = userDataModel!.data!;
      // basic = model.basicInformation!;
      if(userDataModel!.data!=null && model.basicInformation!=null) {
        vanshId = model.basicInformation!.vanshId;
        shakhaId = model.basicInformation!.shakhaId;
        gotraId = model.basicInformation!.gotraId;
        subShakhaId = model.basicInformation!.subShakhaId;
        subGotraId = model.basicInformation!.subGotraId;
        surnameId = model.basicInformation!.surnameId;
        padviId = model.basicInformation!.padviId;
        name = model.name;
        fatherName = model.fatherName;
        mobileNo = model.mobileNo;
        genderId = model.genderId;
        email = model.email;
        maritalStatusId = model.maritalStatusId;
        presentAdd = userDataModel!.data!.presentAddress!;
      }
    }

    //Set Already Have Fields--------------------------------------------------

    //Page-1---------------------------
    registerBloc.add(DropDownIDsEvent(vanshId: vanshId));
    registerBloc.add(DropDownIDsEvent(shakhaId: shakhaId));
    registerBloc.add(DropDownIDsEvent(gotraId: gotraId));
    DropDownModel subShakha = DropDownModel(
      id: subShakhaId,
      mainId: shakhaId!.toString(),
      name: getSubIdName(
          subShakhaId!.toInt(), shakhaId.toInt(), DropType.subShakha),
    );
    DropDownModel subGotra = DropDownModel(
      id: subGotraId,
      mainId: gotraId!.toString(),
      name:
          getSubIdName(subGotraId!.toInt(), gotraId.toInt(), DropType.subGotra),
    );
    registerBloc.add(DropDownIDsEvent(subShakhaId: subShakha));
    registerBloc.add(DropDownIDsEvent(subgotraId: subGotra));
    registerBloc.add(DropDownIDsEvent(surnameId: surnameId));
    registerBloc.add(DropDownIDsEvent(padviId: padviId));
    controllerName.text = name ?? "";
    controllerFName.text = fatherName ?? "";
    controllerPhoneH.text = mobileNo ?? "";
    registerBloc.add(DropDownIDsEvent(genderId: genderId));
    controllerEmailO.text = email ?? "";
    DropDownModel marital = DropDownModel(
        id: maritalStatusId,
        name: getIdName(maritalStatusId!, DropType.marital));
    registerBloc.add(DropDownIDsEvent(maritalIdModel: marital));

    //Address------
    if (!presentAdd!.presentAddress.isNullOrEmpty()) {
      controllerAddress.text = presentAdd.presentAddress ?? "";
      controllerPincodeN.text = presentAdd.present_pin_code!;
      List<DropDownModel> state = [];
      dropDownData!.data!.state!.asMap().forEach((key, value) {
        state.add(DropDownModel(
          id: dropDownData!.data!.state![key].id,
          name: dropDownData!.data!.state![key].stateName,
        ));
      });
      typeAccountBloc.add(SubDropDownAccEvent(list: state, type: PARAMS.state));
      typeAccountBloc
          .add(DropDownIDsAccEvent(stateId: presentAdd!.presentStateId));
      typeAccountBloc
          .add(DropDownIDsAccEvent(distictId: presentAdd.presentDistrictId));
      typeAccountBloc.add(
          DropDownIDsAccEvent(subDistictId: presentAdd.presentSubDistrictId));
      typeAccountBloc
          .add(DropDownIDsAccEvent(villageId: presentAdd.presentVillageId));
      isNativeShow = true;
    }

    registerBloc.add(DropDownIDsEvent(manglikEffectId: manglikEff));
    registerBloc.add(DropDownIDsEvent(heightId: height));
    registerBloc.add(DropDownIDsEvent(skinToneId: skinTone));
    registerBloc.add(DropDownIDsEvent(bodyTypeId: bodyType));
  }
*/

  Widget bodyView(MatriState state) {
    return LoaderWidgetMain(
      isLoading:
          state.saveMatriProfileCallState == ApiCallState.busy || isLoading,
      child: Container(
        color: whiteColor,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    sb(3.h),
                    if (state.page == 1)
                      matriSetp1Widget(
                        state,
                      )
                    else if (state.page == 2)
                      matriStep2Widget(
                        state,
                      )
                    else if (state.page == 3)
                      matriSetp3Widget(state)
                    else if (state.page == 4)
                      matriStep4Widget(state),
                    spaceHeight(context),
                  ],
                ),
              ),
            ),

            //Bottom Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Button(
                    title: AppConstants.previous,
                    fontColor: whiteColor,
                    isDisable: state.page! > 1 ? false : true,
                    backgroundColor: clrOrange,
                    ontap: () {
                      if (state.page! >= 2) {
                        _scrollUp();
                        typeAccountBloc.add(StepPageEvent(state.page! - 1));
                      }
                    },
                  ),
                ),
                sbw(20),
                Expanded(
                  child: Button(
                    title: AppConstants.next,
                    fontColor: whiteColor,
                    backgroundColor: clrOrange,
                    ontap: () {
                      typeAccountBloc.add(
                        SaveMatriProfileValidation(
                            // requestModel: matriRequestModel(state, stateReg),
                            context: context,
                            steps: state.page),
                      );
                    },
                  ),
                ),
              ],
            ),

            sb(10)
          ],
        ),
      ),
    );
  }

/*
  MatriRequestModel matriRequestModel(
      MatriState state, RegisterState stateReg) {
    return MatriRequestModel(
      id: id,
      memberId: userDataModel!.data!.memberId,
      name: controllerName.text,
      village: state.villageId,
      state: state.stateId,
      distict: state.distictId,
      subDistict: state.subDistictId,
      profilePic: pickerModelList.isNotEmpty ? pickerModelList[0].path : "",
      vanshId: stateReg.vanshId,
      shakhaId: stateReg.shakhaId,
      subShakha: stateReg.subshakhaId!.id,
      gotraId: stateReg.gotraId,
      subGotraId: stateReg.subgotraId!.id,
      surnameId: stateReg.surnameId,
      padviId: stateReg.padviId,
      genderId: stateReg.genderId,
      maritalId: int.parse(stateReg.maritalStatus!),
      manglikEffectId: stateReg.manglikEffectId,
      heightId: stateReg.heightId,
      fatherName: controllerFName.text,
      motherName: controllerMName.text,
      phone: controllerPhoneH.text,
      emailId: controllerEmailO.text,
      address: controllerAddress.text,
      skinToneId: stateReg.skinToneId,
      bodyTypeId: stateReg.bodyTypeId,
      educationId: educationId,
      jobId: jobId,
      income: controllerAnnIncome.text,
      fatherOccId: foccupationId,
      motherOccId: moccupationId,
      aggre1: aggree1 ? "1" : "0",
      aggre2: aggree2 ? "1" : "0",
      aggre3: aggree3 ? "1" : "0",
      brotherMarried: brotherMarriedCount,
      brotherUnMarried: brotherUnMarriedCount,
      cvPdf: cvModelList.isNotEmpty ? cvModelList[0] : null,
      dadiGotraId: dadiGotraId,
      dadiName: controllerDadiName.text,
      dadiPadviId: dadiPadviId,
      dadiPlace: controllerDadiPlace.text,
      dadiShakhaId: dadiShakhaId,
      dadiSubGotraId: dadiSubGotraId!.id,
      dadiSubShakhaId: dadiSubShakhaId!.id,
      dadiSurnameId: dadiSurnameId,
      dadiVanshId: dadiVanshId,
      docPdf: documentModelList.isNotEmpty ? documentModelList[0] : null,
      motherGotraId: motherGotraId,
      motherPadviId: motherPadviId,
      motherPlace: controllerMotherPlace.text,
      motherShakhaId: motherShakhaId,
      motherSubShakhaId: motherSubShakhaId!.id,
      motherSubGotraId: motherSubGotraId!.id,
      motherSurnameId: motherSurnameId,
      motherVanshId: motherVanshId,
      naniName: controllerNaniName.text,
      naniPadviId: naniPadviId,
      naniPlace: controllerNaniPlace.text,
      naniShakhaId: naniShakhaId,
      naniSubGotraId: naniSubGotraId!.id,
      naniSubShakhaId: naniSubShakhaId!.id,
      naniSurnameId: naniSurnameId,
      naniVanshId: naniVanshId,
      naniGotraId: naniGotraId,
      otherInfo: controllerOther.text,
      patAgeF: controllerPatAgeF.text,
      patAgeT: controllerPatAgeT.text,
      patBodyTypeId: patBodyTypeId,
      patEducationId: patEduId,
      patHeightFId: controllerPatHeightF.text,
      patHeightTId: controllerPatHeightT.text,
      patIncome: controllerPatAnnIncome.text,
      patjobId: patJobId,
      patManglikEffectId: patManglikId,
      patMaritalId: patMariStatusId,
      patSkinToneId: patSkinToneId,
      sisterMarried: sisterMarriedCount,
      sisterUnMarried: sisterUnMarriedCount,
      pincode: controllerPincodeN.text,
    );
  }
*/

  //Matrimonial Step Page 1
  Widget matriSetp1Widget(MatriState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Add profile image
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  elevation: 10,
                  // backgroundColor: Colors.amber,
                  context: context,
                  builder: (ctx) => BrowseDialogue(
                    boolVideo: false,
                    value: (str) async {
                      //value!(str);
                      pop(context);
                      await pickerModesWidget(picker, pickerModelList, str);
                      setState(() {});
                    },
                  ),
                );
              },
              child: DisplayImage(
                imagePath: pickerModelList.isNotEmpty
                    ? pickerModelList[0].path
                    : StaticList.url,
                onPressed: () {},
              ),
            ),
          ],
        ),

        sb(3.h),
        const TitleWidget(AppConstants.personalInfo),
        sb(1.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "First Name",
          hintText: "Enter first name",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Middle Name",
          hintText: "Enter middle name",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Last Name",
          hintText: "Enter last name",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),

        //Gender
        CustomDropDownField(
          context: context,
          textFieldName: AppConstants.selectGender,
          list: [DropDownModel(name: "Male"), DropDownModel(name: "Female")],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.genderId != null
          //     ? DropDownModel(
          //         id: stateReg.genderId,
          //         name: getIdName(stateReg.genderId!, DropType.gender))
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(genderId: v));
            // authBloc.add(EmailEvent(controllerEmail.text.trim()));
          },
        ),
        sb(1.5.h),

        //Dob
        CustomTextField(
          context: context,
          isDropDown: true,
          textFieldName: AppConstants.dob,
          numberOfLines: 1,
          controller: TextEditingController()
            ..text = selectedDate == ""
                ? ""
                : selectedDate.toFormatDate(
                    defaultFormat: DateFormate.dateToFormatddMMMMYYYY,
                  ),
          isSuffixImage: true,
          suffixImage: Imagename.dateIcon,
          textInputAction: TextInputAction.next,
          enable: false,
          onSumitted: () {},
          onTap: () {
            bottomPicker(context, child: DatePickerView(
              (d) {
                dateTemp = d;
              },
            ), onTap: () {
              setState(() {
                selectedDate = dateTemp.toString();
              });
            });
          },
          onChange: (v) {
            // authBloc.add(EmailEvent(controllerEmail.text.trim()));
          },
        ),
        sb(1.5.h),

        //Marital Status
        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "Single"), DropDownModel(name: "Married")],
          textFieldName: AppConstants.selectMaritalStatus,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Age",
          hintText: "Enter age",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),

        //Marital Status
        CustomDropDownField(
          context: context,
          list: [
            DropDownModel(name: "4ft; 0Inch; (1.22 mts)"),
            DropDownModel(name: "5ft; 0Inch; (1.22 mts)")
          ],
          textFieldName: AppConstants.selectMaritalStatus,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Weight",
          hintText: "Enter weight",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "A++Ve"), DropDownModel(name: "A--Ve")],
          textFieldName: "Blood Group",
          isDropDownHint: "Select Blood Group",
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        //Marital Status
        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "A++Ve"), DropDownModel(name: "A--Ve")],
          textFieldName: 'Complextion',
          isDropDownHint: 'Select Complextion',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "Yes"), DropDownModel(name: "No")],
          textFieldName: 'Physical Disability ',
          isDropDownHint: 'Select Physical Disability ',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "Yes"), DropDownModel(name: "No")],
          textFieldName: 'Manglik ',
          isDropDownHint: 'Select Manglik ',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "Mesh"), DropDownModel(name: "Tula")],
          textFieldName: 'Rashi ',
          isDropDownHint: 'Select Rashi ',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "BE"), DropDownModel(name: "ME")],
          textFieldName: 'Education Type',
          isDropDownHint: 'Select Education Type',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [
            DropDownModel(name: "Architecture"),
            DropDownModel(name: "Art")
          ],
          textFieldName: 'Education Field',
          isDropDownHint: 'Select Education Field',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "Private"), DropDownModel(name: "Gov.")],
          textFieldName: 'Working With',
          isDropDownHint: 'Select Working With',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [DropDownModel(name: "Actor"), DropDownModel(name: "Admin")],
          textFieldName: 'Working As',
          isDropDownHint: 'Select Working As',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Birth Place",
          hintText: "Enter Birth Place",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),

        CustomTextField(
          context: context,
          isDropDown: true,
          textFieldName: AppConstants.dob,
          numberOfLines: 1,
          controller: TextEditingController()
            ..text = selectedDate == ""
                ? ""
                : selectedDate.toFormatDate(
                    defaultFormat: DateFormate.dateToFormatddMMMMYYYY,
                  ),
          isSuffixImage: true,
          suffixImage: Imagename.dateIcon,
          textInputAction: TextInputAction.next,
          enable: false,
          onSumitted: () {},
          onTap: () {
            bottomPicker(context, child: DatePickerView(
              (d) {
                dateTemp = d;
              },
            ), onTap: () {
              setState(() {
                selectedDate = dateTemp.toString();
              });
            });
          },
          onChange: (v) {
            // authBloc.add(EmailEvent(controllerEmail.text.trim()));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [
            DropDownModel(name: "English"),
            DropDownModel(name: "Gujarati")
          ],
          textFieldName: 'Mother Tongue',
          isDropDownHint: 'Select Mother Tongue',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [
            DropDownModel(name: "Ahmedabad"),
            DropDownModel(name: "Bhavnagar")
          ],
          textFieldName: 'Location',
          isDropDownHint: 'Select Location',
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),
      ],
    );
  }

  Widget matriStep2Widget(MatriState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget("Family Details"),
        sb(1.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Sub Community",
          isDropDownHint: "Select Sub Community",
          list: [
            DropDownModel(name: "Digamber"),
            DropDownModel(name: "Terapathi")
          ],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: educationId != null
          //     ? DropDownModel(
          //         id: educationId,
          //         name: getIdName(
          //           educationId!,
          //           DropType.education,
          //         ),
          //       )
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Father Status",
          isDropDownHint: "Select Father Status",
          list: [DropDownModel(name: "Business"), DropDownModel(name: "Job")],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: educationId != null
          //     ? DropDownModel(
          //         id: educationId,
          //         name: getIdName(
          //           educationId!,
          //           DropType.education,
          //         ),
          //       )
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Mother Status",
          isDropDownHint: "Select Mother Status",
          list: [DropDownModel(name: "Business"), DropDownModel(name: "Job")],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: educationId != null
          //     ? DropDownModel(
          //         id: educationId,
          //         name: getIdName(
          //           educationId!,
          //           DropType.education,
          //         ),
          //       )
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "No. Of Brother",
          hintText: "Enter No. Of Brother",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "No. Of Brother Married",
          hintText: "Enter No. Of Brother Married",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "No. Of Sister",
          hintText: "Enter No. Of Sister",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "No. Of Sister Married",
          hintText: "Enter No. Of Sister Married",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "Native Place",
          hintText: "Enter Native Place",
          numberOfLines: 1,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "Other Detail",
          hintText: "Enter Other Detail",
          numberOfLines: 2,
          controller: controllerName,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        sb(3.h),
      ],
    );
  }

  Widget matriSetp3Widget(
    MatriState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget("Expected Matching Details"),
        sb(1.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Gender",
          isDropDownHint: "Select Gender",
          list: [DropDownModel(name: "Male"), DropDownModel(name: "Female")],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: educationId != null
          //     ? DropDownModel(
          //         id: educationId,
          //         name: getIdName(
          //           educationId!,
          //           DropType.education,
          //         ),
          //       )
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Mother Tongue",
          isDropDownHint: "Select Mother Tongue",
          list: [
            DropDownModel(name: "English"),
            DropDownModel(name: "Gujarati")
          ],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: educationId != null
          //     ? DropDownModel(
          //         id: educationId,
          //         name: getIdName(
          //           educationId!,
          //           DropType.education,
          //         ),
          //       )
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Location",
          isDropDownHint: "Select Location",
          list: [
            DropDownModel(name: "India"),
            DropDownModel(name: "Bhavnagar")
          ],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: educationId != null
          //     ? DropDownModel(
          //         id: educationId,
          //         name: getIdName(
          //           educationId!,
          //           DropType.education,
          //         ),
          //       )
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Education Type",
          isDropDownHint: "Select Education Type",
          list: [DropDownModel(name: "B.Com"), DropDownModel(name: "M.Com")],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: educationId != null
          //     ? DropDownModel(
          //         id: educationId,
          //         name: getIdName(
          //           educationId!,
          //           DropType.education,
          //         ),
          //       )
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Education Field",
          isDropDownHint: "Select Education Field",
          list: [DropDownModel(name: "IT"), DropDownModel(name: "Actor")],
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          // selectedItem: educationId != null
          //     ? DropDownModel(
          //         id: educationId,
          //         name: getIdName(
          //           educationId!,
          //           DropType.education,
          //         ),
          //       )
          //     : null,
          onTap: () {},
          onChangeInt: (v) {
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
      ],
    );
  }

  Widget matriStep4Widget(MatriState state) {
    return Column(
      children: [
        const TitleWidget(AppConstants.myDocument),
        sb(1.h),

        //Upload CV
        TitleChildWidget(
          title: "Photos",
          child: Container(
            decoration: myinputborder(),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 11,
                    ),
                    child: TitleTextView(
                      cvModelList.isNotEmpty
                          ? cvModelList[0].name
                          : "No file chosen",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Button(
                    title: AppConstants.upload,
                    // height: 30,
                    backgroundColor: clrApp,
                    fontColor: whiteColor,
                    ontap: () async {
                      await pickeFileWidget(cvModelList, TAG.document);
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        sb(3.5.h),

        TitleTextView(
          "Please fill the following details by head of the family member.",
          fontFamily: FontName.nunitoSansBold,
        ),
        //Send profile Accept
        termWidget(
          "I agreed on terms & conditions and declared that I've shared correct information.",
          aggree1,
          (v) {
            aggree1 = !aggree1;
            setState(() {});
          },
        ),
      ],
    );
  }

  void initList() {
    /*
    final model = dropDownData!.data!;

    //Education
    model.education!.asMap().forEach((key, value) {
      educationList.add(DropDownModel(
          id: model.education![key].id!,
          name: model.education![key].educationName));
    });

    //Job
    model.jobs!.asMap().forEach((key, value) {
      jobList.add(DropDownModel(
          id: model.jobs![key].id!, name: model.jobs![key].jobName));
    });

    //Occupation
    model.occupations!.asMap().forEach((key, value) {
      occupationList.add(DropDownModel(
          id: model.occupations![key].id!,
          name: model.occupations![key].occupationsName));
    });

    //countList
    for (int i = 0; i <= 10; i++) {
      countList.add(
        DropDownModel(
          id: i,
          name: i.toString(),
        ),
      );
    }*/

    setState(() {});
  }

  //Clear DropDown Native address
  clearNativeAdd(MatriState state) {
    if (state.subDistictId != null) {
      typeAccountBloc.add(DropDownIDsAccEvent(subDistictId: null));
      subDistictNKey.currentState!.clear();
    }
    if (state.distictId != null) {
      typeAccountBloc.add(DropDownIDsAccEvent(distictId: null));
      distictNKey.currentState!.clear();
    }
    if (state.villageId != null) {
      typeAccountBloc.add(DropDownIDsAccEvent(villageId: null));
      villageNKey.currentState!.clear();
    }
    if (state.stateId != null) {
      typeAccountBloc.add(DropDownIDsAccEvent(stateId: null));
      stateNKey.currentState!.clear();
    }
  }
}
