
import 'package:flutter/material.dart';

import '../../../Domain/Constants/Color/colors.dart';
import '../../../Domain/Constants/constants.dart';
import '../../Widgets/CustomDesigns/skelton_loading.dart';

class CustomHospitalLoading extends StatelessWidget {
  const CustomHospitalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mHeight * .15,
      width: mWidth * .85,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: cGrey.withOpacity(.5),
            offset: const Offset(0.0, 0.0),
            blurRadius: 2.0,
          ),
        ],
        borderRadius: const BorderRadius.all(cRadius30),
      ),
      child: Row(
        children: [
          LoadAnimation(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: mHeight * .125,
              width: mWidth * .25,
              decoration: BoxDecoration(
                color: cGrey.withOpacity(.15),
                borderRadius: const BorderRadius.all(cRadius20),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadAnimation(
                child: Container(
                  color: cGrey.withOpacity(.15),
                  width: mWidth * .5,
                  height: mHeight * .03,
                ),
              ),
              cHeight10,
              LoadAnimation(
                child: Container(
                  color: cGrey.withOpacity(.15),
                  width: mWidth * .5,
                  height: mHeight * .03,
                ),
              ),
              cHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LoadAnimation(
                    child: Container(
                      color: cGrey.withOpacity(.15),
                      width: mWidth * .4,
                      height: mHeight * .03,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
