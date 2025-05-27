import 'package:real_project/core/constants/app_imports.dart';

part 'comfirm_smscode_event.dart';
part 'comfirm_smscode_state.dart';

class ComfirmSmscodeBloc
    extends Bloc<ComfirmSmscodeEvent, ComfirmSmscodeState> {
  ComfirmSmscodeBloc() : super(ComfirmSmscodeInitial()) {
    on<ComfirmCodeEmailEvent>(comfirmCodeEmail);
  }
  Future<void> comfirmCodeEmail(
    ComfirmCodeEmailEvent event,
    Emitter<ComfirmSmscodeState> emit,
  ) async {
    emit(ConfirmSmsCodeLoadingState());
    try {
      final result = await ApiService.confirmSmsCode(
        event.email,
        event.sms_code,
        event.newPassword,
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        emit(ConfirmSmsCodeSuccesState());
      } else if (result.statusCode == 400) {
        emit(ConfirmSmsCodeErrorState(error: result.result.toString()));
      }
    } catch (e) {
      emit(ConfirmSmsCodeErrorState(error: "something went wrong $e"));
    }
  }
}
