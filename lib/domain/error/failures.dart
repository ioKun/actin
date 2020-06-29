import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;

  Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => properties;
}

// General failures
class NoDataFailure extends Failure {}

class NoConectionFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnknownFailure extends Failure {}

const String SERVER_FAILURE_MESSAGE = 'Не удалось подключится к серверу';
const String NO_CONNECTION_FAILURE = 'Нет интернет соединения';
const String NO_DATA_MESSAGE = 'Нет данных';
String mapFailureToMessage(failure) {
  // Instead of a regular 'if (failure is ServerFailure)...'
  switch (failure.runtimeType) {
    case NoConectionFailure:
      return NO_CONNECTION_FAILURE;
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case NoDataFailure:
      return NO_DATA_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
