import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget otpBox(BuildContext context, TextEditingController otps) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
    height: MediaQuery.of(context).size.height / 14,
    width: MediaQuery.of(context).size.width / 8,
    decoration: BoxDecoration(
      color: cGrey.withOpacity(.1),
      border: const Border(
        bottom: BorderSide(
          color: cTeal,
          width: 2,
        ),
      ),
    ),
    child: TextField(
      controller: otps,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        border: InputBorder.none,
        counterText: '',
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty) {
          FocusScope.of(context).focusInDirection(TraversalDirection.left);
        }
      },
    ),
  );
}
