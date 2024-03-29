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

