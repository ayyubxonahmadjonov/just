part of 'auth_login_bloc.dart';

abstract class AuthLoginEvent {}

class LoginEvent extends AuthLoginEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
