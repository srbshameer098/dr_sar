import 'package:drsar/Application/CheckUser/check_user.dart';
import 'package:drsar/Application/UserLocation/get_user_location.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

ValueNotifier<dynamic> addressNotifier = ValueNotifier(" ");
List<Placemark>? userLocation;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUser(context);
    getUserCurrentLocation().then((coordinates) async {
      userLocation = await placemarkFromCoordinates(
          coordinates.latitude, coordinates.longitude);
      Placemark place = userLocation![0];
      addressNotifier.value = "${place.locality}".toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: Image.asset(
            "assets/images/logo/drSarlogo.png",
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .8,
          ),
        ),
      ),
    );
  }
}
