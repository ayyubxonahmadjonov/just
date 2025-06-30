part of 'auth_registr_bloc.dart';

abstract class AuthRegistrEvent {}

class RegistrEvent extends AuthRegistrEvent {
  final String name;
  final String phone_number;
  final String password;

  RegistrEvent({
    required this.name,
    required this.phone_number,
    required this.password,
  });
}
