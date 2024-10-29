import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Presentation/Profile/history/history_details_page.dart';
import 'package:flutter/material.dart';

class WidgetPatientHistoryCard extends StatelessWidget {
  const WidgetPatientHistoryCard({
    Key? key,
    required this.appoinmentDate,
    required this.reasonForAppoinment,
    required this.prescriptionImage,
    required this.doctorComment,
  }) : super(key: key);

  final String appoinmentDate;
  final String prescriptionImage;
  final String doctorComment;
  final String reasonForAppoinment;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ScreenPatientHistory(
            appoinmentDate: appoinmentDate,
            reasonForAppoinment: reasonForAppoinment,
            doctorComment: doctorComment,
            prescriptionImage: prescriptionImage,
          ),
        ),
      ),
      child: Container(
        height: mHeight * .15,
        width: mWidth,
        margin: EdgeInsets.only(bottom: mHeight * .01),
        padding: EdgeInsets.only(
          left: mWidth * .05,
          top: mHeight * .01,
        ),
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: cGrey.withOpacity(.5),
              offset: const Offset(0.0, 0.0),
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              appoinmentDate,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: cBlack,
              ),
            ),
            Text(
              reasonForAppoinment,
              style: const TextStyle(
                fontSize: 12,
                color: cBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
