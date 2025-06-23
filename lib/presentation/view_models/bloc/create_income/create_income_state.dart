part of 'create_income_bloc.dart';

abstract class CreateIncomeState {}

final class CreateIncomeInitial extends CreateIncomeState {}

final class CreateIncomeLoading extends CreateIncomeState {}

final class CreateIncomeSuccess extends CreateIncomeState {}

final class CreateIncomeError extends CreateIncomeState {
  final String message;

  CreateIncomeError({required this.message});
}
