import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';

showCalender(context) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: cBlue,
            height: mHeight * .6,
            width: mWidth * .8,
            child: DateRangePickerDialog(
              firstDate: DateTime.now().add(const Duration(days: -100)),
              lastDate: DateTime.now(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          )
        ],
      ),
    ),
  );
}