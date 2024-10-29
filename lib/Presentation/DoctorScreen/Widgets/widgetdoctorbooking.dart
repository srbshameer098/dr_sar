import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/Doctors/doctors_model.dart';
import 'package:drsar/Presentation/Dialogs/HospitalDoctor/date_picker_dialog.dart';
import 'package:flutter/material.dart';

class WidgetDoctorBooking extends StatelessWidget {
  const WidgetDoctorBooking({
    Key? key,
    required this.doctor,
    required this.specialization,
    required this.image,
    required this.fee,
    required this.doctorsModel,
    required this.doctorId,
    required this.index
  }) : super(key: key);

  final String doctor;
  final String specialization;
  final String image;
  final String fee;
  final int doctorId;
  final int index;
  final List<DoctorsModel>? doctorsModel;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mHeight * .15,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(cRadius10),
        boxShadow: [
          BoxShadow(
            color: cGrey.withOpacity(.5),
            offset: const Offset(0.0, 0.0),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 40, right: 10),
            height: mHeight * .12,
            width: mWidth * .23,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(cRadius20),
                image: DecorationImage(image: NetworkImage(image))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: mWidth * .5,
                child: Text(
                  "Dr $doctor",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: mWidth * .5,
                child: Text(
                  specialization,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff777f86),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: mWidth * .5,
                    height: mHeight * .03,
                    child: ElevatedButton(
                      onPressed: () {
                        showDoctorAppoinmentDatePicker(
                          context,
                          fee.toString(),
                          doctorsModel,
                          doctorId,
                          index,
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(cBookNowColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                            Size(mWidth * .3, mHeight * .03)),
                      ),
                      child: const Text(
                        "Book Now",
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
