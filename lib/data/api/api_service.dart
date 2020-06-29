import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'dart:io';

import 'package:injectable/injectable.dart';

part 'api_service.chopper.dart';

@LazySingleton()
@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(path: '/cities')
  Future<Response> getCities(@Query() String search);

  @factoryMethod
  static ApiService create() {
    final client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 30),
      ),
      baseUrl: "https://actin.bnoir.ru", // 10.0.2.2 //localhost default
      services: [
        _$ApiService(),
      ],
      // converter: OptimusConverter(),
      interceptors: [
        // Execute at every request
        HttpLoggingInterceptor(),
      ],
    );
    return _$ApiService(client);
  }
}
