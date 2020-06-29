import 'package:actin/domain/error/failures.dart';
import 'package:actin/domain/i_data_repository.dart';
import 'package:actin/domain/model/activity.dart';
import 'package:actin/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetActivity implements UseCase<Activity, String> {
  final IDataRepository repository;

  GetActivity(this.repository);

  @override
  Future<Either<Failure, Activity>> call(String params) {
    return repository.activityDetails(params);
  }
}
