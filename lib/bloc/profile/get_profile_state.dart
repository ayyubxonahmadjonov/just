part of 'get_profile_bloc.dart';

@immutable
abstract class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  final UserModel user;
  GetProfileSuccess({required this.user});
}

final class GetProfileError extends GetProfileState {
  final String error;
  GetProfileError({required this.error});
}
