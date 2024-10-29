
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Domain/Models/Customer/customer_edit_model.dart';
import '../../../../Domain/Models/UserAuthentication/user_register_model.dart';
import '../../../../Infrastructure/Api/UserAuth/user_auth_api.dart';

part 'user_auth_event.dart';

part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  late UserRegisterModel userRegisterModel;
  late CustomerEditModel customerEditModel;
  UserApi userApi;

  UserAuthBloc(this.userApi) : super(UserAuthInitial()) {
    on<UserAuthenticationEvent>(
      (event, emit) async {
        final prefs = await SharedPreferences.getInstance();
        emit(UserAuthLoading());
        try {
          userRegisterModel = await userApi.userRegister(
            name: event.name,
            email: event.email,
            city: event.city,
            dob: event.dob,
            phone: event.phoneNumber,
            gender: event.gender,
            healthIssues: event.healthIssues,
          );
          prefs.setString('phone', userRegisterModel.user!.phone!);
          prefs.setString('email', userRegisterModel.user!.email!);
          prefs.setString('name', userRegisterModel.user!.username!);
          emit(UserAuthSuccess());
          print("UserAuthSuccess");
        } catch (e) {
          if (e.toString() == '403') {
            print("Existing User");
            emit(ExistingUser());
          } else if (e.toString() == '400') {
            emit(ServerError());
          } else if (e.toString() == '500') {
            print("Server Error");
            emit(ServerError());
          } else {
            print('Default=========================================');
            emit(UserAuthFailed());
          }
          print("()((()()))()()++++++++++++++++++++++++++++++++++++(${e}");
        }
      },
    );

    on<UserEditEvent>(
      (event, emit) async {
        final prefs = await SharedPreferences.getInstance();
        emit(UserAuthLoading());
        try {
          customerEditModel = await userApi.editUserProfile(
            name: event.name,
            email: event.email,
            city: event.city,
            dob: event.dob,
            phone: event.phoneNumber,
            gender: event.gender,
            healthIssues: event.healthIssues,
          );

          prefs.setString('phone', userRegisterModel.user!.phone!);
          prefs.setString('email', userRegisterModel.user!.email!);
          prefs.setString('name', userRegisterModel.user!.username!);
          emit(UserAuthSuccess());
          print("UserAuthSuccess");
        } catch (e) {
          if (e.toString() == '400') {
            emit(ServerError());
          } else if (e.toString() == '403') {
            print("ValidationError");
            emit(ExistingUser());
          } else if (e.toString() == '500') {
            print("Server Error");
            emit(ServerError());
          } else {
            emit(UserAuthFailed());
            print("()((()()))()()++++++++++++++++++++++++++++++++++++(${e}");
          }
          print("()((()()))()()++++++++++++++++++++++++++++++++++++(${e}");
        }
      },
    );
  }
}
