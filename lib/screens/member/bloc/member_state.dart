part of 'member_bloc.dart';

class MemberState {
  final ApiCallState? saveProfileCallState;
  final ApiCallState? saveBusiProfileCallState;
  final ApiCallState? saveMatriProfileCallState;
  final ApiCallState? socialProfileCallState;
  final ApiCallState? subDropCallState;
  final ApiCallState? memberCallState;
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

  MemberState({
    this.saveProfileCallState = ApiCallState.none,
    this.saveBusiProfileCallState = ApiCallState.none,
    this.saveMatriProfileCallState = ApiCallState.none,
    this.socialProfileCallState = ApiCallState.none,
    this.subDropCallState = ApiCallState.none,
    this.memberCallState = ApiCallState.none,
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
  });

  List<Object> get props => [
        saveProfileCallState!,
        saveBusiProfileCallState!,
        saveMatriProfileCallState!,
        socialProfileCallState!,
        subDropCallState!,
        memberCallState!,
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
      ];

  MemberState copyWith({
    ApiCallState? saveProfileCallState,
    ApiCallState? saveBusiProfileCallState,
    ApiCallState? saveMatriProfileCallState,
    ApiCallState? socialProfileCallState,
    ApiCallState? subDropCallState,
    ApiCallState? memberCallState,
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
  }) {
    return MemberState(
      saveProfileCallState: saveProfileCallState ?? this.saveProfileCallState,
      subDropCallState: subDropCallState ?? this.subDropCallState,
      saveBusiProfileCallState:
          saveBusiProfileCallState ?? this.saveBusiProfileCallState,
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
      memberCallState: memberCallState ?? this.memberCallState,
      isValidate: isValidate ?? this.isValidate,
    );
  }
}

class NotesInitial extends MemberState {}
