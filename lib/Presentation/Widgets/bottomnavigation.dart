import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';

class WidegtBottomNavigationBar extends StatelessWidget {
  const WidegtBottomNavigationBar({
    Key? key,
 
    required this.index,
    required this.onTap,
  }) : super(key: key);

  
  final int index;

 final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // for change the selected color and unselcted color
      //edit in colors.dart in Domain Constants
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      //
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      showUnselectedLabels: true,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedIconTheme: const IconThemeData(size: 24),
      unselectedIconTheme: const IconThemeData(size: 24),
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icons/hostpital.png",
              height: 30,
              width: 30,
              color: index == 0 ? selectedItemColor : unselectedItemColor,
            ),
            label: "Hospital"),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icons/doctor.png",
              height: 30,
              width: 30,
              color: index == 1 ? selectedItemColor : unselectedItemColor,
            ),
            label: "Doctors"),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icons/house.png",
              height: 30,
              width: 30,
              color: index == 2 ? selectedItemColor : unselectedItemColor,
            ),
            label: "Home Services"),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icons/profile.png",
              height: 30,
              width: 30,
              color: index == 3 ? selectedItemColor : unselectedItemColor,
            ),
            label: "Profile"),
      ],
    );
  }
}
