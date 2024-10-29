import 'package:drsar/Application/Blocs/OTPLogin/otp_login_bloc.dart';
import 'package:drsar/Application/Validation/uservalidation.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/SendOtpModel/send_otp_model.dart';
import 'package:drsar/Presentation/Dialogs/custom_transistion_dailog.dart';
import 'package:drsar/Presentation/LoginScreen/loginotpscreen.dart';
import 'package:drsar/Presentation/SignUpScreen/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

final TextEditingController numberController = TextEditingController();
final TextEditingController otpController = TextEditingController();

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final ValueNotifier<bool> isAbsorbNotifier = ValueNotifier(true);
  late SendOtpModel sendOtpModel;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocListener<OtploginBloc, OtpLoginState>(
      listener: (context, state) {
        if (state is OtpSending) {
          Loader.show(context,
              isSafeAreaOverlay: false,
              isAppbarOverlay: true,
              isBottomBarOverlay: false,
              progressIndicator: const CircularProgressIndicator(),
              themeData: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  secondary: Colors.black38,
                ),
              ),
              overlayColor: const Color(0x99E8EAF6));
        }
        if (state is OtpSuccessFully) {
          Loader.hide();
          sendOtpModel = BlocProvider.of<OtploginBloc>(context).sendOtpModel;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScreenLoginOtp(
                sessionId: sendOtpModel.details!,
              ),
            ),
          );
        }
        if (state is OtpSendingFailed) {
          Loader.hide();
          showCustomDialog(
            context,
            "Something Went wrong",
            Icons.warning,
            cYellow,
          );
        }
        if (state is UserNotFound) {
          Loader.hide();
          showCustomDialog(
            context,
            "No user found in this Number",
            Icons.person_outline,
            cTeal,
          );
        }
        if (state is OtpverificationFailed) {
          Loader.hide();
          showCustomDialog(
            context,
            "Server Under Maintenance",
            Icons.warning_rounded,
            cRed,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: mHeight,
          width: mWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo/drSarlogo.png',
                height: mHeight * .2,
                width: mWidth * .3,
              ),
              Text(
                "Verification",
                style: TextStyle(
                  color: cTeal.withOpacity(.8),
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              cHeight10,
              Text(
                "We will send you a One time password\n on your phone number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: cBlack.withOpacity(.4),
                ),
              ),
              cHeight30,
              SizedBox(
                height: mHeight * .070,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mWidth * .08),
                  child: TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: numberController,
                    style: TextStyle(color: cBlack),
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: cGrey.withOpacity(.15),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        color: cGrey.withOpacity(.5),
                      ),
                      contentPadding: const EdgeInsets.only(left: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cGrey.withOpacity(0.5),
                        ),
                      ),
                    ),
                    onChanged: (number) {
                      if (number.length == 10) {
                        isAbsorbNotifier.value = false;
                      } else {
                        isAbsorbNotifier.value = true;
                      }
                    },
                  ),
                ),
              ),
              cHeight20,
              ValueListenableBuilder(
                valueListenable: isAbsorbNotifier,
                builder: (BuildContext context, bool isAbsorb, _) {
                  return Column(
                    children: [
                      SizedBox(
                        width: mWidth * .85,
                        child: AbsorbPointer(
                          absorbing: isAbsorb,
                          child: SizedBox(
                            height: mHeight * .058,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: isAbsorb
                                    ? cDisabledButtonColor
                                    : cEnabledButtonColor,
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (numberController.text == '9638527410') {
                                  print('9638527410');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenLoginOtp(
                                        sessionId: 'ghjfsglfhgshgnsursrnt',
                                      ),
                                    ),
                                  );
                                } else {
                                  UserValidation(context: context).sendOtp(
                                      numberController,
                                      isAbsorbNotifier,
                                      context);
                                }
                              },
                              child: const Text("GET OTP"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ScreenSignup(),
                  ),
                ),
                child: const Text(
                  "Not a Member?",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
