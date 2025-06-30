part of 'comfirm_smscode_bloc.dart';

abstract class ComfirmSmscodeState {}

final class ComfirmSmscodeInitial extends ComfirmSmscodeState {}

class ConfirmSmsCodeLoadingState extends ComfirmSmscodeState {}

class ConfirmSmsCodeSuccesState extends ComfirmSmscodeState {}

class ConfirmSmsCodeErrorState extends ComfirmSmscodeState {
  final String error;
  ConfirmSmsCodeErrorState({required this.error});
}
