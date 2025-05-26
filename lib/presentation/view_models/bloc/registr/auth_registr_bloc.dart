import '../../../../core/constants/app_imports.dart';
part 'auth_registr_event.dart';
part 'auth_registr_state.dart';

class AuthRegistrBloc extends Bloc<AuthRegistrEvent, AuthRegistrState> {
  AuthRegistrBloc() : super(AuthRegistrInitial()) {
    on<RegistrEvent>(registr);
  }

  Future<void> registr(
    RegistrEvent event,
    Emitter<AuthRegistrState> emit,
  ) async {
    print('authRegistrBloc');
    emit(AuthRegistrLoading());
    try {
      final result = await ApiService.registr(
        event.name,
        event.email,
        event.password,
      );
      print('result == ${result.result.toString()}');

      if (result.statusCode == 200 || result.statusCode == 201) {
        final access = result.result["token"]["access"];
        final refresh = result.result["token"]["refresh"];
        await SharedPreferencesHelper().setString("access", access);
        await SharedPreferencesHelper().setString("refresh", refresh);
        emit(AuthRegistrSucces());
      } else {
        emit(AuthRegistrError(error: result.result.toString()));
      }
    } catch (e) {
      print('error == $e');
      emit(AuthRegistrError(error: "something went wrong $e"));
    }
  }
}
