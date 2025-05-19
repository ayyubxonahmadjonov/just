import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_project/service/api_service.dart';

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
    emit(AuthRegistrLoading());
    try {
      final result = await ApiService.registr(
        event.name,
        event.gmail,
        event.password,
        event.rePassword,
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        emit(AuthRegistrSucces());
      }
    } catch (e) {
      emit(AuthRegistrError(error: "something went wrong $e"));
    }
  }
}
