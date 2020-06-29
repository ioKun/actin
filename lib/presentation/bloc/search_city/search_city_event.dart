part of 'search_city_bloc.dart';

abstract class SearchCityEvent extends Equatable {
  const SearchCityEvent();
}

class SearchCities extends SearchCityEvent {
  final String query;

  SearchCities({@required this.query});

  @override
  List<Object> get props => [query];
}
