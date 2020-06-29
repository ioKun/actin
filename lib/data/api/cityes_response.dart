import 'package:actin/domain/model/location.dart';
import 'package:flutter/widgets.dart';

class LocationModel extends Location {
  final int id;
  final String name;
  final String countryName;
  LocationModel({
    @required this.id,
    @required this.name,
    @required this.countryName,
  }) : super(country: countryName, city: name);

  factory LocationModel.fromJson(Map<String, dynamic> jsonMap) {
    return LocationModel(
        id: jsonMap['id'],
        name: jsonMap['name'],
        countryName: jsonMap['country']);
  }
}

class CitiesResponse {
  final int count;
  final String next;
  final String previous;
  final List<LocationModel> results;

  CitiesResponse({this.count, this.next, this.previous, this.results});

  factory CitiesResponse.fromJson(Map<String, dynamic> jsonMap) {
    final List preResults = jsonMap['results'];
    return CitiesResponse(
        count: jsonMap['count'],
        next: jsonMap['next'],
        previous: jsonMap['previous'],
        results: preResults.map((e) => LocationModel.fromJson(e)).toList());
  }
}
