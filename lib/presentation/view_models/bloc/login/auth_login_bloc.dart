import 'package:real_project/data/models/login_error_model.dart';

import '../../../../core/constants/app_imports.dart';
part 'auth_login_event.dart';
part 'auth_login_state.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  AuthLoginBloc() : super(AuthLoginInitial()) {
    on<LoginEvent>(login);
  }

  Future<void> login(LoginEvent event, Emitter<AuthLoginState> emit) async {
    emit(AuthLoginLoading());
    try {
      final result = await ApiService.login(event.email, event.password);
      if (result.statusCode == 200 || result.statusCode == 201) {
        final access = result.result["token"]["access"];
        final refresh = result.result["token"]["refresh"];

        await SharedPreferencesHelper().setString("access", access);
        await SharedPreferencesHelper().setString("refresh", refresh);

        emit(AuthLoginSucces());
      } else {
        emit(AuthLoginError(error: result.result.toString()));
      }
    } catch (e) {
      emit(AuthLoginError(error: "something went wrong $e"));
    }
  }
}
