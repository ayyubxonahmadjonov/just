part of 'set_new_password_bloc.dart';

abstract class SetNewPasswordEvent {}

class SetNewPasswordWithTokenEvent extends SetNewPasswordEvent {
  final String reset_token;
  final String new_password;
  final String confirm_password;

  SetNewPasswordWithTokenEvent({
    required this.reset_token,
    required this.new_password,
    required this.confirm_password,
  });
}
