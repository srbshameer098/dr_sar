import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';

class WidgetProfileDetailsCard extends StatelessWidget {
  const WidgetProfileDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: mWidth * .6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Details",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: cBlack,
            ),
          ),
          SizedBox(
            height: mHeight * .2,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: detaile.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(top: mHeight * .015),
                child: Text(
                  detaile[index],
                  style: const TextStyle(
                    fontSize: 10,
                    color: cBlack,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final detaile = [
  "Gender : Male",
  "DOB : 31-July-1990",
  "Mob No: +91 9876 54 32 10",
  "Email ID: safin@gmail.com",
];
