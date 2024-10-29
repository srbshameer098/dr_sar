import 'package:drsar/Application/Blocs/Hospital/bloc/hospital_id_bloc.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Presentation/Dialogs/HospitalRooms/hospital_room_filter_dialog.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/HospitalDepartment/departmentscreen.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/HospitalRooms/hospital_rooms.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/HostpitalDoctors/hospital_doctor.dart';
import 'package:drsar/Presentation/Hostpital/HospitalInScreen/widgets/tabbar.dart';
import 'package:drsar/Presentation/SplashScreen/screen_splash.dart';
import 'package:drsar/Presentation/Widgets/bottomnavigation.dart';
import 'package:drsar/Presentation/MainScreen/mainscreen.dart';
import 'package:drsar/Presentation/Widgets/current_location_widget.dart';
import 'package:drsar/Presentation/Widgets/searchbar.dart';
import 'package:drsar/Presentation/Widgets/sos_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenHospitalIn extends StatefulWidget {
  const ScreenHospitalIn({
    Key? key,
    required this.hospitalId,
    required this.selectedindex,
    required this.hospitalName,
  }) : super(key: key);

  final int hospitalId;
  final int selectedindex;
  final String hospitalName;

  @override
  State<ScreenHospitalIn> createState() => _ScreenHospitalInState();
}

class _ScreenHospitalInState extends State<ScreenHospitalIn> {
  final ValueNotifier<int> indexNotifier = ValueNotifier(0);

  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    BlocProvider.of<HospitalIdBloc>(context)
        .add(FetchHospitalIDDataEvent(widget.hospitalId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexNotifier,
          builder: (BuildContext context, int newIndex, _) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                toolbarHeight: mHeight * .12,
                elevation: 0,
                centerTitle: false,
                titleSpacing: 10,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: addressNotifier,
                        builder: (BuildContext context, dynamic address, _) {
                          return WidgetCurrentLocation(
                            location:
                                address != null ? address! : "Loading...",
                          );
                        }),
                    SearchBar(
                      search: (value) {
                        if (newIndex == 0) {
                          BlocProvider.of<HospitalIdBloc>(context)
                              .add(SearchHospitalDepartmentEvent(value));
                        } else if (newIndex == 1) {
                          BlocProvider.of<HospitalIdBloc>(context)
                              .add(SearchHospitalDoctorEvent(value));
                        } else if (newIndex == 2) {
                          BlocProvider.of<HospitalIdBloc>(context)
                              .add(SearchHospitalRoomsEvent(value));
                        }
                        if (value.isNotEmpty) {
                          isSearchEmptyNotifier.value = false;
                        } else {
                          isSearchEmptyNotifier.value = true;
                        }
                      },
                      isVisible: true,
                      hospitalName: widget.hospitalName,
                    ),
                  ],
                ),
                actions: newIndex == 2
                    ? [
                        Container(
                          margin: EdgeInsets.only(
                              top: mHeight * .035, right: mWidth * .025),
                          width: mWidth * .05,
                          alignment: Alignment.center,
                          child: IconButton(
                            tooltip: "Filter",
                            splashRadius: 10,
                            iconSize: 20,
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              showFilter(context);
                            },
                            icon: const Icon(FontAwesomeIcons.sliders),
                            color: cBlueGrey,
                          ),
                        )
                      ]
                    : null,
              ),
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool isInnerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    toolbarHeight: mHeight * .13,
                    automaticallyImplyLeading: false,
                    title: TabBar(
                      indicatorColor: Colors.transparent,
                      onTap: (index) {
                        indexNotifier.value = index;
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      tabs: [
                        WidgetTabBar(
                          currentIndex: newIndex,
                          positionIndex: 0,
                          icon: "assets/Icons/department.png",
                          label: "Department",
                        ),
                        WidgetTabBar(
                          currentIndex: newIndex,
                          positionIndex: 1,
                          icon: "assets/Icons/stethoscope.png",
                          label: "Doctor",
                        ),
                        WidgetTabBar(
                          currentIndex: newIndex,
                          positionIndex: 2,
                          icon: "assets/Icons/rooms.png",
                          label: "Rooms",
                        ),
                      ],
                    ),
                  )
                ],
                // Page View
                body: SizedBox(
                  height: mHeight * .6366,
                  child: PageView(
                    onPageChanged: (pageIndex) =>
                        indexNotifier.value = pageIndex,
                    controller: pageController,
                    children: [
                      ScreenHospitalDepartment(
                        hospitalId: widget.hospitalId,
                        selectedIndex: widget.selectedindex,
                      ),
                      ScreenHospitalDoctor(
                        hospitalId: widget.hospitalId,
                        selectedIndex: widget.selectedindex,
                      ),
                      ScreenHospitalRooms(
                        hospitalId: widget.hospitalId,
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: const WidgetSosButton(),
              bottomNavigationBar: WidegtBottomNavigationBar(
                onTap: (index) {
                  bodyIndexNotifier.value = index;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => ScreenMain(eIndex: index),
                      ),
                      (route) => false);
                },
                index: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
