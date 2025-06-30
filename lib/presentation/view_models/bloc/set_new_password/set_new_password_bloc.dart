import 'package:bloc/bloc.dart';
import 'package:real_project/data/datasources/network/api_service.dart';

part 'set_new_password_event.dart';
part 'set_new_password_state.dart';

class SetNewPasswordBloc
    extends Bloc<SetNewPasswordEvent, SetNewPasswordState> {
  SetNewPasswordBloc() : super(SetNewPasswordInitial()) {
    on<SetNewPasswordWithTokenEvent>(setNewPasswordWithToken);
  }
  Future<void> setNewPasswordWithToken(
    SetNewPasswordWithTokenEvent event,
    Emitter<SetNewPasswordState> emit,
  ) async {
    emit(SetNewPasswordLoading());
    try {
      final result = await ApiService.setNewPassword(
        event.reset_token,
        event.new_password,
        event.confirm_password,
      );

      if (result.isSuccess) {
        emit(SetNewPasswordSuccess());
      } else {
        emit(SetNewPasswordError(error: result.result["message"].toString()));
      }
    } catch (e) {
      print("error $e");
    }
  }
}
