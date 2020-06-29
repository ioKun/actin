import 'dart:async';

import 'package:actin/domain/i_data_repository.dart';
import 'package:actin/domain/model/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IDataRepository _dataRepository;

  ProfileBloc({@required IDataRepository dataRepository})
      : assert(dataRepository != null),
        _dataRepository = dataRepository;

  @override
  ProfileState get initialState => Empty();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfile) {
      final user = await _dataRepository.getProfile(event.userId);
      yield Data(user: user);
    } else {
      yield NoData();
    }
  }
}
