import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Presentation/LoginScreen/loginscreen.dart';

userLogout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => ScreenLogin()), (route) => false);
}
