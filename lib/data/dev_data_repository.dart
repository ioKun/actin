import 'package:actin/data/local_data_source.dart';
import 'package:actin/data/remote_data_source.dart';
import 'package:actin/domain/error/failures.dart';
import 'package:actin/domain/i_data_repository.dart';
import 'package:actin/domain/model/location.dart';
import 'package:actin/domain/model/user.dart';
import 'package:actin/domain/model/activity.dart';
import 'package:actin/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDataRepository, env: Env.dev)
class DevDataRepository extends IDataRepository {
  final LocalDataSource localDataSource;
  final RemopteDataSource remoteDataSource;

  DevDataRepository({this.localDataSource, this.remoteDataSource});

  @override
  Future<Either<Failure, Activity>> activityDetails(String activityId) async {
    try {
      return Right(Activity.sampleActivity(100));
    } on Exception {
      return Left(UnknownFailure()); //TODO change
    }
  }

  @override
  Future<List<Activity>> activityList() async =>
      List.generate(100, (index) => Activity.sampleActivity(index));

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
  Future<User> getProfile(String userId) async => User(
      id: '',
      name: 'IVAN',
      profileImg:
          'https://sun9-61.userapi.com/c857628/v857628225/109f49/_8S0atA17A0.jpg',
      description: 'someDesc');

  @override
  Future<void> subscribeActivity(String activityId) {
    // TODO: implement subscribeActivity
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Location>>> getCities(String query) async {
    try {
      final result = await remoteDataSource.getCities(query);
      return Right(result);
    } on Exception {
      return Left(UnknownFailure()); //TODO change
    }
  }
}
