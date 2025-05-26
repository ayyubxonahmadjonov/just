part of 'auth_registr_bloc.dart';

abstract class AuthRegistrEvent {}

class RegistrEvent extends AuthRegistrEvent {
  final String name;
  final String email;
  final String password;
  final String rePassword;

  RegistrEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
  });
}
