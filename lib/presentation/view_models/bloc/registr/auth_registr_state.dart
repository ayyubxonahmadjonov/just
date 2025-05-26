part of 'auth_registr_bloc.dart';

@immutable
sealed class AuthRegistrState {}

class AuthRegistrInitial extends AuthRegistrState {}

class AuthRegistrLoading extends AuthRegistrState {}

class AuthRegistrSucces extends AuthRegistrState {}

class AuthRegistrError extends AuthRegistrState {
  final String error;

  AuthRegistrError({required this.error});
}
