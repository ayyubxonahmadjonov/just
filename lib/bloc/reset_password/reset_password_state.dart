part of 'reset_password_bloc.dart';

abstract class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccesState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  final String error;
  ResetPasswordErrorState({required this.error});
}
