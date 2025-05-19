import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_project/service/api_service.dart';

part 'auth_login_event.dart';
part 'auth_login_state.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  AuthLoginBloc() : super(AuthLoginInitial()) {
    on<LoginEvent>(login);
  }

  Future<void> login(LoginEvent event, Emitter<AuthLoginState> emit) async {
    emit(AuthLoginLoading());
    try {
      final result = await ApiService.login(event.gmail, event.password);
      if (result.statusCode == 200 || result.statusCode == 201) {
        emit(AuthLoginSucces());
      }
    } catch (e) {
      emit(AuthLoginError(error: "something went wrong $e"));
    }
  }
}
