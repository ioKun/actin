// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:actin/data/api/api_service.dart';
import 'package:actin/data/app_path.dart';
import 'package:actin/data/data_repository.dart';
import 'package:actin/domain/i_data_repository.dart';
import 'package:actin/data/local_data_source.dart';
import 'package:actin/presentation/bloc/profile/profile_bloc.dart';
import 'package:actin/data/remote_data_source.dart';
import 'package:actin/presentation/bloc/activity_list/activity_list_bloc.dart';
import 'package:actin/domain/usecases/get_activity.dart';
import 'package:actin/domain/usecases/get_cities.dart';
import 'package:actin/data/dev_data_repository.dart';
import 'package:actin/presentation/bloc/search_city/search_city_bloc.dart';
import 'package:actin/presentation/bloc/activity_details/activity_details_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final appPathModule = _$AppPathModule();
  g.registerLazySingleton<ApiService>(() => ApiService.create());
  final appPath = await appPathModule.getAppPath();
  g.registerFactory<AppPath>(() => appPath);
  g.registerLazySingleton<LocalDataSource>(() => LocalDataSource());
  g.registerFactory<ProfileBloc>(
      () => ProfileBloc(dataRepository: g<IDataRepository>()));
  g.registerLazySingleton<RemopteDataSource>(
      () => RemopteDataSource(apiService: g<ApiService>()));
  g.registerFactory<ActivityListBloc>(
      () => ActivityListBloc(dataRepository: g<IDataRepository>()));
  g.registerLazySingleton<GetActivity>(() => GetActivity(g<IDataRepository>()));
  g.registerLazySingleton<GetCities>(() => GetCities(g<IDataRepository>()));
  g.registerLazySingleton<SearchCityBloc>(
      () => SearchCityBloc(getCities: g<GetCities>()));
  g.registerFactory<ActivityDetailsBloc>(
      () => ActivityDetailsBloc(getActivity: g<GetActivity>()));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<IDataRepository>(() => DataRepository());
  }

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerLazySingleton<IDataRepository>(() => DevDataRepository(
        localDataSource: g<LocalDataSource>(),
        remoteDataSource: g<RemopteDataSource>()));
  }
}

class _$AppPathModule extends AppPathModule {}
