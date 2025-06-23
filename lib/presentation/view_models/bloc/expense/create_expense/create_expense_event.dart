part of 'create_expense_bloc.dart';

abstract class CreateExpenseEvent {}

class GenerateExpenseEvent extends CreateExpenseEvent {
  final String amount;
  final String date;
  final int category;
  GenerateExpenseEvent({
    required this.amount,
    required this.date,
    required this.category,
  });
}
