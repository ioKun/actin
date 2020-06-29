part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfile extends ProfileEvent {
  final String userId;

  GetProfile({@required this.userId});

  @override
  List<Object> get props => [userId];
}
