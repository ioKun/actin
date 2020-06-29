import 'dart:async';

import 'package:actin/domain/error/failures.dart';
import 'package:actin/domain/model/location.dart';
import 'package:actin/domain/usecases/usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'search_city_event.dart';
part 'search_city_state.dart';

@LazySingleton()
class SearchCityBloc extends Bloc<SearchCityEvent, SearchCityState> {
  final GetCities getCities;

  SearchCityBloc({@required this.getCities}) : assert(getCities != null);

  @override
  SearchCityState get initialState => SearchCityInitial();

  @override
  Stream<SearchCityState> mapEventToState(
    SearchCityEvent event,
  ) async* {
    if (event is SearchCities) {
      yield SearchLoading();
      final failureOrResult = await getCities.call(event.query);
      yield failureOrResult.fold(
        (failure) => SearchFailure(msg: mapFailureToMessage(failure)),
        (data) => SearchLoaded(locations: data),
      );
    }
  }
}
