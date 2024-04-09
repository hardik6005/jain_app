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
import 'package:jain_app/screens/matrimonial/model/matri_list_model.dart';
import 'package:jain_app/screens/matrimonial/model/request_model.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMatrimonialScreen extends StatefulWidget {
  MemberList? member;

  AddMatrimonialScreen({Key? key, this.member}) : super(key: key);

  @override
  State<AddMatrimonialScreen> createState() => _AddMatrimonialScreenState();
}

class _AddMatrimonialScreenState extends State<AddMatrimonialScreen> {
  TextEditingController controllerFName = TextEditingController();
  TextEditingController controllerLName = TextEditingController();
  TextEditingController controllerMName = TextEditingController();
  TextEditingController controllerAge = TextEditingController();
  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerBirthPlace = TextEditingController();
  TextEditingController controllerNoBrother = TextEditingController();
  TextEditingController controllerNoBroMar = TextEditingController();
  TextEditingController controllerNoSis = TextEditingController();
  TextEditingController controllerNoSisMar = TextEditingController();
  TextEditingController controllerNatPlace = TextEditingController();
  TextEditingController controllerOtherDet = TextEditingController();

  String gender = "";
  List<DropDownModel> maritalDD = [];
  String marital = "";
  List<DropDownModel> heightDD = [];
  String height = "";
  List<DropDownModel> bloodDD = [];
  String blood = "";
  List<DropDownModel> complextionDD = [];
  String complextion = "";
  String phyDisa = "";
  String manglik = "";
  List<DropDownModel> rashiDD = [];
  String rashi = "";
  List<DropDownModel> eduTypeDD = [];
  String eduType = "";
  List<DropDownModel> eduFieldDD = [];
  String eduField = "";
  List<DropDownModel> workWithDD = [];
  String workWith = "";
  List<DropDownModel> workAsDD = [];
  String workAs = "";
  List<DropDownModel> locationDD = [];
  String location = "";
  List<DropDownModel> subCommDD = [];
  String subComm = "";
  List<DropDownModel> fatherStatusDD = [];
  String fatherStatus = "";
  List<DropDownModel> motherStatusDD = [];
  String motherStatus = "";
  List<DropDownModel> motherToungDD = [];
  String motherToung = "";
  List<DropDownModel> motherToungMatchDD = [];
  String motherToungMatch = "";
  List<DropDownModel> locationMatchDD = [];
  String locationMatch = "";
  List<DropDownModel> eduTypeMatchDD = [];
  String eduTypeMatch = "";
  List<DropDownModel> eduFieldMatchDD = [];
  String eduFieldMatch = "";
  String genderMatch = "";

  TimeOfDay? _selectedTime;
  bool passHide = true;

  bool aggree1 = false;

  //Date picker variable
  DateTime dateFeedback = DateTime.now();
  DateTime dateTempFeedback = DateTime.now();
  String selectedDOB = "";

  //New image picker variables
  ImagePicker picker = ImagePicker();
  List<PickerModel> profileImgModelList = [];
  List<PickerModel> cvModelList = [];

  late ScrollController controller;

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
    initList();

    maritalDD = getDropDown("maritalStatusDropDown");
    eduFieldMatchDD = getDropDown("educationFieldDropdown");
    eduTypeMatchDD = getDropDown("educationTypeDropdown");
    locationMatchDD = getDropDown("cities");
    motherToungMatchDD = getDropDown("motherTongueDropDown");
    motherToungDD = getDropDown("motherTongueDropDown");
    motherStatusDD = getDropDown("motherStatusDropDown");
    fatherStatusDD = getDropDown("fatherStatusDropDown");
    subCommDD = getDropDown("subCommunity");
    locationDD = getDropDown("cities");
    workAsDD = getDropDown("workingAsDropDown");
    workWithDD = getDropDown("workingWithDropdown");
    eduFieldDD = getDropDown("educationFieldDropdown");
    eduTypeDD = getDropDown("educationTypeDropdown");
    rashiDD = getDropDown("rashiDropDown");
    complextionDD = getDropDown("complextionDropDown");
    bloodDD = getDropDown("matrimonialbloodGroupDropDown");
    heightDD = getDropDown("heightDropDown");

