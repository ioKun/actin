import 'package:actin/domain/model/point.dart';
import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String country;
  final String city;
  final Point geo;

  Location({this.country, this.city, this.geo});

  @override
  String toString() {
    return '$country / $city';
  }

  @override
  List<Object> get props => [country, city, geo];
}
