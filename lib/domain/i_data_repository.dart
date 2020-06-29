import 'package:actin/domain/error/failures.dart';
import 'package:actin/domain/model/activity.dart';
import 'package:actin/domain/model/location.dart';
import 'package:actin/domain/model/user.dart';
import 'package:dartz/dartz.dart';

abstract class IDataRepository {
  Future<void> auth(String token);
  Future<User> getProfile(String userId);
  Future<void> editProfile(User user);
  Future<List<Activity>> activityList();
  Future<Either<Failure, Activity>> activityDetails(String activityId);
  Activity createActivity(Activity activity);
  Activity editActivity(Activity activity);
  Future<void> subscribeActivity(String activityId);
  Future<void> deleteActivity(String activityId);
  Future<Either<Failure, List<Location>>> getCities(String query);
}
