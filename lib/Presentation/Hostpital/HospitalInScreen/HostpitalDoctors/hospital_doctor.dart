import 'package:drsar/Application/Blocs/Hospital/bloc/hospital_id_bloc.dart';
import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/HostpitalDoctors/hospital_doctor_card.dart';
import 'package:drsar/Presentation/Widgets/CustomDesigns/skelton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHospitalDoctor extends StatefulWidget {
  const ScreenHospitalDoctor(
      {Key? key, required this.selectedIndex, required this.hospitalId})
      : super(key: key);

  final int selectedIndex;
  final int hospitalId;

  @override
  State<ScreenHospitalDoctor> createState() => _ScreenHospitalDoctorState();
}

class _ScreenHospitalDoctorState extends State<ScreenHospitalDoctor> {
  late HospitalById hospitalById;
  late List<Doctors> hospitalDoctorSearch;

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
              return SizedBox(
                height: mHeight,
                width: mWidth,
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: mHeight * .8,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) => Container(
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
                          LoadAnimation(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: mWidth * .1, right: mWidth * .05),
                              height: mHeight * .12,
                              width: mWidth * .23,
                              decoration: const BoxDecoration(
                                color: hospitalDoctorBookNowButtonColor,
                                borderRadius: BorderRadius.all(cRadius20),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              LoadAnimation(
                                child: Container(
                                  color: cGrey.withOpacity(.15),
                                  width: mWidth * .5,
                                  height: mHeight * .05,
                                ),
                              ),
                              LoadAnimation(
                                child: Container(
                                  color: cGrey.withOpacity(.15),
                                  width: mWidth * .5,
                                  height: mHeight * .02,
                                ),
                              ),
                              Row(
                                children: [
                                  LoadAnimation(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      width: mWidth * .5,
                                      height: mHeight * .02,
                                      color: cGrey.withOpacity(.15),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            if (state is HospitalError) {
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
            }

            if (state is HospitalSearchFound) {
              hospitalDoctorSearch =
                  BlocProvider.of<HospitalIdBloc>(context).hospitalDoctor;

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
                      itemCount: hospitalDoctorSearch.length,
                      itemBuilder: (context, index) => HospitalDoctorCard(
                        index: index,
                        doctorId:
                            hospitalDoctorSearch[index].doctor!.id!.toInt(),
                        hospitalById: hospitalById.hospital!.doctors!,
                        doctorFee:
                            hospitalDoctorSearch[index].doctor?.fee != null
                                ? hospitalDoctorSearch[index]
                                    .doctor!
                                    .fee!
                                    .toString()
                                : '00',
                        profilePic: hospitalDoctorSearch[index]
                                    .doctor
                                    ?.profilePic
                                    ?.url !=
                                null
                            ? '${imageBaseUrl}doctor/images/${hospitalDoctorSearch[index].doctor!.profilePic!.url!}'
                            : " ",
                        doctorName:
                            hospitalDoctorSearch[index].doctor?.name != null
                                ? hospitalDoctorSearch[index].doctor!.name!
                                : " ",
                        specialization: hospitalDoctorSearch[index]
                                    .doctor
                                    ?.specialization !=
                                null
                            ? hospitalDoctorSearch[index]
                                .doctor!
                                .specialization!
                            : " ",
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
              print(hospitalById.hospital!.doctors![0].doctor!
                  .doctorAppointments![0].date);
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
                      itemCount: hospitalById.hospital!.doctors!.length,
                      itemBuilder: (context, index) => HospitalDoctorCard(
                        index: index,
                        hospitalById: hospitalById.hospital!.doctors!,
                        doctorFee: hospitalById
                                    .hospital?.doctors?[index].doctor?.fee !=
                                null
                            ? hospitalById
                                .hospital!.doctors![index].doctor!.fee!
                            : '000',
                        profilePic: hospitalById.hospital?.doctors?[index]
                                    .doctor?.profilePic?.url !=
                                null
                            ? '${imageBaseUrl}doctor/images/${hospitalById.hospital!.doctors![index].doctor!.profilePic!.url!}'
                            : " ",
                        doctorId: hospitalById
                                    .hospital?.doctors?[index].doctor?.id !=
                                null
                            ? hospitalById.hospital!.doctors![index].doctor!.id!
                                .toInt()
                            : 0,
                        doctorName: hospitalById
                                    .hospital?.doctors?[index].doctor?.name !=
                                null
                            ? hospitalById
                                .hospital!.doctors![index].doctor!.name!
                            : " ",
                        specialization: hospitalById.hospital?.doctors?[index]
                                    .doctor?.specialization !=
                                null
                            ? hospitalById.hospital!.doctors![index].doctor!
                                .specialization!
                            : "specialization",
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
