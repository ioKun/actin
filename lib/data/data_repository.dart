import 'package:actin/domain/error/failures.dart';
import 'package:actin/domain/i_data_repository.dart';
import 'package:actin/domain/model/activity.dart';
import 'package:actin/domain/model/location.dart';
import 'package:actin/domain/model/user.dart';
import 'package:actin/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDataRepository, env: Env.prod)
class DataRepository extends IDataRepository {
  @override
  Future<Either<Failure, Activity>> activityDetails(String activityId) {
    // TODO: implement activityDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Activity>> activityList() {
    // TODO: implement activityList
    throw UnimplementedError();
  }

  @override
  Future<void> auth(String token) {
    // TODO: implement auth
    throw UnimplementedError();
  }

  @override
  Activity createActivity(Activity activity) {
    // TODO: implement createActivity
    throw UnimplementedError();
  }

  @override
  Future<void> deleteActivity(String activityId) {
    // TODO: implement deleteActivity
    throw UnimplementedError();
  }

  @override
  Activity editActivity(Activity activity) {
    // TODO: implement editActivity
    throw UnimplementedError();
  }

  @override
  Future<void> editProfile(User user) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<void> subscribeActivity(String activityId) {
    // TODO: implement subscribeActivity
    throw UnimplementedError();
  }

  @override
  Future<User> getProfile(String userId) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Location>>> getCities(String query) {
    // TODO: implement getCities
    throw UnimplementedError();
  }
}
