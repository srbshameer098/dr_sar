import 'package:drsar/Application/Blocs/Hospital/bloc/hospital_id_bloc.dart';
import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:drsar/Presentation/CustomLoadings/Hospitals/hospital_doctor_skelton.dart';
import 'package:drsar/Presentation/Dialogs/HospitalRooms/hospital_room_booking_dailog.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/HospitalRooms/hospital_room_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final ValueNotifier<String> isSelectedNotifier = ValueNotifier(" ");

class ScreenHospitalRooms extends StatefulWidget {
  const ScreenHospitalRooms({Key? key, required this.hospitalId})
      : super(key: key);

  final int hospitalId;

  @override
  State<ScreenHospitalRooms> createState() => _ScreenHospitalRoomsState();
}

class _ScreenHospitalRoomsState extends State<ScreenHospitalRooms> {
  late HospitalById hospitalById;
  late List<Rooms> hospitalRoom;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () {
        return onPull(context, 'hospitalid', widget.hospitalId);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<HospitalIdBloc, HospitalIdState>(
          builder: (context, state) {
            if (state is HospitalLoading) {
              return const CustomHospitalRoomsLoading();
            }
            if (state is HospitalError) {
              RefreshIndicator(
                onRefresh: () {
                  return onPull(context, 'hospitalid', widget.hospitalId);
                },
                child: const Center(
                  child: Text(
                    "Error Bloc",
                    style: TextStyle(
                      color: cBlack,
                      fontSize: 30,
                    ),
                  ),
                ),
              );
            }

            if (state is HospitalSearchFound) {
              hospitalRoom =
                  BlocProvider.of<HospitalIdBloc>(context).hospitalRoom;
              return RefreshIndicator(
                onRefresh: () {
                  return onPull(context, 'hospitalid', widget.hospitalId);
                },
                child: SizedBox(
                  height: mHeight,
                  width: mWidth,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: mHeight * .8,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: hospitalRoom.length,
                      itemBuilder: (context, index) => WidgetHospitalRoomCard(
                        hospitalById: hospitalById,
                        roomNumber: hospitalRoom[index].room?.roomNum != null
                            ? hospitalRoom[index].room!.roomNum!
                            : " ",
                        roomRate: hospitalRoom[index].room!.rate!,
                        roomType: hospitalRoom[index].room!.roomType!.name!,
                        onTap: () {
                          isSelectedNotifier.value = index.toString();
                          showRoomBooking(
                            context,
                            hospitalRoom[index].room?.rate != null
                                ? hospitalRoom[index].room!.rate!.toString()
                                : 000.toString(),
                            hospitalRoom[index].room?.roomNum != null
                                ? hospitalRoom[index].room!.roomNum!
                                : " ",
                          );
                        },
                        index: index,
                      ),
                    ),
                  ),
                ),
              );
            }
            if (state is HospitalSearchNotFound) {
              return RefreshIndicator(
                onRefresh: () {
                  return onPull(context, 'hospitalid', widget.hospitalId);
                },
                child: const Center(
                  child: Text(
                    "No Search Result",
                    style: TextStyle(color: cBlack),
                  ),
                ),
              );
            }
            if (state is HospitalLoaded) {
              hospitalById =
                  BlocProvider.of<HospitalIdBloc>(context).hospitalById;
              return RefreshIndicator(
                onRefresh: () {
                  return onPull(context, 'hospitalid', widget.hospitalId);
                },
                child: SizedBox(
                  height: mHeight,
                  width: mWidth,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: mHeight * .8,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: hospitalById.hospital!.rooms!.length,
                      itemBuilder: (context, index) => WidgetHospitalRoomCard(
                        hospitalById: hospitalById,
                        roomNumber: hospitalById
                                    .hospital?.rooms?[index].room?.roomNum !=
                                null
                            ? hospitalById.hospital!.rooms![index].room!.roomNum!
                            : " ",
                        roomRate:
                            hospitalById.hospital?.rooms?[index].room?.rate !=
                                    null
                                ? hospitalById.hospital!.rooms![index].room!.rate!
                                : '000',
                        roomType: hospitalById.hospital?.rooms?[index].room
                                    ?.roomType?.name !=
                                null
                            ? hospitalById
                                .hospital!.rooms![index].room!.roomType!.name!
                            : "type",
                        onTap: () {
                          isSelectedNotifier.value = index.toString();
                          showRoomBooking(
                            context,
                            hospitalById.hospital?.rooms?[index].room?.rate !=
                                    null
                                ? hospitalById.hospital!.rooms![index].room!.rate!
                                : '000',
                            hospitalById.hospital?.rooms?[index].room?.roomNum !=
                                    null
                                ? hospitalById
                                    .hospital!.rooms![index].room!.roomNum!
                                : " ",
                          );
                        },
                        index: index,
                      ),
                    ),
                  ),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () {
                return onPull(context, 'hospitalid', widget.hospitalId);
              },
              child: const Center(
                child: Text(
                  "Something went wrong\n please try again",
                  style: TextStyle(
                    color: cBlack,
                    fontSize: 30,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
