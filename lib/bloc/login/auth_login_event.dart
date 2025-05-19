part of 'auth_login_bloc.dart';

abstract class AuthLoginEvent {}

class LoginEvent extends AuthLoginEvent {
  final String gmail;
  final String password;

  LoginEvent({required this.gmail, required this.password});
}
