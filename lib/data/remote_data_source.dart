import 'dart:convert';

import 'package:actin/data/api/api_service.dart';
import 'package:actin/data/api/cityes_response.dart';
import 'package:actin/domain/error/exception.dart';
import 'package:actin/domain/model/location.dart';
import 'package:injectable/injectable.dart';
import 'dart:async';

@LazySingleton()
class RemopteDataSource {
  final ApiService apiService;

  RemopteDataSource({this.apiService});

  Future<List<Location>> getCities(String query) async {
    final response = await apiService.getCities(query);
    if (response.error != null) {
      throw HttpException();
    }
    final decodedJson = json.decode(response.body);
    final converted = CitiesResponse.fromJson(decodedJson);
    return converted.results;
  }
}
