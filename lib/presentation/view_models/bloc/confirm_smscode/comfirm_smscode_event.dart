part of 'comfirm_smscode_bloc.dart';

abstract class ComfirmSmscodeEvent {}

class ComfirmCodeEmailEvent extends ComfirmSmscodeEvent {
  final String email;
  final String sms_code;
  final String newPassword;

  ComfirmCodeEmailEvent({
    required this.email,
    required this.sms_code,
    required this.newPassword,
  });
}
