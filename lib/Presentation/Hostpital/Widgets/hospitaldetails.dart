import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/hostpitalinmain.dart';
import 'package:flutter/material.dart';

class HospitalDetailsCard extends StatelessWidget {
  const HospitalDetailsCard({
    Key? key,
    required this.image,
    required this.hospitalName,
    required this.description,
    required this.location,
    required this.hospitalId,
    required this.selctedIndex,
  }) : super(key: key);

  final String image;
  final String hospitalName;
  final String description;
  final String location;
  final int hospitalId;
  final int selctedIndex;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ScreenHospitalIn(
            selectedindex: selctedIndex,
            hospitalName: hospitalName,
            hospitalId: hospitalId,
          ),
        ),
      ),
      child: Container(
        height: mHeight * .16,
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
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: mHeight * .125,
              width: mWidth * .25,
              decoration: BoxDecoration(
                color: cBlue,
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.all(cRadius20),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: mWidth * .5,
                  child: Text(
                    hospitalName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      color: cBlue900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                cHeight10,
                SizedBox(
                  width: mWidth * .5,
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 20,
                    ),
                    SizedBox(
                      width: mWidth * .4,
                      child: Text(
                        location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
