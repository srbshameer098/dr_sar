import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/widgets/hospita_doctor_date_picker.dart';
import 'package:flutter/material.dart';

class HospitalDoctorCard extends StatelessWidget {
  const HospitalDoctorCard({
    Key? key,
    required this.doctorName,
    required this.specialization,
    required this.doctorId,
    required this.doctorFee,
    required this.profilePic,
    required this.hospitalById,
    required this.index,
  }) : super(key: key);

  final String profilePic;
  final String doctorName;
  final String specialization;
  final int doctorId;
  final String doctorFee;
  final int index;
  final List<Doctors> hospitalById;

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
              color: hospitalDoctorBookNowButtonColor,
              borderRadius: const BorderRadius.all(cRadius20),
              image: DecorationImage(
                image: NetworkImage(
                  profilePic,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: mWidth * .5,
                child: Text(
                  "Dr. $doctorName",
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
                      onPressed: () => showHospitalDoctorAppoinmentDatePicker(context,
                          doctorFee.toString(), hospitalById, doctorId,index),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            hospitalDoctorBookNowButtonColor),
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
