part of 'auth_login_bloc.dart';

abstract class AuthLoginState {}

final class AuthLoginInitial extends AuthLoginState {}

class AuthLoginLoading extends AuthLoginState {}

class AuthLoginSucces extends AuthLoginState {}

class AuthLoginError extends AuthLoginState {
  final String error;

  AuthLoginError({required this.error});
}
