import 'dart:convert';


import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Domain/Models/Customer/customer_edit_model.dart';
import '../../../Domain/Models/LoginModel/login_model.dart';
import '../../../Domain/Models/SendOtpModel/send_otp_model.dart';
import '../../../Domain/Models/UserAuthentication/user_register_model.dart';
import '../api_client.dart';

class UserApi {
  ApiClient apiClient = ApiClient();
  final String userEndpoint = "auth/local/customer/signup";

  Future<UserRegisterModel> userRegister({
    required String name,
    required String email,
    required String city,
    required String dob,
    required String phone,
    required String gender,
    required String healthIssues,
  }) async {
    Map userBody = {
      "name": name,
      "mob_no": phone,
      "email": email,
      "dob": dob,
      "additional_health_issues": [healthIssues],
      "gender": gender,
      "city": city
    };
    print(
        '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    print(jsonEncode(userBody));
    Response response =
        await apiClient.invokeAPI(userEndpoint, "REGISTER", userBody);
    print(response.body);
    return UserRegisterModel.fromJson(
      jsonDecode(response.body),
    );
  }

  Future<LoginModel> userLogin({
    required String phoneNumber,
    required String sessionId,
    required String otp,
  }) async {
    const String userLoginEndpoint = "auth/local/customer/signIn";
    Map userBody = {"mob_no": phoneNumber, "session_id": sessionId, "otp": otp};
    Response response =
        await apiClient.invokeAPI(userLoginEndpoint, "POST_", userBody);
    return LoginModel.fromJson(
      jsonDecode(response.body),
    );
  }

  Future<SendOtpModel> sendOtp({required String phoneNumber}) async {
    const String userLoginEndpoint = "auth/sendOtp";
    Map sentOtp = {"number": phoneNumber};
    Response response =
        await apiClient.invokeAPI(userLoginEndpoint, "POST_", sentOtp);
    return SendOtpModel.fromJson(
      jsonDecode(response.body),
    );
  }

  Future<CustomerEditModel> editUserProfile({
    required String name,
    required String email,
    required String city,
    required String dob,
    required String phone,
    required String gender,
    required String healthIssues,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString('jwt');
    print("========================================$jwt");
    Map userBody = {
      "name": name,
      "mob_no": phone,
      "email": email,
      "dob": dob,
      "additional_health_issues": [healthIssues],
      "gender": gender,
      "city": city
    };
    String editUser =
        'customer/updateProfile/${prefs.getInt('userId').toString()}';
    print(jsonEncode(userBody));
    Response response = await apiClient.invokeAPI(editUser, "PUT", userBody);
    print(response.body);
    return CustomerEditModel.fromJson(
      jsonDecode(response.body),
    );
  }
}
