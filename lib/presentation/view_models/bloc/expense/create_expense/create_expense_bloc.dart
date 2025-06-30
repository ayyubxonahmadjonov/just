import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_project/data/datasources/network/api_service.dart';

part 'create_expense_event.dart';
part 'create_expense_state.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  CreateExpenseBloc() : super(CreateExpenseInitial()) {
    on<GenerateExpenseEvent>(generateExpense);
  }
  Future<void> generateExpense(
    GenerateExpenseEvent event,
    Emitter<CreateExpenseState> emit,
  ) async {
    emit(CreateExpenseLoading());
    try {
      final result = await ApiService.createExpense(
        event.amount,
        event.date,
        event.category,
      );
      print(result.result);
      if (result.isSuccess) {
        emit(CreateExpenseSuccess());
      } else {
        emit(CreateExpenseError(message: result.result["message"].toString()));
      }
    } catch (e) {}
  }
}
