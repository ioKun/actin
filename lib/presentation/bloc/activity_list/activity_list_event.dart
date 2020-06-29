part of 'activity_list_bloc.dart';

abstract class ActivityListEvent extends Equatable {
  const ActivityListEvent();
}

class GetActivities extends ActivityListEvent {
  final String city;

  const GetActivities({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
