part of 'set_new_password_bloc.dart';

abstract class SetNewPasswordState {}

class SetNewPasswordInitial extends SetNewPasswordState {}

class SetNewPasswordLoading extends SetNewPasswordState {}

class SetNewPasswordSuccess extends SetNewPasswordState {}

class SetNewPasswordError extends SetNewPasswordState {
  final String error;

  SetNewPasswordError({required this.error});
}
