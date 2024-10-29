
import 'package:flutter/material.dart';

import '../../../Domain/Constants/Color/colors.dart';
import '../../../Domain/Constants/constants.dart';
import '../../Widgets/CustomDesigns/skelton_loading.dart';

class CustomDoctorLoading extends StatelessWidget {
  const CustomDoctorLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mHeight * .15,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(cRadius10),
        boxShadow: [
          BoxShadow(
            color: cGrey.withOpacity(.5),
            offset: const Offset(0.0, 0.0),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        children: [
          LoadAnimation(
            child: Container(
              margin: const EdgeInsets.only(left: 40, right: 10),
              height: mHeight * .12,
              width: mWidth * .23,
              decoration: BoxDecoration(
                color: cGrey.withOpacity(.15),
                borderRadius: const BorderRadius.all(cRadius20),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoadAnimation(
                child: Container(
                  width: mWidth * .5,
                  height: mHeight * .03,
                  decoration: BoxDecoration(
                    color: cGrey.withOpacity(.15),
                  ),
                ),
              ),
              SizedBox(
                width: mWidth * .5,
                height: mHeight * .03,
              ),
              Padding(
                padding: EdgeInsets.only(left: mWidth * .3),
                child: LoadAnimation(
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: mWidth * .2,
                    height: mHeight * .03,
                    decoration: BoxDecoration(
                      color: cGrey.withOpacity(.15),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