    if (widget.member != null) {
      final mem = widget.member;

      controllerFName.text = mem!.firstName ?? "";
      controllerLName.text = mem.lastName ?? "";
      controllerMName.text = mem.middleName ?? "";
      controllerAge.text = mem.age ?? "";
      controllerWeight.text = mem.weight.toString();
      controllerBirthPlace.text = mem.birthPlace ?? "";
      controllerNoBrother.text = mem.noBrother.toString();
      controllerNoBroMar.text = mem.brotherMarried.toString();
      controllerNoSis.text = mem.noSister.toString();
      controllerNoSisMar.text = mem.sisterMarried.toString();
      controllerNatPlace.text = mem.nativePlace ?? "";
      controllerOtherDet.text = mem.otherDetail ?? "";
      gender = mem.gender ?? "";
      marital = mem.maritalStatus ?? "";
      height = mem.height ?? "";
      blood = mem.bloodGroup ?? "";
      complextion = mem.complextion ?? "";
      phyDisa = mem.physicalDisability ?? "";
      manglik = mem.manglik ?? "";
      rashi = mem.rashi ?? "";
      eduType = mem.educationType ?? "";
      eduField = mem.educationField ?? "";
      workWith = mem.workingWith ?? "";
      workAs = mem.workingAs ?? "";
      location = mem.cityId.toString();
      subComm = mem.subCommunity ?? "";
      fatherStatus = mem.fatherStatus ?? "";
      motherStatus = mem.motherStatus ?? "";
      motherToung = mem.motherTongue ?? "";
      motherToungMatch = mem.expectedMotherTongue ?? "";
      locationMatch = mem.expectedCityId.toString();
      eduTypeMatch = mem.expectedEducationType ?? "";
      eduFieldMatch = mem.expectedEducationField ?? "";
      genderMatch = mem.expectedGender ?? "";
      selectedDOB = mem.dob ?? "";
      // aggree1 = mem. ?? "";

      // TimeOfDay time = parseTimeString(mem.birthTime!);

      // DateTime date= DateFormat.jm().parse(mem.birthTime!);
      DateTime date2= DateFormat("hh:mma").parse("6:45PM"); // think this will work better for you
// format date
//       print(DateFormat("HH:mm").format(date));
//       print(DateFormat("HH:mm").format(date2));
      _selectedTime = TimeOfDay(hour: date2.hour, minute: date2.minute);
      profileImgModelList
          .add(PickerModel("", mem.photographUrl!, mem.photographUrl!, ""));
      if (mem.photosUrl != null && mem.photosUrl!.isNotEmpty) {
        cvModelList
            .add(PickerModel("", mem.photosUrl![0], mem.photosUrl![0], ""));
      }
    }
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
        if (state.matriCallState == ApiCallState.success) {
          okAlert(
              GlobalVariable.navState.currentContext!,
              isDismiss: false,
              (widget.member != null)
                  ? "Profile updated successfully!"
                  : "Matrimonial detail submitted successfully.", onTap: () {
            pop(context, data: "true");
          });
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
      isLoading: state.saveMatriProfileCallState == ApiCallState.busy,
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
                    isLoading: state.matriCallState == ApiCallState.busy,
                    backgroundColor: clrOrange,
                    ontap: () {
                      // if (state.page == 4) {
                      //   typeAccountBloc.add(
                      //     SaveMatriProfileAPI(
                      //       context: context,
                      //       requestModel: MatriRequestModel(
                      //         id: widget.member != null
                      //             ? widget.member!.id.toString()
                      //             : null,
                      //         location: location,
                      //         gender: gender,
                      //         Age: controllerAge.text,
                      //         aggree: aggree1 ? "1" : "0",
                      //         BirthPlace: controllerBirthPlace.text,
                      //         blood: blood,
                      //         complextion: complextion,
                      //         eduField: eduField,
                      //         eduFieldMatch: eduFieldMatch,
                      //         eduType: eduType,
                      //         eduTypeMatch: eduTypeMatch,
                      //         fatherStatus: fatherStatus,
                      //         FName: controllerFName.text,
                      //         genderMatch: genderMatch,
                      //         height: height,
                      //         LName: controllerLName.text,
                      //         locationMatch: locationMatch,
                      //         manglik: manglik,
                      //         marital: marital,
                      //         MName: controllerMName.text,
                      //         motherStatus: motherStatus,
                      //         motherToung: motherToung,
                      //         motherToungMatch: motherToungMatch,
                      //         NatPlace: controllerNatPlace.text,
                      //         NoBroMar: controllerNoBroMar.text,
                      //         NoBrother: controllerNoBrother.text,
                      //         NoSis: controllerNoSis.text,
                      //         NoSisMar: controllerNoSisMar.text,
                      //         OtherDet: controllerOtherDet.text,
                      //         otherPic: cvModelList.isNotEmpty
                      //             ? cvModelList[0].path
                      //             : "",
                      //         profilePic: profileImgModelList.isNotEmpty
                      //             ? profileImgModelList[0].path
                      //             : "",
                      //         phyDisa: phyDisa,
                      //         rashi: rashi,
                      //         selectedBTime: _selectedTime.toString(),
                      //         selectedDOB: selectedDOB,
                      //         subComm: subComm,
                      //         Weight: controllerWeight.text,
                      //         workAs: workAs,
                      //         workWith: workWith,
                      //       ),
                      //     ),
                      //   );
                      // } else {
                      typeAccountBloc.add(
                        SaveMatriProfileValidation(
                            // requestModel: matriRequestModel(state, stateReg),
                            context: context,
                            steps: state.page,
                            requestModel: MatriRequestModel(
                              id: widget.member != null
                                  ? widget.member!.id.toString()
                                  : null,
                              location: location,
                              gender: gender,
                              Age: controllerAge.text,
                              aggree: aggree1 ? "1" : "0",
                              BirthPlace: controllerBirthPlace.text,
                              blood: blood,
                              complextion: complextion,
                              eduField: eduField,
                              eduFieldMatch: eduFieldMatch,
                              eduType: eduType,
                              eduTypeMatch: eduTypeMatch,
                              fatherStatus: fatherStatus,
                              FName: controllerFName.text,
                              genderMatch: genderMatch,
                              height: height,
                              LName: controllerLName.text,
                              locationMatch: locationMatch,
                              manglik: manglik,
                              marital: marital,
                              MName: controllerMName.text,
                              motherStatus: motherStatus,
                              motherToung: motherToung,
                              motherToungMatch: motherToungMatch,
                              NatPlace: controllerNatPlace.text,
                              NoBroMar: controllerNoBroMar.text,
                              NoBrother: controllerNoBrother.text,
                              NoSis: controllerNoSis.text,
                              NoSisMar: controllerNoSisMar.text,
                              OtherDet: controllerOtherDet.text,
                              otherPic: cvModelList.isNotEmpty
                                  ? cvModelList[0].path
                                  : "",
                              profilePic: profileImgModelList.isNotEmpty
                                  ? profileImgModelList[0].path
                                  : "",
                              phyDisa: phyDisa,
                              rashi: rashi,
                              selectedBTime: _selectedTime.toString(),
                              selectedDOB: selectedDOB,
                              subComm: subComm,
                              Weight: controllerWeight.text,
                              workAs: workAs,
                              workWith: workWith,
                            )),
                      );
                      // }
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
                      await pickerModesWidget(picker, profileImgModelList, str);
                      setState(() {});
                    },
                  ),
                );
              },
              child: DisplayImage(
                imagePath: profileImgModelList.isNotEmpty
                    ? profileImgModelList[0].path
                    : StaticList.url,
                onPressed: () {},
                isValidate: state.fistValidate,
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
          textFieldName: "First Name" + "*",
          hintText: "Enter first name",
          isValidate: state.fistValidate,
          numberOfLines: 1,
          controller: controllerFName,
          textInputAction: TextInputAction.next,
          onChange: (v) {
            setState(() {});
          },
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Middle Name" + "*",
          isValidate: state.fistValidate,
          hintText: "Enter middle name",
          numberOfLines: 1,
          controller: controllerMName,
          textInputAction: TextInputAction.next,
          onChange: (v) {
            setState(() {});
          },
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Last Name" + "*",
          isValidate: state.fistValidate,
          hintText: "Enter last name",
          numberOfLines: 1,
          controller: controllerLName,
          textInputAction: TextInputAction.next,
          onChange: (v) {
            setState(() {});
          },
        ),
        sb(1.5.h),

        //Gender
        CustomDropDownField(
          context: context,
          textFieldName: AppConstants.selectGender + "*",
          list: [
            DropDownModel(name: "Male", id: "Male"),
            DropDownModel(name: "Female", id: "Female")
          ],
          isSuffixImage: true,
          isValidate: state.fistValidate,
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
        sb(1.5.h),

        //Dob
        CustomTextField(
          context: context,
          isDropDown: true,
          textFieldName: AppConstants.dob + "*",
          isValidate: state.fistValidate,
          numberOfLines: 1,
          controller: TextEditingController()
            ..text = selectedDOB == ""
                ? ""
                : selectedDOB.toFormatDate(
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
                selectedDOB = dateTemp.toString();
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
          list: maritalDD,
          textFieldName: AppConstants.selectMaritalStatus + "*",
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: marital.isNotEmpty
              ? DropDownModel(id: marital, name: marital)
              : null,
          onChangeInt: (v) {
            marital = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Age" + "*",
          hintText: "Enter age",
          isValidate: state.fistValidate,
          numberOfLines: 1,
          controller: controllerAge,
          textInputAction: TextInputAction.next,
          keboardType: TextInputType.phone,
          maxLenght: 2,
          onChange: (v) {
            setState(() {});
          },
        ),
        sb(1.5.h),

        //Marital Status
        CustomDropDownField(
          context: context,
          list: heightDD,
          textFieldName: AppConstants.height + "*",
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: height.isNotEmpty
              ? DropDownModel(id: height, name: height)
              : null,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            height = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Weight" + "*",
          hintText: "Enter weight",
          isValidate: state.fistValidate,
          numberOfLines: 1,
          controller: controllerWeight,
          textInputAction: TextInputAction.next,
          keboardType: TextInputType.phone,
          maxLenght: 3,
          onChange: (v) {
            setState(() {});
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: bloodDD,
          textFieldName: "Blood Group" + "*",
          isDropDownHint: "Select Blood Group",
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem:
              blood.isNotEmpty ? DropDownModel(id: blood, name: blood) : null,
          onChangeInt: (v) {
            blood = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        //Marital Status
        CustomDropDownField(
          context: context,
          list: complextionDD,
          textFieldName: 'Complextion' + "*",
          isDropDownHint: 'Select Complextion',
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: complextion.isNotEmpty
              ? DropDownModel(id: complextion, name: complextion)
              : null,
          // selectedItem: stateReg.maritalIdModel,
          onChangeInt: (v) {
            complextion = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [
            DropDownModel(name: "Yes", id: "Yes"),
            DropDownModel(name: "No", id: "No")
          ],
          textFieldName: 'Physical Disability' + "*",
          isDropDownHint: 'Select Physical Disability ',
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: phyDisa.isNotEmpty
              ? DropDownModel(id: phyDisa, name: phyDisa)
              : null,
          onChangeInt: (v) {
            phyDisa = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: [
            DropDownModel(name: "Yes", id: "Yes"),
            DropDownModel(name: "No", id: "No")
          ],
          textFieldName: 'Manglik' + "*",
          isDropDownHint: 'Select Manglik ',
          isSuffixImage: true,
          isValidate: state.fistValidate,
          suffixImage: Imagename.downArrow,
          selectedItem: manglik.isNotEmpty
              ? DropDownModel(id: manglik, name: manglik)
              : null,
          onChangeInt: (v) {
            manglik = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: rashiDD,
          textFieldName: 'Rashi' + "*",
          isDropDownHint: 'Select Rashi ',
          isSuffixImage: true,
          isValidate: state.fistValidate,
          suffixImage: Imagename.downArrow,
          selectedItem:
              rashi.isNotEmpty ? DropDownModel(id: rashi, name: rashi) : null,
          onChangeInt: (v) {
            rashi = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: eduTypeDD,
          textFieldName: 'Education Type' + "*",
          isDropDownHint: 'Select Education Type',
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: eduType.isNotEmpty
              ? DropDownModel(id: eduType, name: eduType)
              : null,
          onChangeInt: (v) {
            eduType = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: eduFieldDD,
          textFieldName: 'Education Field' + "*",
          isDropDownHint: 'Select Education Field',
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: eduField.isNotEmpty
              ? DropDownModel(id: eduField, name: eduField)
              : null,
          onChangeInt: (v) {
            eduField = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: workWithDD,
          textFieldName: 'Working With' + "*",
          isDropDownHint: 'Select Working With',
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: workWith.isNotEmpty
              ? DropDownModel(id: workWith, name: workWith)
              : null,
          onChangeInt: (v) {
            workWith = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: workAsDD,
          textFieldName: 'Working As' + "*",
          isDropDownHint: 'Select Working As',
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: workAs.isNotEmpty
              ? DropDownModel(id: workAs, name: workAs)
              : null,
          onChangeInt: (v) {
            workAs = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        //Name
        CustomTextField(
          context: context,
          textFieldName: "Birth Place" + "*",
          isValidate: state.fistValidate,
          hintText: "Enter Birth Place",
          numberOfLines: 1,
          controller: controllerBirthPlace,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),

        CustomTextField(
          context: context,
          isDropDown: true,
          textFieldName: "Birth Time" + "*",
          isValidate: state.fistValidate,
          numberOfLines: 1,
          controller: TextEditingController()
            ..text =
                _selectedTime == null ? "" : _selectedTime!.format(context),
          isSuffixImage: true,
          suffixImage: Imagename.dateIcon,
          textInputAction: TextInputAction.next,
          enable: false,
          onSumitted: () {},
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: _selectedTime ?? TimeOfDay.now(),
            );
            if (picked != null && picked != _selectedTime) {
              setState(() {
                _selectedTime = picked;
              });
            }
          },
          onChange: (v) {
            // authBloc.add(EmailEvent(controllerEmail.text.trim()));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: motherToungDD,
          textFieldName: 'Mother Tongue' + "*",
          isDropDownHint: 'Select Mother Tongue',
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: motherToung.isNotEmpty
              ? DropDownModel(id: motherToung, name: motherToung)
              : null,
          onChangeInt: (v) {
            motherToung = v;
            setState(() {});
            // registerBloc.add(DropDownIDsEvent(maritalId: v));
          },
        ),
        sb(1.5.h),

        CustomDropDownField(
          context: context,
          list: locationDD,
          textFieldName: 'Location*',
          isDropDownHint: 'Select Location',
          isValidate: state.fistValidate,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: location.isNotEmpty
              ? DropDownModel(
                  id: location, name: dropDownName("cities", location))
              : null,
          onChangeInt: (v) {
            location = v;
            setState(() {});
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
          textFieldName: "Sub Community" + "*",
          isDropDownHint: "Select Sub Community",
          isValidate: state.secondValidate,
          list: subCommDD,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: subComm.isNotEmpty
              ? DropDownModel(id: subComm, name: subComm)
              : null,
          onTap: () {},
          onChangeInt: (v) {
            subComm = v;
            setState(() {});
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Father Status" + "*",
          isDropDownHint: "Select Father Status",
          isValidate: state.secondValidate,
          list: fatherStatusDD,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: fatherStatus.isNotEmpty
              ? DropDownModel(id: fatherStatus, name: fatherStatus)
              : null,
          onTap: () {},
          onChangeInt: (v) {
            fatherStatus = v;
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Mother Status" + "*",
          isDropDownHint: "Select Mother Status",
          isValidate: state.secondValidate,
          list: motherStatusDD,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: motherStatus.isNotEmpty
              ? DropDownModel(id: motherStatus, name: motherStatus)
              : null,
          onTap: () {},
          onChangeInt: (v) {
            motherStatus = v;
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
          controller: controllerNoBrother,
          textInputAction: TextInputAction.next,
          keboardType: TextInputType.phone,
          maxLenght: 2,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "No. Of Brother Married",
          hintText: "Enter No. Of Brother Married",
          numberOfLines: 1,
          controller: controllerNoBroMar,
          textInputAction: TextInputAction.next,
          keboardType: TextInputType.phone,
          maxLenght: 2,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "No. Of Sister",
          hintText: "Enter No. Of Sister",
          numberOfLines: 1,
          controller: controllerNoSis,
          keboardType: TextInputType.phone,
          maxLenght: 2,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "No. Of Sister Married",
          hintText: "Enter No. Of Sister Married",
          numberOfLines: 1,
          controller: controllerNoSisMar,
          keboardType: TextInputType.phone,
          maxLenght: 2,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "Native Place",
          hintText: "Enter Native Place",
          numberOfLines: 1,
          controller: controllerNatPlace,
          textInputAction: TextInputAction.next,
          onChange: (v) {},
        ),
        sb(1.5.h),
        CustomTextField(
          context: context,
          textFieldName: "Other Detail",
          hintText: "Enter Other Detail",
          numberOfLines: 2,
          controller: controllerOtherDet,
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
          list: [
            DropDownModel(name: "Male", id: "Male"),
            DropDownModel(name: "Female", id: "Female")
          ],
          isSuffixImage: true,
          selectedItem: genderMatch.isNotEmpty
              ? DropDownModel(id: genderMatch, name: genderMatch)
              : null,
          suffixImage: Imagename.downArrow,
          onTap: () {},
          onChangeInt: (v) {
            genderMatch = v;
            setState(() {});
            // educationId = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Mother Tongue",
          isDropDownHint: "Select Mother Tongue",
          list: motherToungMatchDD,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: motherToungMatch.isNotEmpty
              ? DropDownModel(id: motherToungMatch, name: motherToungMatch)
              : null,
          onTap: () {},
          onChangeInt: (v) {
            motherToungMatch = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Location",
          isDropDownHint: "Select Location",
          list: locationMatchDD,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: locationMatch.isNotEmpty
              ? DropDownModel(
                  id: locationMatch,
                  name: dropDownName("cities", locationMatch))
              : null,
          onTap: () {},
          onChangeInt: (v) {
            locationMatch = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Education Type",
          isDropDownHint: "Select Education Type",
          list: eduTypeMatchDD,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: eduTypeMatch.isNotEmpty
              ? DropDownModel(id: eduTypeMatch, name: eduTypeMatch)
              : null,
          onTap: () {},
          onChangeInt: (v) {
            eduTypeMatch = v;
            setState(() {});
          },
        ),
        sb(1.5.h),
        CustomDropDownField(
          context: context,
          textFieldName: "Education Field",
          isDropDownHint: "Select Education Field",
          list: eduFieldMatchDD,
          isSuffixImage: true,
          suffixImage: Imagename.downArrow,
          selectedItem: eduFieldMatch.isNotEmpty
              ? DropDownModel(id: eduFieldMatch, name: eduFieldMatch)
              : null,
          onTap: () {},
          onChangeInt: (v) {
            eduFieldMatch = v;
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
          title: "Photos" + "*",
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(
                  color: (state.fourthValidate!)
                      ? clrAppLight5
                      : (cvModelList.isEmpty)
                          ? redColor
                          : clrAppLight5,
                  width: 1),
              color: clrAppLight5,
            ),
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
                      // await pickeFileWidget(cvModelList, TAG.gallery);

                      showModalBottomSheet(
                        elevation: 10,
                        // backgroundColor: Colors.amber,
                        context: context,
                        builder: (ctx) => BrowseDialogue(
                          boolVideo: false,
                          value: (str) async {
                            //value!(str);
                            pop(context);
                            await pickerModesWidget(picker, cvModelList, str);
                            setState(() {});
                          },
                        ),
                      );
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
          (state.fourthValidate!)
              ? Colors.black
              : (aggree1 == false)
                  ? redColor
                  : Colors.black,
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
}
