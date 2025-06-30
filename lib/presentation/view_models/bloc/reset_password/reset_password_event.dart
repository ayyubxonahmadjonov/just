part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent {}

class ResetPasswordbyEmailEvent extends ResetPasswordEvent {
  final String phone_number;
  ResetPasswordbyEmailEvent({required this.phone_number});
}
