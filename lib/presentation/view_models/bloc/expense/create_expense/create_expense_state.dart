part of 'create_expense_bloc.dart';

abstract class CreateExpenseState {}

class CreateExpenseInitial extends CreateExpenseState {}

class CreateExpenseLoading extends CreateExpenseState {}

class CreateExpenseSuccess extends CreateExpenseState {}

class CreateExpenseError extends CreateExpenseState {
  final String message;
  CreateExpenseError({required this.message});
}
