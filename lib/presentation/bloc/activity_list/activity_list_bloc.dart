import 'dart:async';

import 'package:actin/domain/i_data_repository.dart';
import 'package:actin/domain/model/activity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'activity_list_event.dart';
part 'activity_list_state.dart';

@injectable
class ActivityListBloc extends Bloc<ActivityListEvent, ActivityListState> {
  final IDataRepository _dataRepository;

  ActivityListBloc({@required IDataRepository dataRepository})
      : assert(dataRepository != null),
        _dataRepository = dataRepository;

  @override
  ActivityListState get initialState => ActivityListInitial();

  @override
  Stream<ActivityListState> mapEventToState(
    ActivityListEvent event,
  ) async* {
    if (event is GetActivities) {
      yield ActivityListLoading();
      try {
        final List<Activity> activities = await _dataRepository.activityList();
        print(activities[0].toString());
        yield ActivityListLoaded(activities: activities);
      } catch (_) {
        yield ActivityListFailure(msg: 'DEFAULT');
      }
    }
  }
}
