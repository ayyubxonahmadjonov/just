part of 'get_expense_bloc.dart';

abstract class GetExpenseState {}

class GetExpenseInitial extends GetExpenseState {}

class GetExpenseLoading extends GetExpenseState {}

class GetExpenseSuccessState extends GetExpenseState {
  final List<ExpenseModel> expenseList;
  GetExpenseSuccessState({required this.expenseList});
}

class GetExpenseErrorState extends GetExpenseState {
  final String message;
  GetExpenseErrorState({required this.message});
}
