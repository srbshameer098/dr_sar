import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/widgets/hospital_doctor_booking.dart';
import 'package:flutter/material.dart';

showHospitalAppooinmentTimePicker(context, date, String fee, List<Doctors> doctorsModel,
    int doctorId,int index) {
  final mWidth = MediaQuery.of(context).size.width;

  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    constraints: BoxConstraints(maxWidth: mWidth * .8),
    builder: (BuildContext context) {
      return HopitalDoctorBooking(
        date: date,
        fee: fee,
        availableTime: doctorsModel,
        doctorId: doctorId,
        index: index,
      );
    },
  );
}
