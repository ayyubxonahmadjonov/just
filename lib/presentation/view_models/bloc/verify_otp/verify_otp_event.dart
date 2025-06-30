part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent {}

final class VerifyOtpCodeEvent extends VerifyOtpEvent {
  final String phone;
  final String otpCode;
  final String otpType;

  VerifyOtpCodeEvent({
    required this.phone,
    required this.otpCode,
    required this.otpType,
  });
}
