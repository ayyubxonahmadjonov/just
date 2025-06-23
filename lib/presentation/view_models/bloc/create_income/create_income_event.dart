part of 'create_income_bloc.dart';

abstract class CreateIncomeEvent {}

class CreateNewIncomeEvent extends CreateIncomeEvent {
  final String amount;
  final String date;
  final int category;

  CreateNewIncomeEvent({
    required this.amount,
    required this.date,
    required this.category,
  });
}
