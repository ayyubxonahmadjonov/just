part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent {}

class ResetPasswordbyEmailEvent extends ResetPasswordEvent {
  final String email;
  ResetPasswordbyEmailEvent({required this.email});
}
