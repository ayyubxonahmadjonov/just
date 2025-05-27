import '../../../../core/constants/app_imports.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<ResetPasswordbyEmailEvent>(resetPasswordByEmail);
  }
  Future<void> resetPasswordByEmail(
    ResetPasswordbyEmailEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoadingState());
    try {
      final result = await ApiService.resetPasswordbyEmail(event.email);
      if (result.statusCode == 200 || result.statusCode == 201) {
        emit(ResetPasswordSuccesState());
      } else {
        emit(ResetPasswordErrorState(error: result.result.toString()));
      }
    } catch (e) {
      emit(ResetPasswordErrorState(error: "something wrong $e"));
    }
  }
}
