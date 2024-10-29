
import 'package:flutter/material.dart';

import '../../../Domain/Constants/Color/colors.dart';
import '../../Widgets/CustomDesigns/skelton_loading.dart';

class CustomHospitalRoomsLoading extends StatelessWidget {
  const CustomHospitalRoomsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: mHeight,
      width: mWidth,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        height: mHeight * .8,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            child: Container(
              height: mHeight * .15,
              width: mWidth * .9,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(30),
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
                      height: mHeight * .12,
                      width: mWidth * .18,
                      margin: EdgeInsets.only(left: mWidth * .05),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: cGrey.withOpacity(.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: mWidth * .025,
                      right: mWidth * .25,
                    ),
                    padding: EdgeInsets.only(
                        top: mHeight * .01, bottom: mHeight * .01),
                    height: mHeight * .13,
                    width: mWidth * .25,
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LoadAnimation(
                          child: Container(
                            height: mHeight * .03,
                            color: cGrey.withOpacity(.15),
                          ),
                        ),
                        LoadAnimation(
                          child: Container(
                            height: mHeight * .03,
                            color: cGrey.withOpacity(.15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
