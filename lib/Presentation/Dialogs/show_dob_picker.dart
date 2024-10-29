import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Presentation/SignUpScreen/screen_signup.dart';
import 'package:flutter/material.dart';

showDobPicker(context) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SizedBox(
        width: mWidth * .98,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                cWidth10,
                Padding(
                  padding:
                  EdgeInsets.only(left: mWidth * .13, top: mHeight * .01),
                  child: const Text(
                    "Select DOB",
                    style: TextStyle(
                      color: cBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            CalendarDatePicker(
              onDateChanged: (selectedDate) {
                date = selectedDate.toString().split(' ').first;
                dobNotifier.value = date.toString();
                Navigator.pop(context);
              },
              initialDate: DateTime.now(),
              firstDate: DateTime.now().add(
                const Duration(days: -100000000),
              ),
              lastDate: DateTime.now(),
            ),
          ],
        ),
      ),
    ),
  );
}