import 'dart:async';

import 'package:drsar/Application/Blocs/Sos/sos_bloc.dart';
import 'package:drsar/Application/UserLocation/get_user_location.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Presentation/SplashScreen/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
class WidgetSosButton extends StatefulWidget {
  const WidgetSosButton({Key? key}) : super(key: key);

  @override
  State<WidgetSosButton> createState() => _WidgetSosButtonState();
}

class _WidgetSosButtonState extends State<WidgetSosButton> {
  // showSosDialog(BuildContext context){
  //   showDialog(
  //     context: context,
  //     builder: (context) => StatefulBuilder(
  //         builder: (context, setState) {
  //           return Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 "Emergency Sos",
  //                 style: TextStyle(
  //                   fontSize: 38,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               SizedBox(height: 50,),
  //               CircleAvatar(
  //                 radius: 60,
  //                 backgroundColor: cRed,
  //                 child: Text(
  //                   "$_start",
  //                   style: TextStyle(fontSize: 40, color: cWhite),
  //                 ),
  //               ),
  //             ],
  //           );
  //         }
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(mHeight * .008),
      width: mWidth * .1,
      height: mHeight * 0.05,
      decoration: BoxDecoration(
        // for change the color go to colors.dart in Domain/Constants
        color: fltContainerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RawMaterialButton(
        // for change the color go to colors.dart in Domain/Constants
        fillColor: sosColor,
        shape: const CircleBorder(),
        elevation: 0.0,
        child: const Text(
          "SOS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        onPressed: () {
          // startTimer();
          // showSosDialog(context);
          showDialog(
              context: context,
              builder: (_) {
                return const SosDialog();
              });
          print("sos");
        },
      ),
    );
  }
}

class SosDialog extends StatefulWidget {
  const SosDialog({Key? key}) : super(key: key);

  @override
  State<SosDialog> createState() => _SosDialogState();
}

class _SosDialogState extends State<SosDialog> {
  Timer? _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countNotifier.value == 0) {
          setState(() {
            print("timer stopper");
            timer.cancel();
          });
          getUserCurrentLocation().then((coordinates) async {
            userLocation = await placemarkFromCoordinates(
                coordinates.latitude, coordinates.longitude);
            Placemark place = userLocation![0];
            // addressNotifier.value = "${place.locality}".toString();
            BlocProvider.of<SosBloc>(context).add(
              CallSos(coordinates.latitude.toString(),
                  coordinates.longitude.toString(), place.locality.toString()),
            );
          });
        } else {
          if (mounted) {
            setState(() {
              countNotifier.value--;
            });
          }
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  ValueNotifier<int> countNotifier = ValueNotifier(5);

  void showInSnackBar(String value) {
    scaffoldKey.currentState!.showSnackBar( SnackBar(content:  Text(value)));
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SosBloc, SosState>(
      listener: (context, state) {
        if (state is SosCalled) {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return Container(
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [Text("Success"),],
          //         ),
          //       );
          //     },);
          Navigator.pop(context);
          showInSnackBar("Success");
        }
        if (state is SosCallFailed) {
          Navigator.pop(context);
          showInSnackBar("Error");
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: scaffoldKey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Emergency Sos",
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ValueListenableBuilder(
                valueListenable: countNotifier,
                builder: (BuildContext context, int counts, _) {
                  return CircleAvatar(
                    radius: 60,
                    backgroundColor: cRed,
                    child: Text(
                      "$counts",
                      style: const TextStyle(fontSize: 40, color: cWhite),
                    ),
                  );
                },
              ),
              cHeight50,
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
                child: MaterialButton(
                  onPressed: () {
                    _timer!.cancel();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
