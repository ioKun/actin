part of 'activity_list_bloc.dart';

abstract class ActivityListState extends Equatable {
  const ActivityListState();
}

class ActivityListInitial extends ActivityListState {
  @override
  List<Object> get props => ['ActivityListState:ActivityListInitial'];
}

class ActivityListLoading extends ActivityListState {
  @override
  List<Object> get props => ['ActivityListState:ActivityListLoading'];
}

class ActivityListLoaded extends ActivityListState {
  final List<Activity> activities;

  const ActivityListLoaded({@required this.activities})
      : assert(activities != null);

  @override
  List<Object> get props => ['ActivityListState:ActivityListLoaded'];
}

class ActivityListFailure extends ActivityListState {
  final String msg;

  const ActivityListFailure({@required this.msg}) : assert(msg != null);

  @override
  List<Object> get props => ['ActivityListState:ActivityListFailure', msg];
}
