import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:flutter/material.dart';

showAmenities(context, List<Amenities>? amenitiesData) {
  showDialog(
    context: context,
    builder: (context) {
      final mHeight = MediaQuery.of(context).size.height;
      final mWidth = MediaQuery.of(context).size.width;
      return AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: SizedBox(
          width: mWidth * .3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: mHeight * .05,
                width: mWidth,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: cWhite,
                  boxShadow: [
                    BoxShadow(
                      color: cGrey,
                      offset: Offset(0.0, 1.5),
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: cRadius10,
                    topRight: cRadius10,
                  ),
                ),
                child: const Text(
                  "Amenities",
                  style: TextStyle(
                    color: Color(0xff7b8d9e),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, left: 20, bottom: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: amenitiesData!.length,
                  itemBuilder: (BuildContext context, int index) => Row(
                    children: [
                      const Text(
                        "\u2022 ",
                        style: TextStyle(color: cGrey),
                      ),
                      Text(
                        amenitiesData[index].amenity!.name!,
                        style: const TextStyle(color: cGrey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

final amenities = [
  " WiFi",
  "Double Bed",
  "Refrigerator",
  "Phone Service",
  "Nurse Call Button",
  "2 Units of Bedside Table",
];
