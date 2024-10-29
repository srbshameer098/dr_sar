import 'package:drsar/Application/Blocs/Customer/bloc/customer_bloc.dart';
import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/Customer/customer_model.dart';
import 'package:drsar/Presentation/Dialogs/Profile/date_range_picker.dart';
import 'package:drsar/Presentation/Profile/Widgets/patient_history_card.dart';
import 'package:drsar/Presentation/Widgets/CustomDesigns/skelton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHistory extends StatefulWidget {
  const ScreenHistory({Key? key}) : super(key: key);

  @override
  State<ScreenHistory> createState() => _ScreenHistoryState();
}

class _ScreenHistoryState extends State<ScreenHistory> {
  late CustomerModel customerModel;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: (){
        return onPull(context, 'profile',0);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: cWhite,
          elevation: 0,
          title: SizedBox(
            width: mWidth * .6,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                showCalender(context);
              },
              child: const Text("Select Date Range"),
            ),
          ),
        ),
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is CustomerLoading) {
              return Container(
                margin: EdgeInsets.only(top: mHeight * .01),
                padding: EdgeInsets.only(
                  left: mWidth * .05,
                  right: mWidth * .05,
                  top: mHeight * .03,
                ),
                color: cTeal,
                height: mHeight,
                width: mWidth,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) => Container(
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
                        LoadAnimation(
                          child: Container(
                            color: cGrey.withOpacity(.15),
                            height: mHeight * .05,
                          ),
                        ),
                        LoadAnimation(
                          child: Container(
                            color: cGrey.withOpacity(.15),
                            height: mHeight * .05,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            if (state is CustomerLoaded) {
              customerModel =
                  BlocProvider.of<CustomerBloc>(context).customerModel;
              return customerModel.customer!.bookingData!.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: mHeight * .01),
                      padding: EdgeInsets.only(
                        left: mWidth * .05,
                        right: mWidth * .05,
                        top: mHeight * .03,
                      ),
                      color: cTeal,
                      height: mHeight,
                      width: mWidth,
                      child: customerModel.customer!.bookingData!.isNotEmpty
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  customerModel.customer!.bookingData!.length,
                              itemBuilder: (context, index) =>
                                  WidgetPatientHistoryCard(
                                appoinmentDate: customerModel
                                            .customer
                                            ?.bookingData?[index]
                                            .timeSlot
                                            ?.timeSlotsPerDay
                                            ?.appointment
                                            ?.date !=
                                        null
                                    ? customerModel
                                        .customer!
                                        .bookingData![index]
                                        .timeSlot!
                                        .timeSlotsPerDay!
                                        .appointment!
                                        .date!
                                    : " ",
                                reasonForAppoinment: customerModel
                                            .customer
                                            ?.prescription?[index]
                                            .doctorComment !=
                                        null
                                    ? customerModel.customer!
                                        .prescription![index].doctorComment!
                                    : " ",
                                doctorComment: customerModel
                                            .customer
                                            ?.prescription?[index]
                                            .doctorComment !=
                                        null
                                    ? customerModel.customer!
                                        .prescription![index].doctorComment!
                                    : " ",
                                prescriptionImage: customerModel
                                            .customer
                                            ?.prescription?[index]
                                            .prescriptionImg?[0]
                                            .url !=
                                        null
                                    ? customerModel
                                        .customer!
                                        .prescription![index]
                                        .prescriptionImg![0]
                                        .url!
                                    : hospitalNullImage,
                              ),
                            )
                          : const Center(
                              child: Text(
                                "No History",
                                style: TextStyle(
                                  color: cWhite,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                    )
                  : const Center(
                      child: Text(
                        "No Data",
                        style: TextStyle(
                          color: cBlack,
                        ),
                      ),
                    );
            }
            return const Center(
              child: Text("Something Went Wrong"),
            );
          },
        ),
      ),
    );
  }
}
