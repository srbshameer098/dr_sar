import 'package:drsar/Application/Blocs/Doctors/bloc/doctors_bloc.dart';
import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/Doctors/doctors_model.dart';
import 'package:drsar/Presentation/CustomLoadings/DoctorScreen/doctor_loading.dart';
import 'package:drsar/Presentation/DoctorScreen/Widgets/widgetdoctorbooking.dart';
import 'package:drsar/Presentation/Widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDoctor extends StatefulWidget {
  const ScreenDoctor({Key? key}) : super(key: key);

  @override
  State<ScreenDoctor> createState() => _ScreenDoctorState();
}

class _ScreenDoctorState extends State<ScreenDoctor> {
  late List<DoctorsModel> doctorsModel;
  late List<DoctorsModel> doctorSearchList;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          return onPull(context, 'doctor', 0);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool isInnerBodyScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                snap: true,
                title: Padding(
                  padding: EdgeInsets.only(
                    top: mHeight * .02,
                  ),
                  child: SearchBar(
                    isVisible: false,
                    hospitalName: " ",
                    search: (value) {
                      BlocProvider.of<DoctorsBloc>(context).add(
                        SearchDoctorEvent(value),
                      );
                    },
                  ),
                ),
              )
            ],
            body: BlocBuilder<DoctorsBloc, DoctorsState>(
              builder: (context, state) {
                if (state is DoctorsLoading) {
                  return SizedBox(
                    height: mHeight,
                    width: mWidth,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: mHeight * .8,
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) =>
                            const CustomDoctorLoading(),
                      ),
                    ),
                  );
                }
                if (state is DoctorsError) {
                  return const Center(
                    child: Text("Error"),
                  );
                }
                if (state is SearchDoctorDataLoaded) {
                  doctorSearchList =
                      BlocProvider.of<DoctorsBloc>(context).doctorSearchList;

                  return SizedBox(
                    height: mHeight,
                    width: mWidth,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: mHeight * .8,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: doctorSearchList.length,
                        itemBuilder: (context, index) => WidgetDoctorBooking(
                          index: index,
                          doctorId: doctorSearchList[index].doctor!.id!.toInt(),
                          doctorsModel: doctorSearchList,
                          doctor: doctorSearchList[index].doctor?.name != null
                              ? doctorSearchList[index].doctor!.name!
                              : "Doctor",
                          specialization: doctorSearchList[index]
                                      .doctor
                                      ?.specialization !=
                                  null
                              ? doctorSearchList[index].doctor!.specialization!
                              : "Specialization",
                          image: doctorSearchList[index]
                                      .doctor
                                      ?.profilePic!
                                      .url !=
                                  null
                              ? '${imageBaseUrl}doctor/images/${doctorSearchList[index].doctor!.profilePic!.url!}'
                              : doctorNull,
                          fee: doctorSearchList[index]
                                      .doctor
                                      ?.fee
                                      ?.toString() !=
                                  null
                              ? doctorSearchList[index].doctor!.fee!.toString()
                              : '00',
                        ),
                      ),
                    ),
                  );
                }

                if (state is SearchDoctorNotFound) {
                  return RefreshIndicator(
                    onRefresh: () {
                      return onPull(context, 'doctor', 0);
                    },
                    child: const Center(
                      child: Text(
                        "No Search Result",
                        style: TextStyle(color: cBlack),
                      ),
                    ),
                  );
                }
                if (state is DoctorsLoaded) {
                  doctorsModel =
                      BlocProvider.of<DoctorsBloc>(context).doctorsModel;

                  return RefreshIndicator(
                    onRefresh: () {
                      return onPull(context, 'doctor', 0);
                    },
                    child: SizedBox(
                      height: mHeight,
                      width: mWidth,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: mHeight * .8,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: doctorsModel.length,
                          itemBuilder: (context, index) => WidgetDoctorBooking(
                            index: index,
                            doctorsModel: doctorsModel,
                            doctorId: doctorsModel[index].doctor?.id != null
                                ? doctorsModel[index].doctor!.id!.toInt()
                                : 0,
                            doctor: doctorsModel[index].doctor?.name != null
                                ? doctorsModel[index].doctor!.name!
                                : "Doctor",
                            specialization: doctorsModel[index]
                                        .doctor
                                        ?.specialization !=
                                    null
                                ? doctorsModel[index].doctor!.specialization!
                                : "Specialization",
                            image: doctorsModel[index]
                                        .doctor
                                        ?.profilePic!
                                        .url !=
                                    null
                                ? '${imageBaseUrl}doctor/images/${doctorsModel[index].doctor!.profilePic!.url!}'
                                : doctorNull,
                            fee: doctorsModel[index].doctor?.fee != null
                                ? doctorsModel[index].doctor!.fee!
                                : '00',
                          ),
                        ),
                      ),
                    ),
                  );
                }
                if (state is SessionExpired) {
                  return const Center(
                    child: Text(
                      "Sorry Your Session is Expired",
                      style: TextStyle(color: cBlack),
                    ),
                  );
                }

                return const Center(
                  child: Text(
                    "Somthing Went Wrong",
                    style: TextStyle(color: cBlack),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
