import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:flutter/material.dart';

class WidgetTabBar extends StatelessWidget {
  const WidgetTabBar(
      {Key? key,
      required this.currentIndex,
      required this.positionIndex,
      required this.icon,
      required this.label})
      : super(key: key);

  final int currentIndex;
  final int positionIndex;

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 10),
          height: mHeight * .07,
          width: mWidth * .13,
          decoration: BoxDecoration(
            color: currentIndex == positionIndex
                ? tabSelectedColor
                : tabUnselectedColor,
            border: Border.fromBorderSide(
              BorderSide(
                color: cBlue900.withOpacity(.8),
              ),
            ),
            borderRadius: const BorderRadius.all(cRadius10),
          ),
          child: Image.asset(
            icon,
            color: currentIndex == positionIndex
                ? tabIconSelectedColor
                : tabIconUnselectedColor,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: cBlack),
        ),
      ],
    );
  }
}