import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class HospitalRoomBookingPayment extends StatefulWidget {
  const HospitalRoomBookingPayment({
    Key? key,
    required this.roomRate,
    required this.roomNumber,
  }) : super(key: key);

  final String roomRate;
  final String roomNumber;

  @override
  State<HospitalRoomBookingPayment> createState() =>
      _HospitalRoomBookingPaymentState();
}

class _HospitalRoomBookingPaymentState
    extends State<HospitalRoomBookingPayment> {
  late Razorpay razorpay;

  @override
  void initState() {
    razorpay = Razorpay();
    super.initState();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: mWidth * .05,
        right: mWidth * .05,
        top: mHeight * .01,
        bottom: mHeight * .01,
      ),
      // height: mHeight * .5,
      width: mWidth * .8,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarDatePicker(
            onDateChanged: (selectedDate) {},
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 30)),
          ),
          const Text(
            "Rate",
            style: TextStyle(
              color: cBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: mHeight * .05,
            width: mWidth * .25,
            padding: const EdgeInsets.only(left: 5, right: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cRoomSelectedColor,
              border: Border.all(
                color: cWhite,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(cRadius10),
            ),
            child: Text(
              widget.roomRate,
              style: TextStyle(
                color: cWhite,
              ),
            ),
          ),
          cHeight10,
          SizedBox(
            width: mWidth * .8,
            height: mHeight * .06,
            child: ElevatedButton(
              onPressed: () {
                openCheckout();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(cTeal),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                "Book Now",
                style: TextStyle(
                  color: cWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openCheckout() async {
    final prefs = await SharedPreferences.getInstance();
    var options = {
      "key": "rzp_live_U48dFPJThOVQ6N",
      "amount": num.parse(widget.roomRate) * 100,
      "name": "DrSar",
      "description":
          "Paying ${widget.roomRate} for Booking Room No ${widget.roomNumber} }",
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
