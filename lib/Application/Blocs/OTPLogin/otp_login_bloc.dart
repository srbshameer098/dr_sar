import 'package:bloc/bloc.dart';

import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Domain/Models/LoginModel/login_model.dart';
import '../../../Domain/Models/SendOtpModel/send_otp_model.dart';
import '../../../Infrastructure/Api/UserAuth/user_auth_api.dart';

part 'otp_login_event.dart';

part 'otp_login_state.dart';

class OtploginBloc extends Bloc<OtpLoginEvent, OtpLoginState> {
  late SendOtpModel sendOtpModel;
  late LoginModel loginModel;
  UserApi userApi;

  OtploginBloc(this.userApi) : super(OtpInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(OtpSending());
      try {
        sendOtpModel = await userApi.sendOtp(phoneNumber: event.phoneNumber);
        emit(OtpSuccessFully());
      } catch (e) {
        print("()()())++====+++)${e}");
        print(e.toString() =='404');
        if (e.toString() == '404') {
          print("404");
          emit(UserNotFound());
        } else {
          Loader.hide();
          print("somthing went wrong $e");
          print("()()())++====+++)$e");
          emit(OtpverificationFailed());
        }
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(VerifyOtp());
      try {
        loginModel = await userApi.userLogin(
            phoneNumber: event.phoneNumber,
            otp: event.otp,
            sessionId: event.sessionId);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt', loginModel.tokens!.accessToken!);
        emit(Otpverified());
      } catch (e) {
        Loader.hide();
        print("()()())++====+++)$e");
        emit(OtpverificationFailed());
      }
    });
  }
}
