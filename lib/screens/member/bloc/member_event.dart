part of 'member_bloc.dart';

abstract class MemberEvent {
  const MemberEvent();

  List<Object> get props => [];
}

//Variable Event
class AddMemberEvent extends MemberEvent {
  MemberRequest? request;
  AddMemberEvent({this.request});
}

//Variable Event
class AddBusinessEvent extends MemberEvent {
  BusinessRequest? request;
  AddBusinessEvent({this.request});
}

//Variable Event
class SearchJobSeekerEvent extends MemberEvent {
  SearchJobRequest? request;
  SearchJobSeekerEvent({this.request});
}

