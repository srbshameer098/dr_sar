import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Presentation/MainScreen/mainscreen.dart';
import 'package:drsar/Presentation/Widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';

class ScreenPatientHistory extends StatelessWidget {
  const ScreenPatientHistory({
    Key? key,
    required this.appoinmentDate,
    required this.reasonForAppoinment,
    required this.doctorComment,
    required this.prescriptionImage,
  }) : super(key: key);

  final String appoinmentDate;
  final String reasonForAppoinment;
  final String doctorComment;
  final String prescriptionImage;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("History Details"),
          toolbarHeight: mHeight * .05,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(
              right: mWidth * .05,
              left: mWidth * .1,
            ),
            margin: EdgeInsets.only(bottom: mHeight * .05),
            height: mHeight,
            width: mWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 15,
                      splashRadius: 15,
                      color: cBlack,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                Container(
                  height: mHeight * .1,
                  width: mWidth * .5,
                  margin: EdgeInsets.only(top: mHeight * .05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        appoinmentDate,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(reasonForAppoinment),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: mHeight * .05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Doctor Comment:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: mWidth * .5,
                                child: Text(doctorComment),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: mHeight * .5,
                  width: mWidth * .6,
                  margin: EdgeInsets.only(
                    top: mHeight * .1,
                    left: mWidth * .15,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Prescription",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: mHeight * .49,
                        width: mWidth * .6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              prescriptionImage,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: WidegtBottomNavigationBar(
          index: 3,
          onTap: (index) {
            bodyIndexNotifier.value = index;
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => ScreenMain(eIndex: index),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
