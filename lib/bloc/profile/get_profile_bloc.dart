import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:real_project/models/user_model.dart';
import 'package:real_project/service/api_service.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  GetProfileBloc() : super(GetProfileInitial()) {
    on<GetProfileDetailsEvent>(getProfile);
  }
  Future<void> getProfile(
    GetProfileDetailsEvent event,
    Emitter<GetProfileState> emit,
  ) async {
    emit(GetProfileLoading());
    try {
      final result = await ApiService.getProfile();
      print(result.statusCode);

      if (result.statusCode == 200) {
        print('success');
        final user = UserModel.fromJson(result.result);

        emit(GetProfileSuccess(user: user));
      }
    } catch (e) {
      print(e);
      emit(GetProfileError(error: e.toString()));
    }
  }
}
