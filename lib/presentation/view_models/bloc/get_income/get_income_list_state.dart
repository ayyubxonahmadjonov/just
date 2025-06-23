part of 'get_income_list_bloc.dart';

abstract class GetIncomeListState {}

class GetIncomeListInitial extends GetIncomeListState {}

class GetIncomeListLoading extends GetIncomeListState {}

class GetIncomeListSuccess extends GetIncomeListState {
  final List<IncomeModel> incomeList;
  GetIncomeListSuccess({required this.incomeList});
}

class GetIncomeListError extends GetIncomeListState {
  final String message;
  GetIncomeListError({required this.message});
}
