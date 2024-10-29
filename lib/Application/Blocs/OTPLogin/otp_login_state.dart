part of 'otp_login_bloc.dart';

@immutable
abstract class OtpLoginState {}

class OtpInitial extends OtpLoginState {}

class OtpSending extends OtpLoginState {}

class OtpSuccessFully extends OtpLoginState {}

class OtpSendingFailed extends OtpLoginState {}

class UserNotFound extends OtpLoginState {}

class VerifyOtp extends OtpLoginState {}

class Otpverified extends OtpLoginState {}

class OtpverificationFailed extends OtpLoginState {}