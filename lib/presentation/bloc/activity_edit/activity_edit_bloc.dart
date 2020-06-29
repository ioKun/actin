import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activity_edit_event.dart';
part 'activity_edit_state.dart';

class ActivityEditBloc extends Bloc<ActivityEditEvent, ActivityEditState> {
  @override
  ActivityEditState get initialState => ActivityEditInitial();

  @override
  Stream<ActivityEditState> mapEventToState(
    ActivityEditEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
