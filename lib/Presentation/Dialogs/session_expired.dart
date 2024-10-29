import 'package:drsar/Application/CheckUser/user_logout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

showAlertDialog(BuildContext context) {
  print('Session Expired');
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      'Your Session Was Expired',
      textAlign: TextAlign.center,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.clockRotateLeft,
          size: MediaQuery.of(context).size.height * .09,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            userLogout(context);
          },
          child: Text(
            'Login again',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ),
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
