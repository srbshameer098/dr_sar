import 'package:drsar/Domain/Models/Doctors/doctors_model.dart';
import 'package:drsar/Presentation/Widgets/time_slot_booking_widget.dart';
import 'package:flutter/material.dart';

showAppooinmentTimePicker(context, date, String fee, List<DoctorsModel>? doctorsModel,
    int doctorId,int index) {
  final mWidth = MediaQuery.of(context).size.width;

  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    constraints: BoxConstraints(maxWidth: mWidth * .8),
    builder: (BuildContext context) {
      return DoctorBooking(
        date: date,
        fee: fee,
        availableTime: doctorsModel,
        doctorId: doctorId,
        index: index,
      );
    },
  );
}
