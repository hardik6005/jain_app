part of 'matri_bloc.dart';

class MatriState {
  final ApiCallState? saveProfileCallState;
  final ApiCallState? searchMatriPrefeCallState;

  final ApiCallState? saveMatriProfileCallState;
  final ApiCallState? socialProfileCallState;
  final ApiCallState? searchMatriListCallState;

  final ApiCallState? matriCallState;
  final int? page;
  final bool? hasNextPage;
  final bool? isLoadMoreRunning;
  final bool? isFav;
  final String? gender;
  final String? maritalStatus;
  late final bool? validBusiEmail;
  late final bool? validBusiPhone;
  late final bool? validMatroEmail;
  late final bool? validMatroPhone;

  //Addresss
  final bool? sameAsNative;
  final bool? sameAsPermanant;
  final bool? sameAsNative1;

  final String? successMsg;

  // final SocialProfileDataModel? socialProfileDataModel;
  // final BusinessProfileAddModel? businessProfileAddModel;
  List<DropDownModel>? stateList;
  List<DropDownModel>? distictList;
  List<DropDownModel>? subDistictList;
  List<DropDownModel>? villageList;
  String? stateId;
  String? distictId;
  String? subDistictId;
  String? villageId;
  final bool? isValidate;

  final bool? fistValidate;
  final bool? secondValidate;
  final bool? fourthValidate;
  final MemberPreferenceModel? memberPreferenceModel;
  final MatchProfileListModel? matchProfileListModel;

  MatriState({
    this.saveProfileCallState = ApiCallState.none,
    this.searchMatriPrefeCallState = ApiCallState.none,
    this.saveMatriProfileCallState = ApiCallState.none,
    this.socialProfileCallState = ApiCallState.none,
    this.searchMatriListCallState = ApiCallState.none,
    this.matriCallState = ApiCallState.none,
    this.page = 1,
    this.hasNextPage = true,
    this.isLoadMoreRunning = false,
    this.isFav = false,
    this.gender = "",
    this.maritalStatus = "",
    this.sameAsNative = false,
    this.sameAsPermanant = false,
    this.sameAsNative1 = false,
    this.validBusiEmail = false,
    this.validBusiPhone = false,
    this.validMatroEmail = false,
    this.validMatroPhone = false,
    this.successMsg,
    // this.socialProfileDataModel,
    // this.businessProfileAddModel,
    this.stateList,
    this.distictList,
    this.subDistictList,
    this.villageList,
    this.stateId,
    this.distictId,
    this.subDistictId,
    this.villageId,
    this.isValidate = false,
    this.fistValidate = true,
    this.secondValidate = true,
    this.fourthValidate = true,
    this.memberPreferenceModel,
    this.matchProfileListModel,
  });

  List<Object> get props => [
        saveProfileCallState!,
        searchMatriPrefeCallState!,
        saveMatriProfileCallState!,
        socialProfileCallState!,
        searchMatriListCallState!,
        matriCallState!,
        page!,
        hasNextPage!,
        isLoadMoreRunning!,
        isFav!,
        gender!,
        maritalStatus!,
        sameAsNative!,
        sameAsPermanant!,
        sameAsNative1!,
        validBusiEmail!,
        validBusiPhone!,
        validMatroPhone!,
        validMatroEmail!,
        successMsg!,
        // socialProfileDataModel!,
        // businessProfileAddModel!,
        stateList!,
        distictList!,
        subDistictList!,
        villageList!,
        stateId!,
        distictId!,
        subDistictId!,
        villageId!,
        isValidate!,
        fistValidate!,
        secondValidate!,
        fourthValidate!,
    memberPreferenceModel!,
    matchProfileListModel!,
      ];

  MatriState copyWith({
    ApiCallState? saveProfileCallState,
    ApiCallState? searchMatriPrefeCallState,
    ApiCallState? saveMatriProfileCallState,
    ApiCallState? socialProfileCallState,
    ApiCallState? searchMatriListCallState,
    ApiCallState? matriCallState,
    int? page,
    bool? hasNextPage,
    bool? isLoadMoreRunning,
    bool? isFav,
    String? gender,
    String? maritalStatus,
    bool? validBusiEmail,
    bool? validBusiPhone,
    //Addresss
    bool? sameAsNative,
    bool? sameAsPermanant,
    bool? sameAsNative1,
    bool? validMatroEmail,
    bool? validMatroPhone,
    String? successMsg,
    // SocialProfileDataModel? socialProfileDataModel,
    // BusinessProfileAddModel? businessProfileAddModel,
    List<DropDownModel>? stateList,
    List<DropDownModel>? distictList,
    List<DropDownModel>? subDistictList,
    List<DropDownModel>? villageList,
    String? stateId,
    String? distictId,
    String? subDistictId,
    String? villageId,
    bool? isValidate,
    bool? fistValidate,
    bool? secondValidate,
    bool? fourthValidate,
    MemberPreferenceModel? memberPreferenceModel,
    MatchProfileListModel? matchProfileListModel,
  }) {
    return MatriState(
      matchProfileListModel: matchProfileListModel ?? this.matchProfileListModel,
      memberPreferenceModel: memberPreferenceModel ?? this.memberPreferenceModel,
      fistValidate: fistValidate ?? this.fistValidate,
      secondValidate: secondValidate ?? this.secondValidate,
      fourthValidate: fourthValidate ?? this.fourthValidate,
      saveProfileCallState: saveProfileCallState ?? this.saveProfileCallState,
      searchMatriListCallState:
          searchMatriListCallState ?? this.searchMatriListCallState,
      searchMatriPrefeCallState:
          searchMatriPrefeCallState ?? this.searchMatriPrefeCallState,
      saveMatriProfileCallState:
          saveMatriProfileCallState ?? this.saveMatriProfileCallState,
      page: page ?? this.page,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoadMoreRunning: isLoadMoreRunning ?? this.isLoadMoreRunning,
      isFav: isFav ?? this.isFav,
      gender: gender ?? this.gender,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      sameAsNative: sameAsNative ?? this.sameAsNative,
      sameAsPermanant: sameAsPermanant ?? this.sameAsPermanant,
      sameAsNative1: sameAsNative1 ?? this.sameAsNative1,
      validBusiEmail: validBusiEmail ?? this.validBusiEmail,
      validBusiPhone: validBusiPhone ?? this.validBusiPhone,
      validMatroPhone: validMatroPhone ?? this.validMatroPhone,
      validMatroEmail: validMatroEmail ?? this.validMatroEmail,
      socialProfileCallState:
          socialProfileCallState ?? this.socialProfileCallState,
      successMsg: successMsg ?? this.successMsg,
      // socialProfileDataModel:
      //     socialProfileDataModel ?? this.socialProfileDataModel,
      // businessProfileAddModel:
      //     businessProfileAddModel ?? this.businessProfileAddModel,
      stateList: stateList ?? this.stateList,
      distictList: distictList ?? this.distictList,
      subDistictList: subDistictList ?? this.subDistictList,
      villageList: villageList ?? this.villageList,
      stateId: stateId ?? this.stateId,
      distictId: distictId ?? this.distictId,
      subDistictId: subDistictId ?? this.subDistictId,
      villageId: villageId ?? this.villageId,
      matriCallState: matriCallState ?? this.matriCallState,
      isValidate: isValidate ?? this.isValidate,
    );
  }
}

class NotesInitial extends MatriState {}
