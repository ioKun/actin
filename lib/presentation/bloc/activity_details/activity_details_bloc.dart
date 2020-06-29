import 'dart:async';

import 'package:actin/domain/error/failures.dart';
import 'package:actin/domain/model/activity.dart';
import 'package:actin/domain/usecases/usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'activity_details_event.dart';
part 'activity_details_state.dart';

@injectable
class ActivityDetailsBloc
    extends Bloc<ActivityDetailsEvent, ActivityDetailsState> {
  final GetActivity getActivity;

  ActivityDetailsBloc({@required this.getActivity})
      : assert(getActivity != null);

  @override
  ActivityDetailsState get initialState => ActivityDetailsInitial();

  @override
  Stream<ActivityDetailsState> mapEventToState(
    ActivityDetailsEvent event,
  ) async* {
    if (event is GetActivityData) {
      yield ActivityLoading();
      final failureOrResult = await getActivity(event.activityId);
      yield failureOrResult.fold(
        (failure) => ActivityFailure(msg: mapFailureToMessage(failure)),
        (data) => ActivityLoaded(activity: data),
      ); //Connected(registerStatus: status),
    }
  }
}
