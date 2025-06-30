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
      final result = await ApiService.resetPasswordbyPhoneNumber(
        event.phone_number,
      );
      if (result.isSuccess) {
        emit(ResetPasswordSuccesState());
      } else {
        emit(
          ResetPasswordErrorState(error: result.result["message"].toString()),
        );
      }
    } catch (e) {
      emit(ResetPasswordErrorState(error: "something wrong $e"));
    }
  }
}
