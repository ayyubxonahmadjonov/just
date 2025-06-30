part of 'comfirm_smscode_bloc.dart';

abstract class ComfirmSmscodeEvent {}

class ComfirmCodeEmailEvent extends ComfirmSmscodeEvent {
  final String phone_number;
  final String otp_code;

  ComfirmCodeEmailEvent({required this.phone_number, required this.otp_code});
}
