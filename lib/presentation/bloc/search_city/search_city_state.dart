part of 'search_city_bloc.dart';

abstract class SearchCityState extends Equatable {
  const SearchCityState();

  @override
  List<Object> get props => [];
}

class SearchCityInitial extends SearchCityState {}

class SearchLoading extends SearchCityState {}

class SearchLoaded extends SearchCityState {
  final List<Location> locations;

  SearchLoaded({@required this.locations});

  @override
  List<Object> get props => [locations];
}

class SearchFailure extends SearchCityState {
  final String msg;

  SearchFailure({@required this.msg});
}
