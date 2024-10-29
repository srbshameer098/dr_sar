import 'package:drsar/Presentation/DoctorScreen/doctorscreen.dart';
import 'package:drsar/Presentation/HomeServices/homeservices.dart';
import 'package:drsar/Presentation/Hostpital/hospitalscreen.dart';
import 'package:drsar/Presentation/SplashScreen/screen_splash.dart';
import 'package:drsar/Presentation/Widgets/bottomnavigation.dart';
import 'package:drsar/Presentation/Profile/profile_main_screen.dart';
import 'package:drsar/Presentation/Widgets/current_location_widget.dart';
import 'package:drsar/Presentation/Widgets/sos_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

final ValueNotifier<int> bodyIndexNotifier = ValueNotifier(0);

// ignore: must_be_immutable
class ScreenMain extends StatefulWidget {
  ScreenMain({
    Key? key,
    required this.eIndex,
  }) : super(key: key);

  late int eIndex;

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final bodyScreens = <Widget>[
    const ScreenHospital(),
    const ScreenDoctor(),
    const ScreenHomeServices(),
    const ProfileMainScreen(),
  ];

  @override
  void dispose() {
    Loader.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
      valueListenable: bodyIndexNotifier,
      builder: (BuildContext context, int index, _) {
        return Scaffold(
          key: scaffoldKey,
          appBar: index != 3
              ? AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  toolbarHeight: mHeight * .02,
                  elevation: 0,
                  title: Padding(
                    padding: EdgeInsets.only(bottom: mHeight * .03),
                    child: ValueListenableBuilder(
                      valueListenable: addressNotifier,
                      builder: (BuildContext context, dynamic address, _) {
                        return WidgetCurrentLocation(
                          location: address != null ? address! : "Loading...",
                        );
                      },
                    ),
                  ),
                )
              : null,
          resizeToAvoidBottomInset: false,
          // Body
          body: bodyScreens[widget.eIndex],
          // SOS button FloatingActionButton
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const WidgetSosButton(),
          // BottomNavigationBar
          bottomNavigationBar: WidegtBottomNavigationBar(
            onTap: (index) {
              bodyIndexNotifier.value = index;
              widget.eIndex = index;
            },
            index: widget.eIndex,
          ),
        );
      },
    );
  }
}
