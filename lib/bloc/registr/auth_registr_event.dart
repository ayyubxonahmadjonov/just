part of 'auth_registr_bloc.dart';

abstract class AuthRegistrEvent {}

class RegistrEvent extends AuthRegistrEvent {
  final String name;
  final String gmail;
  final String password;
  final String rePassword;

  RegistrEvent({
    required this.name,
    required this.gmail,
    required this.password,
    required this.rePassword,
  });
}
