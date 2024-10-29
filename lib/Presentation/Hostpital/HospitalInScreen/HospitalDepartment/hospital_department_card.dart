import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';

class WidgetHospitalDepartmentCard extends StatelessWidget {
  const WidgetHospitalDepartmentCard({
    Key? key,
    required this.departName,
    required this.image,
  }) : super(key: key);

  final String departName;
  final String image;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
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
          Container(
            height: mHeight * .15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  width: mWidth * .3,
                  child: Text(
                    departName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
