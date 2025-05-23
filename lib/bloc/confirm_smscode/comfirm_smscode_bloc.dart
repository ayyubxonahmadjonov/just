import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_project/service/api_service.dart';

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
      print(result.result.toString());
      print(result.statusCode);
      if (result.statusCode == 200 || result.statusCode == 201) {
        emit(ConfirmSmsCodeSuccesState());
        print("succes");
      }
    } catch (e) {
      emit(ConfirmSmsCodeErrorState(error: "something went wrong $e"));
    }
  }
}
