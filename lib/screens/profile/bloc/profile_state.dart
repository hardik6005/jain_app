part of 'profile_bloc.dart';

class ProfileState {
  final ApiCallState? saveProfileCallState;
  final ApiCallState? getProfileCallState;
  final ApiCallState? updatePassCallState;
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

  ProfileState({
    this.saveProfileCallState = ApiCallState.none,
    this.getProfileCallState = ApiCallState.none,
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
    this.updatePassCallState,
  });

  List<Object> get props => [
        saveProfileCallState!,
        getProfileCallState!,
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
        updatePassCallState!,
      ];

  ProfileState copyWith({
    ApiCallState? saveProfileCallState,
    ApiCallState? getProfileCallState,
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
    ApiCallState? updatePassCallState,
  }) {
    return ProfileState(
      saveProfileCallState: saveProfileCallState ?? this.saveProfileCallState,
      updatePassCallState: updatePassCallState ?? this.updatePassCallState,
      getProfileCallState: getProfileCallState ?? this.getProfileCallState,
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
    );
  }
}

class NotesInitial extends ProfileState {}
