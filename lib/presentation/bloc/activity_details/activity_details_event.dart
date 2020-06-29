part of 'activity_details_bloc.dart';

abstract class ActivityDetailsEvent extends Equatable {
  const ActivityDetailsEvent();
}

class GetActivityData extends ActivityDetailsEvent {
  final String activityId;

  const GetActivityData({@required this.activityId});

  @override
  List<Object> get props => [activityId];
}
