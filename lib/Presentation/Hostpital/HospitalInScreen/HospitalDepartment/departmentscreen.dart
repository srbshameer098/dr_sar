import 'package:drsar/Application/Blocs/Hospital/bloc/hospital_id_bloc.dart';
import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:drsar/Presentation/CustomLoadings/Hospitals/hospital_department_loading.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/HospitalDepartment/hospital_department_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHospitalDepartment extends StatefulWidget {
  const ScreenHospitalDepartment(
      {Key? key, required this.selectedIndex, required this.hospitalId})
      : super(key: key);
  final int selectedIndex;
  final int hospitalId;

  @override
  State<ScreenHospitalDepartment> createState() =>
      _ScreenHospitalDepartmentState();
}

class _ScreenHospitalDepartmentState extends State<ScreenHospitalDepartment> {
  late HospitalById hospitalsWithIdModel;
  late List<Departments> departmentSearch;

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
              return const CustomHospitalDepartmentLoading();
            }
            if (state is HospitalError) {
              return RefreshIndicator(
                onRefresh: () {
                  return onPull(context, 'hospitalid', widget.hospitalId);
                },
                child: const Center(
                  child: Text("Error"),
                ),
              );
            }

            if (state is HospitalSearchFound) {
              departmentSearch =
                  BlocProvider.of<HospitalIdBloc>(context).departmentSearch;
              return RefreshIndicator(
                onRefresh: () {
                  return onPull(context, 'hospitalid', widget.hospitalId);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: mHeight * .03,
                    left: mWidth * .05,
                    right: mWidth * .05,
                  ),
                  child: GridView.builder(
                    itemCount: departmentSearch.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: .9,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        WidgetHospitalDepartmentCard(
                      image:
                          '${imageBaseUrl}hospital/departments/images/${departmentSearch[index].department!.image![index].url!}',
                      departName:
                          departmentSearch[index].department?.name != null
                              ? departmentSearch[index].department!.name!
                              : "Department",
                    ),
                  ),
                ),
              );
            }
            if (state is HospitalLoaded) {
              hospitalsWithIdModel =
                  BlocProvider.of<HospitalIdBloc>(context).hospitalById;
              return RefreshIndicator(
                onRefresh: () {
                  return onPull(context, 'hospitalid', widget.hospitalId);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: mHeight * .03,
                    left: mWidth * .05,
                    right: mWidth * .05,
                  ),
                  child: GridView.builder(
                    itemCount:
                        hospitalsWithIdModel.hospital!.departments!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: .9,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        WidgetHospitalDepartmentCard(
                      image:
                          '${imageBaseUrl}hospital/departments/images/${hospitalsWithIdModel.hospital!.departments![index].department!.image![0].url!}',
                      departName: hospitalsWithIdModel.hospital
                                  ?.departments?[index].department!.name !=
                              null
                          ? hospitalsWithIdModel
                              .hospital!.departments![index].department!.name!
                          : "Department",
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
