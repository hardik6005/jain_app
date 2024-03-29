part of 'home_bloc.dart';

class HomeState {
  final ApiCallState? saveProfileCallState;
  final ApiCallState? getProfileCallState;
  final ApiCallState? getMemberCallState;
  final ApiCallState? businessCallState;
  final ApiCallState? matriCallState;
  final int? page;
  final bool? hasNextPage;
  final bool? isLoadMoreRunning;
  final bool? isFav;
  final String? gender;
  final String? maritalStatus;
  late final bool? validEmailO;
  late final bool? validPhoneH;
  late final bool? validPhoneO;

  //Addresss
  final bool? sameAsNative;
  final bool? sameAsPermanant;
  final bool? sameAsNative1;
  final String? successMsg;

  final String? educationId;
  final String? jobId;
  final MemberListModel? memberListModel;
  final BusinessListModel? businessListModel;
  final MatriListModel? matriListModel;

  HomeState({
    this.saveProfileCallState = ApiCallState.none,
    this.getProfileCallState = ApiCallState.none,
    this.getMemberCallState = ApiCallState.busy,
    this.businessCallState = ApiCallState.busy,
    this.matriCallState = ApiCallState.busy,
    this.page = 0,
    this.hasNextPage = true,
    this.isLoadMoreRunning = false,
    this.isFav = false,
    this.gender = "",
    this.maritalStatus = "",
    this.sameAsNative = false,
    this.sameAsPermanant = false,
    this.sameAsNative1 = false,
    this.validEmailO = false,
    this.validPhoneH = false,
    this.validPhoneO = false,
    this.successMsg,
    this.jobId,
    this.educationId,
    this.memberListModel,
    this.businessListModel,
    this.matriListModel,
  });

  List<Object> get props => [
        saveProfileCallState!,
        getProfileCallState!,
        getMemberCallState!,
        matriCallState!,
        businessCallState!,
        page!,
        hasNextPage!,
        isLoadMoreRunning!,
        isFav!,
        gender!,
        maritalStatus!,
        sameAsNative!,
        sameAsPermanant!,
        sameAsNative1!,
        validEmailO!,
        validPhoneH!,
        validPhoneO!,
        successMsg!,
        educationId!,
        jobId!,
        memberListModel!,
        businessListModel!,
        matriListModel!,
      ];

  HomeState copyWith({
    ApiCallState? saveProfileCallState,
    ApiCallState? getProfileCallState,
    ApiCallState? getMemberCallState,
    ApiCallState? businessCallState,
    ApiCallState? matriCallState,
    int? page,
    bool? hasNextPage,
    bool? isLoadMoreRunning,
    bool? isFav,
    String? gender,
    String? maritalStatus,
    bool? validEmailO,
    bool? validPhoneH,
    bool? validPhoneO,
    //Addresss
    bool? sameAsNative,
    bool? sameAsPermanant,
    bool? sameAsNative1,
    String? successMsg,
    String? jobId,
    String? educationId,
    MemberListModel? memberListModel,
    BusinessListModel? businessListModel,
    MatriListModel? matriListModel,
  }) {
    return HomeState(
      saveProfileCallState: saveProfileCallState ?? this.saveProfileCallState,
      getProfileCallState: getProfileCallState ?? this.getProfileCallState,
      getMemberCallState: getMemberCallState ?? this.getMemberCallState,
      businessCallState: businessCallState ?? this.businessCallState,
      matriCallState: matriCallState ?? this.matriCallState,
      page: page ?? this.page,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoadMoreRunning: isLoadMoreRunning ?? this.isLoadMoreRunning,
      isFav: isFav ?? this.isFav,
      gender: gender ?? this.gender,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      sameAsNative: sameAsNative ?? this.sameAsNative,
      sameAsPermanant: sameAsPermanant ?? this.sameAsPermanant,
      sameAsNative1: sameAsNative1 ?? this.sameAsNative1,
      validEmailO: validEmailO ?? this.validEmailO,
      validPhoneH: validPhoneH ?? this.validPhoneH,
      validPhoneO: validPhoneO ?? this.validPhoneO,
      successMsg: successMsg ?? this.successMsg,
      jobId: jobId ?? this.jobId,
      educationId: educationId ?? this.educationId,
      memberListModel: memberListModel ?? this.memberListModel,
      businessListModel: businessListModel ?? this.businessListModel,
      matriListModel: matriListModel ?? this.matriListModel,
    );
  }
}

class NotesInitial extends HomeState {}
