import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';

void showCustomDialog(
    BuildContext context, String message, IconData icon, Color iconColor) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          padding: EdgeInsets.only(
            left: mWidth * .1,
            right: mWidth * .1,
            top: mHeight * .05,
            bottom: mHeight * .05,
          ),
          height: mHeight * .5,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: mHeight * .2,
                color: iconColor,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: cBlack,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  fontFamily: 'roboto',
                ),
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
