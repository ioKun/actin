import 'package:actin/domain/error/failures.dart';
import 'package:actin/domain/i_data_repository.dart';
import 'package:actin/domain/model/location.dart';
import 'package:actin/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCities implements UseCase<List<Location>, String> {
  final IDataRepository repository;

  GetCities(this.repository);

  @override
  Future<Either<Failure, List<Location>>> call(String query) {
    return repository.getCities(query);
  }
}
