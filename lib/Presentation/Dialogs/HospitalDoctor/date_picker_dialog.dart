
import 'package:dr_sar/Presentation/Dialogs/HospitalDoctor/time_slot_booking_dailog.dart';
import 'package:flutter/material.dart';

import '../../../Domain/Constants/Color/colors.dart';
import '../../../Domain/Constants/constants.dart';
import '../../../Domain/Models/Doctors/doctors_model.dart';

showDoctorAppoinmentDatePicker(context, String fee, List<DoctorsModel>? doctorsModel,int doctorId,int index) {

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
                showAppooinmentTimePicker(context, date, fee, doctorsModel,doctorId,index);

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
