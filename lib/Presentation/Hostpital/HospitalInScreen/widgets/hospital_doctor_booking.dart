import 'package:drsar/Application/Blocs/AppoinmentsBloc/bloc/appoinments_bloc_bloc.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/HospitalId/hospital_id_model.dart';
import 'package:drsar/Presentation/Dialogs/custom_transistion_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

int hospitalTimeSlotId = 0;
TextEditingController hospitalReasonController = TextEditingController();

class HopitalDoctorBooking extends StatefulWidget {
  HopitalDoctorBooking({
    Key? key,
    required this.date,
    required this.fee,
    required this.availableTime,
    required this.doctorId,
    required this.index,
  }) : super(key: key);

  final String date;
  final String fee;
  final List<Doctors> availableTime;
  final int doctorId;
  late String selectedTime;
  final int index;

  @override
  State<HopitalDoctorBooking> createState() => _HopitalDoctorBookingState();
}

class _HopitalDoctorBookingState extends State<HopitalDoctorBooking> {
  List<DoctorAppointments>? timeByDate = [];
  List<Times> times = [];
  late Razorpay razorpay;
  final TextEditingController reasonController = TextEditingController();
  late String selectedTime;

  late int timeLength;

  @override
  void initState() {
    razorpay = Razorpay();
    if (widget.availableTime.isNotEmpty) {
      timeByDate = widget
          .availableTime[widget.index].doctor!.doctorAppointments!
          .where(
              (element) => element.date!.split('T').first.contains(widget.date))
          .toList();
      if (timeByDate!.isNotEmpty) {
        if (timeByDate![0].timeSlots != null) {
          times = timeByDate![0].timeSlots![0].times!;
          timeLength = times.length;
        } else {
          return;
        }
      }

      super.initState();
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerFailure);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    }
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  ValueNotifier<String> isTimeSelectedNotifier = ValueNotifier(" ");

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocListener<AppoinmentsBloc, AppoinmentsState>(
      listener: (context, state) {
        if (state is TakeAppoinmentLaoding) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: Container(
                  color: Colors.transparent,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  )),
            ),
          );
        }
        if (state is TakeAppoinmentSuccessfull) {
          showCustomDialog(
            context,
            "Appoinment Successfully Completed",
            Icons.done,
            Colors.green,
          );
        }
        if (state is AppoinmentFailed) {
          showCustomDialog(
            context,
            "Appoinment Failed",
            Icons.cancel,
            cRed,
          );
        }
      },
      child: ValueListenableBuilder(
        valueListenable: isTimeSelectedNotifier,
        builder: (BuildContext context, String isTimeSelected, _) {
          return Container(
            padding: EdgeInsets.only(
              top: mHeight * .02,
              left: mWidth * .05,
              right: mWidth * .05,
              bottom: mHeight * .03,
            ),
            decoration: const BoxDecoration(
              color: cTeal,
              borderRadius: BorderRadius.only(
                topRight: cRadius20,
                topLeft: cRadius20,
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: cTeal,
              body: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 15,
                        splashRadius: 15,
                        color: cWhite,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mWidth * .1),
                        child: Text(
                          widget.date,
                          style: const TextStyle(
                            color: cWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: mHeight * .05,
                    width: mWidth * .6,
                    decoration: BoxDecoration(
                      color: cWhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: hospitalReasonController,
                      decoration: InputDecoration(
                        fillColor: cGrey.withOpacity(.15),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Reason for Appoinment',
                        hintStyle: TextStyle(
                          color: cGrey.withOpacity(.5),
                        ),
                        contentPadding: const EdgeInsets.only(left: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: cGrey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Consulting Fee",
                        style: TextStyle(
                          color: cWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      cWidth10,
                      Container(
                        height: mHeight * .04,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: cWhite,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(cRadius10),
                        ),
                        child: Text(
                          "\u20B9${widget.fee}",
                          style: const TextStyle(
                            color: cWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: mHeight * .03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: cWhite,
                          ),
                        ),
                        Container(
                          height: timeByDate!.isNotEmpty && timeByDate![0].timeSlots != null
                              ? mHeight * 3 / timeLength
                              : mHeight * .1,
                          margin: EdgeInsets.only(
                            top: mHeight * .03,
                            bottom: mHeight * .01,
                          ),
                          child: timeByDate!.isNotEmpty && timeByDate![0].timeSlots != null
                              ? GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1,
                                    mainAxisExtent: mHeight * .05,
                                  ),
                                  itemCount: times.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        isTimeSelectedNotifier.value =
                                            index.toString();
                                        selectedTime = times[index]
                                            .time!
                                            .split('T')
                                            .last
                                            .split('.')
                                            .first;
                                        hospitalTimeSlotId =
                                            times[index].id!.toInt();
                                      },
                                      child: Container(
                                        height: mHeight * .05,
                                        width: mWidth * .30,
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color:
                                              isTimeSelected == index.toString()
                                                  ? cSelectedSlotColor
                                                  : Colors.transparent,
                                          border: Border.all(
                                            color: cWhite,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              const BorderRadius.all(cRadius10),
                                        ),
                                        child: Text(
                                          times[index]
                                              .time!
                                              .split('T')
                                              .last
                                              .split('.')
                                              .first,
                                          style: const TextStyle(
                                            color: cWhite,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child:
                                      Text("Doctor Not Available at this Date"),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SizedBox(
                width: mWidth * .8,
                height: mHeight * .06,
                child: AbsorbPointer(
                  absorbing: isTimeSelected == " ",
                  child: ElevatedButton(
                    onPressed: () {
                      openCheckout();
                    },
                    style: ButtonStyle(
                      backgroundColor: isTimeSelected != " "
                          ? cHospitalDoctorBookNowBackgroundColor
                          : MaterialStateProperty.all(
                              cWhite.withOpacity(0.5),
                            ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                        color: cHospitalDoctorBookNowTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void openCheckout() async {
    final prefs = await SharedPreferences.getInstance();
    var options = {
      "key": "rzp_live_U48dFPJThOVQ6N",
      "amount": num.parse(widget.fee) * 100,
      "name": "DrSar",
      "description": "Paying ${widget.fee} for Booking Doctor }",
      "prefill": {
        "name": prefs.getString('name'),
        "email": prefs.getString('email'),
        "contact": prefs.getString('phone')
      },
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay.open(options);
    } catch (error) {
      print("otionserro$error");
    }
  }

  void handlerPaymentSuccess() {
    print("payment Success");
    BlocProvider.of<AppoinmentsBloc>(context).add(TakeAppoinmentsEvent(
        hospitalTimeSlotId, hospitalReasonController.text));
    Toast.show("payment Success");
  }

  void handlerFailure() {
    print("payment Failure");
    Toast.show("payment Failure");
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet");
  }
}
