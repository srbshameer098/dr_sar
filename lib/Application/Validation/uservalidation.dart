
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Presentation/LoginScreen/loginotpscreen.dart';
import '../../Presentation/SignUpScreen/screen_signup.dart';
import '../Blocs/OTPLogin/otp_login_bloc.dart';

class UserValidation {
  UserValidation({required this.context});

  BuildContext context;

  sendOtp(TextEditingController number, ValueNotifier isAbsorb,
      BuildContext context) {
    if (number.text.length >= 10) {
      isAbsorb.value = true;
      BlocProvider.of<OtploginBloc>(context).add(
        SendOtpEvent(number.text),
      );
    }
  }

  sendOtpNewUser(BuildContext context) {
    if (mobControllerSignUp.text.length >= 10) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ScreenLoginOtp(sessionId: ""),
          ),
              (route) => false);
    }
  }



  resendOtp(String phoneNumber) {
    if (otp.length == 6) {
      BlocProvider.of<OtploginBloc>(context).add(SendOtpEvent(phoneNumber));
    }
  }
}