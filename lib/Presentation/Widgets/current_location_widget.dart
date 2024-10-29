import 'package:drsar/Application/UserLocation/get_user_location.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Presentation/SplashScreen/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class WidgetCurrentLocation extends StatelessWidget {
  const WidgetCurrentLocation({
    Key? key,
    this.location,
  }) : super(key: key);
  final String? location;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        getUserCurrentLocation().then((coordinates) async {
      userLocation = await placemarkFromCoordinates(
          coordinates.latitude, coordinates.longitude);
      Placemark place = userLocation![0];
      addressNotifier.value = "${place.locality}".toString();
    });
      },
      child: Container(
        margin: EdgeInsets.only(top: mHeight * .035),
        width: mWidth,
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.black.withOpacity(.5),
              size: 12,
            ),
            Text(
              location!,
              style: TextStyle(
                color: cBlueGrey.withOpacity(.8),
                fontSize: 10,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: cBlueGrey.withOpacity(.5),
            ),
          ],
        ),
      ),
    );
  }
}
