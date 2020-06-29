part of 'activity_details_bloc.dart';

abstract class ActivityDetailsState extends Equatable {
  const ActivityDetailsState();
}

class ActivityDetailsInitial extends ActivityDetailsState {
  @override
  List<Object> get props => [];
}

class ActivityLoading extends ActivityDetailsState {
  @override
  List<Object> get props => ['ActivityListState:ActivityListLoading'];
}

class ActivityLoaded extends ActivityDetailsState {
  final Activity activity;

  const ActivityLoaded({@required this.activity}) : assert(activity != null);

  @override
  List<Object> get props => ['ActivityListState:ActivityListLoaded'];
}

class ActivityFailure extends ActivityDetailsState {
  final String msg;

  const ActivityFailure({@required this.msg}) : assert(msg != null);

  @override
  List<Object> get props => ['ActivityDetailsState:ActivityFailure', msg];
}
