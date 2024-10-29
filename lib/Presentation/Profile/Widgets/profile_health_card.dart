import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';

class WidgetProfileHealthCard extends StatelessWidget {
  const WidgetProfileHealthCard({Key? key}) : super(key: key);

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
            "Health Condition",
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
              itemCount: heath.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(top: mHeight * .015),
                child: Text(
                  heath[index],
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

final heath = [
  "BP Patient",
  "Diabetic",
  "Allergy",
];