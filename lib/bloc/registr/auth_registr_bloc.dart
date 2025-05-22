import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_project/service/api_service.dart';
import 'package:real_project/service/shared_preferences)service.dart';

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
        event.gmail,
        event.password,
      );
      print('result == ${result.result.toString()}');

      if (result.statusCode == 200 || result.statusCode == 201) {
        final access = result.result["token"]["access"];
        final refresh = result.result["token"]["refresh"];

        await SharedPreferencesHelper().setString("access", access);
        await SharedPreferencesHelper().setString("refresh", refresh);
        print('succes');

        emit(AuthRegistrSucces());
      }
    } catch (e) {
      print('error == $e');
      emit(AuthRegistrError(error: "something went wrong $e"));
    }
  }
}
