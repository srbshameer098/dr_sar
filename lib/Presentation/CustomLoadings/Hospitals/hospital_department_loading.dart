
import 'package:flutter/material.dart';

import '../../../Domain/Constants/Color/colors.dart';
import '../../Widgets/CustomDesigns/skelton_loading.dart';

class CustomHospitalDepartmentLoading extends StatelessWidget {
  const CustomHospitalDepartmentLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: mHeight * .03,
        left: mWidth * .05,
        right: mWidth * .05,
      ),
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: .9,
        ),
        itemBuilder: (BuildContext context, int index) => Container(
          height: mHeight * .40,
          width: mWidth * .40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: cGrey.withOpacity(.5),
                offset: const Offset(0.0, 0.0),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadAnimation(
                child: Container(
                  height: mHeight * .15,
                  decoration: BoxDecoration(
                    color: cGrey.withOpacity(.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadAnimation(
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        color: cGrey.withOpacity(.15),
                        height: mHeight * .02,
                        alignment: Alignment.center,
                        width: mWidth * .3,
                      ),
                    ),
                    LoadAnimation(
                      child: Container(
                        alignment: Alignment.center,
                        width: mWidth * .3,
                        height: mHeight * .02,
                        color: cGrey.withOpacity(.15),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
