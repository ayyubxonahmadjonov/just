import '../../../../core/constants/app_imports.dart';

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
      print("getrpofile bloc is calling");

      final result = await ApiService.getProfile();

      if (result.statusCode == 200 && result.isSuccess) {
        final user = UserModel.fromJson(result.result);
        emit(GetProfileSuccess(user: user));
      } else if (result.statusCode == 401) {
      } else {
        emit(GetProfileError(error: result.result.toString()));
      }
    } catch (e) {
      emit(GetProfileError(error: e.toString()));
    }
  }
}
