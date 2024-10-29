import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:drsar/Presentation/Dialogs/HospitalRooms/amenities_dialog.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/HospitalRooms/hospital_rooms.dart';
import 'package:flutter/material.dart';

class WidgetHospitalRoomCard extends StatefulWidget {
  const WidgetHospitalRoomCard({
    Key? key,
    required this.onTap,
    required this.index,
    required this.roomNumber,
    required this.roomType,
    required this.roomRate,
    required this.hospitalById,
  }) : super(key: key);

  final VoidCallback onTap;
  final int index;
  final String roomNumber;
  final String roomType;
  final String roomRate;
  final HospitalById hospitalById;

  @override
  State<WidgetHospitalRoomCard> createState() => _WidgetHospitalRoomCardState();
}


class _WidgetHospitalRoomCardState extends State<WidgetHospitalRoomCard> {


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery
        .of(context)
        .size
        .height;
    final mWidth = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        child: ValueListenableBuilder(
          valueListenable: isSelectedNotifier,
          builder: (BuildContext context, String isSelected, _) {
            return Container(
              height: mHeight * .15,
              width: mWidth * .9,
              decoration: BoxDecoration(
                color: isSelected == widget.index.toString()
                    ? cRoomSelectedColor
                    : cWhite,
                borderRadius: BorderRadius.circular(30),
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
                    height: mHeight * .12,
                    width: mWidth * .18,
                    margin: EdgeInsets.only(left: mWidth * .05),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected == widget.index.toString()
                          ? cBlue.withOpacity(.8)
                          : cWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "BOOK\n",
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected == widget.index.toString()
                                  ? cWhite
                                  : cBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "NOW",
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected == widget.index.toString()
                                  ? cWhite
                                  : cBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: mWidth * .025,
                      right: mWidth * .25,
                    ),
                    padding: EdgeInsets.only(
                        top: mHeight * .01, bottom: mHeight * .01),
                    height: mHeight * .13,
                    width: mWidth * .25,
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Room ${widget.roomNumber}",
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected == widget.index.toString()
                                ? cWhite
                                : cBlack,
                          ),
                        ),
                        Text(
                          widget.roomType,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected == widget.index.toString()
                                ? cWhite
                                : cBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Button For show Amenities
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        showAmenities(
                            context,
                            widget
                                .hospitalById.hospital!.rooms![widget.index].room!.amenities!);
                      },
                      icon: const Icon(Icons.more_horiz),
                      splashRadius: 10,
                      color: isSelected == widget.index.toString()
                          ? cWhite
                          : cBlack,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
