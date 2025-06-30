part of 'auth_login_bloc.dart';

abstract class AuthLoginEvent {}

class LoginEvent extends AuthLoginEvent {
  final String phone_number;
  final String password;

  LoginEvent({required this.phone_number, required this.password});
}
