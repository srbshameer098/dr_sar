import 'package:drsar/Application/Blocs/Customer/bloc/customer_bloc.dart';
import 'package:drsar/Application/Blocs/Doctors/bloc/doctors_bloc.dart';
import 'package:drsar/Application/Blocs/HomeServices/bloc/homeservices_bloc.dart';
import 'package:drsar/Application/Blocs/Hospitals/hospitals_bloc.dart';
import 'package:drsar/Application/Blocs/OTPLogin/otp_login_bloc.dart';
import 'package:drsar/Application/Validation/uservalidation.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/LoginModel/login_model.dart';
import 'package:drsar/Presentation/Dialogs/custom_transistion_dailog.dart';
import 'package:drsar/Presentation/LoginScreen/loginscreen.dart';
import 'package:drsar/Presentation/LoginScreen/widgets/otpboxfield.dart';
import 'package:drsar/Presentation/MainScreen/mainscreen.dart';
import 'package:drsar/Presentation/SignUpScreen/screen_signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

late String otp;

class ScreenLoginOtp extends StatefulWidget {
  const ScreenLoginOtp({Key? key, required this.sessionId}) : super(key: key);
  final String sessionId;

  @override
  State<ScreenLoginOtp> createState() => _ScreenLoginOtpState();
}

class _ScreenLoginOtpState extends State<ScreenLoginOtp> {
  @override
  void dispose() {
    Loader.hide();
    super.dispose();
  }

  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();
  final TextEditingController otp5 = TextEditingController();
  final TextEditingController otp6 = TextEditingController();
  late LoginModel loginModel;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocListener<OtploginBloc, OtpLoginState>(
        listener: (context, state) {
          if (state is VerifyOtp) {
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
          if (state is Otpverified) {
            loginModel = BlocProvider.of<OtploginBloc>(context).loginModel;
            Loader.hide();
            BlocProvider.of<HospitalsBloc>(context)
                .add(FetchHospitalDataEvent());
            BlocProvider.of<DoctorsBloc>(context).add(FetchDoctorsDataEvent());
            BlocProvider.of<HomeservicesBloc>(context)
                .add(FetchHomeServicesData());
            BlocProvider.of<CustomerBloc>(context)
                .add(FetchCustomerDataEvent());
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => ScreenMain(eIndex: 0),
                ),
                (route) => false);
          }
          if (state is OtpverificationFailed) {
            Loader.hide();
            showCustomDialog(
              context,
              "Something Went wrong please try again later",
              Icons.warning,
              cYellow,
            );
          }
        },
        child: SizedBox(
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
              const Text(
                "Verification",
                style: TextStyle(
                    color: cTeal, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              cHeight30,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "OTP Login sent to ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text:
                          "+91${numberController.text.isEmpty ? mobControllerSignUp.text : numberController.text}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: cBlue900,
                          fontSize: 20),
                    ),
                    TextSpan(
                      text: "\nChange Number ",
                      style: TextStyle(
                        color: cBlue900,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => ScreenLogin(),
                              ),
                              (route) => false);
                        },
                    ),
                  ],
                ),
              ),
              cHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  otpBox(context, otp1),
                  otpBox(context, otp2),
                  otpBox(context, otp3),
                  otpBox(context, otp4),
                  otpBox(context, otp5),
                  otpBox(context, otp6),
                ],
              ),
              cHeight30,
              AnimatedSwitcher(
                duration: const Duration(seconds: 30),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don’t receive OTP?",
                        style: TextStyle(
                          color: cBlack,
                          fontSize: 10,
                        ),
                      ),
                      TextSpan(
                        text: " Resend OTP ",
                        style: TextStyle(
                          color: cBlue900,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            UserValidation(context: context).resendOtp(
                              numberController.text.isEmpty
                                  ? mobControllerSignUp.text
                                  : numberController.text,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              cHeight30,
              SizedBox(
                width: mWidth * .8,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  onPressed: () {
                    otp = otp1.text +
                        otp2.text +
                        otp3.text +
                        otp4.text +
                        otp5.text +
                        otp6.text;
                    if (otp.length == 6) {
                      BlocProvider.of<OtploginBloc>(context).add(
                        VerifyOtpEvent(
                          numberController.text.isEmpty
                              ? mobControllerSignUp.text
                              : numberController.text,
                          widget.sessionId,
                          otp,
                        ),
                      );
                    }
                    return;
                  },
                  child: const Text("Verify & Proceed"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
