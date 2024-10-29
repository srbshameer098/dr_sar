part of 'otp_login_bloc.dart';

@immutable
abstract class OtpLoginEvent {}

class SendOtpEvent extends OtpLoginEvent {
  final String phoneNumber;

  SendOtpEvent(this.phoneNumber);
}

class VerifyOtpEvent extends OtpLoginEvent {
  final String phoneNumber;
  final String sessionId;
  final String otp;

  VerifyOtpEvent(
    this.phoneNumber,
    this.sessionId,
    this.otp,
  );
}
