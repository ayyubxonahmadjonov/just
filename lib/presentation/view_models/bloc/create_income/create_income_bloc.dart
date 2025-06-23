import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_project/data/datasources/network/api_service.dart';

part 'create_income_event.dart';
part 'create_income_state.dart';

class CreateIncomeBloc extends Bloc<CreateIncomeEvent, CreateIncomeState> {
  CreateIncomeBloc() : super(CreateIncomeInitial()) {
    on<CreateNewIncomeEvent>(createNewIncome);
  }
  Future<void> createNewIncome(
    CreateNewIncomeEvent event,
    Emitter<CreateIncomeState> emit,
  ) async {
    emit(CreateIncomeLoading());
    try {
      final result = await ApiService.createIncome(
        event.amount,
        event.date,
        event.category,
      );
      if (result.isSuccess) {
        emit(CreateIncomeSuccess());
      } else {
        emit(CreateIncomeError(message: result.result.toString()));
      }
    } catch (e) {}
  }
}
