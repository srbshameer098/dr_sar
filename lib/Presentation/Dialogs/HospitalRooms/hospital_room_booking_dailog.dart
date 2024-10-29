import 'package:drsar/Presentation/Dialogs/HospitalRooms/hospitalroom_booking.dart';
import 'package:flutter/material.dart';

showRoomBooking(context, String roomRate, String roomNumber) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      backgroundColor: Colors.transparent,
      content: HospitalRoomBookingPayment(
          roomRate: roomRate, roomNumber: roomNumber),
    ),
  );
}
