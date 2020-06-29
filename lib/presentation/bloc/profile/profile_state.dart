part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class Empty extends ProfileState {
  @override
  List<Object> get props => ['ProfileState:Empty'];
}

class Data extends ProfileState {
  final User user;

  const Data({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => ['ProfileState:Data', user];
}

class NoData extends ProfileState {
  @override
  List<Object> get props => ['ProfileState:NoData'];
}
