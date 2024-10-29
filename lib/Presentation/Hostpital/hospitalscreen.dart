import 'package:drsar/Application/Blocs/Hospitals/hospitals_bloc.dart';
import 'package:drsar/Application/UserLocation/get_user_location.dart';
import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/Hospitals/hospitalsmodel.dart';
import 'package:drsar/Presentation/CustomLoadings/Hospitals/hospital_skelton_loading.dart';
import 'package:drsar/Presentation/Dialogs/session_expired.dart';
import 'package:drsar/Presentation/Hostpital/Widgets/hospitaldetails.dart';
import 'package:drsar/Presentation/Widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

class ScreenHospital extends StatefulWidget {
  const ScreenHospital({Key? key}) : super(key: key);

  @override
  State<ScreenHospital> createState() => _ScreenHospitalState();
}

class _ScreenHospitalState extends State<ScreenHospital> {
  late List<HospitalsModel> hospitalsModel;
  late List<HospitalsModel> searchList;
  List<Placemark>? hospitalLocation;
  ValueNotifier<String> hospitalLocationNotifier = ValueNotifier(" ");

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: RefreshIndicator(
          onRefresh: () {
            print("pulled");
            return onPull(context, 'hospital', 0);
          },
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                snap: true,
                title: Padding(
                  padding: EdgeInsets.only(top: mHeight * .02),
                  child: SearchBar(
                    isVisible: false,
                    hospitalName: " ",
                    search: (value) {
                      BlocProvider.of<HospitalsBloc>(context).add(
                        SearchHospitalEvent(value),
                      );
                    },
                  ),
                ),
              ),
            ],
            body: BlocBuilder<HospitalsBloc, HospitalsState>(
              builder: (context, state) {
                if (state is SessionExpired) {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => showAlertDialog(context));
                }

                if (state is HospitalsDataLoading) {
                  return SizedBox(
                    height: mHeight,
                    width: mWidth,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: mHeight * .8,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) =>
                            const CustomHospitalLoading(),
                      ),
                    ),
                  );
                }
                if (state is HospitalsDataError) {
                  return RefreshIndicator(
                    onRefresh: () {
                      print("pulled");
                      return onPull(context, 'hospital', 0);
                    },
                    child: const Center(
                      child: Text(
                        "Something went wrong",
                        style: TextStyle(
                          color: cBlack,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  );
                }
                if (state is HospitalsDataLoaded) {
                  hospitalsModel =
                      BlocProvider.of<HospitalsBloc>(context).hospitalsModel;

                  return ValueListenableBuilder(
                    valueListenable: hospitalLocationNotifier,
                    builder: (BuildContext context, String hLocation, _) {
                      return RefreshIndicator(
                        onRefresh: () {
                          print("pulled");
                          return onPull(context, 'hospital', 0);
                        },
                        child: SizedBox(
                          height: mHeight,
                          width: mWidth,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: hospitalsModel.length,
                            itemBuilder: (context, index) {
                              double hospitalLatitude = double.parse(
                                  hospitalsModel[index].location!.latitude!);
                              double hospitalLongitude = double.parse(
                                  hospitalsModel[index].location!.longitude!);
                              // Get hospital Location from coordinates
                              getUserCurrentLocation().then(
                                (hospital) async {
                                  hospitalLocation =
                                      await placemarkFromCoordinates(
                                          hospitalLatitude, hospitalLongitude);

                                  Placemark place = hospitalLocation![0];
                                  hospitalLocationNotifier.value =
                                      "${place.name}".toString();
                                },
                              );
                              return HospitalDetailsCard(
                                selctedIndex: index,
                                // Hospital ID
                                hospitalId:
                                    hospitalsModel[index].authId!.toInt(),
                                // HospitalName
                                hospitalName: hospitalsModel[index].name != null
                                    ? hospitalsModel[index].name!
                                    : " ",
                                // HospitalDescription
                                description:
                                    hospitalsModel[index].description != null
                                        ? hospitalsModel[index].description!
                                        : " ",
                                // HospitalImage
                                image: hospitalsModel[index].images?[0].url !=
                                        null
                                    ? '${imageBaseUrl}hospital/images/${hospitalsModel[index].images![0].url!}'
                                    : hospitalNullImage,
                                // HospitalLocation
                                location: hLocation,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is SearchHospitalsDataLoaded) {
                  searchList =
                      BlocProvider.of<HospitalsBloc>(context).searchList;
                  return ValueListenableBuilder(
                    valueListenable: hospitalLocationNotifier,
                    builder: (BuildContext context, String hLocation, _) {
                      return RefreshIndicator(
                        onRefresh: () {
                          print("pulled");
                          return onPull(context, 'hospital', 0);
                        },
                        child: SizedBox(
                          height: mHeight,
                          width: mWidth,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: searchList.length,
                            itemBuilder: (context, index) {
                              double hospitalLatitude = double.parse(
                                  searchList[index].location!.latitude!);
                              double hospitalLongitude = double.parse(
                                searchList[index].location!.longitude!,
                              );
                              // Get hospital Location from coordinates
                              getUserCurrentLocation().then(
                                (hospital) async {
                                  hospitalLocation =
                                      await placemarkFromCoordinates(
                                          hospitalLatitude, hospitalLongitude);

                                  Placemark place = hospitalLocation![0];
                                  hospitalLocationNotifier.value =
                                      "${place.name}".toString();
                                },
                              );
                              return HospitalDetailsCard(
                                selctedIndex: index,
                                // Hospital ID
                                hospitalId: searchList[index].authId!.toInt(),
                                // HospitalName
                                hospitalName: searchList[index].name != null
                                    ? searchList[index].name!
                                    : " ",
                                // HospitalDescription
                                description:
                                    searchList[index].description != null
                                        ? searchList[index].description!
                                        : " ",
                                // HospitalImage
                                image: searchList[index].images?[0].url != null
                                    ? '${imageBaseUrl}hospital/images/${searchList[index].images![0].url!}'
                                    : hospitalNullImage,
                                // HospitalLocation
                                location: hLocation,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is SearchHospitalNotFound) {
                  return const Center(
                    child: Text("No Search Result"),
                  );
                }
                return const Center(
                  child: Text(
                    "Something went wrong\n please try again",
                    style: TextStyle(
                      color: cBlack,
                      fontSize: 30,
                    ),
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
