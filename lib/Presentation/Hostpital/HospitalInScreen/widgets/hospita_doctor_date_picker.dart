import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/widgets/hospital_time_slot_booking.dart';
import 'package:flutter/material.dart';

showHospitalDoctorAppoinmentDatePicker(
    context, String fee, List<Doctors> hospitalById, int doctorId, int index) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;

  late String date;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SizedBox(
        width: mWidth * .98,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                cWidth10,
                IconButton(
                  iconSize: 15,
                  splashRadius: 15,
                  color: cBlack,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: mWidth * .13, top: mHeight * .01),
                  child: const Text(
                    "Appoinment",
                    style: TextStyle(
                      color: cBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            CalendarDatePicker(
              onDateChanged: (selectedDate) {
                date = selectedDate.toString().split(' ').first;
                showHospitalAppooinmentTimePicker(
                    context, date, fee, hospitalById, doctorId, index);
              },
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
                const Duration(days: 100),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
