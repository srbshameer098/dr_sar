import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ScreenHomeServicesWebView extends StatelessWidget {
  const ScreenHomeServicesWebView({
    Key? key,
    required this.html,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;
  final String html;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        height: mHeight,
        width: mWidth,
        color: cWhite,
        padding: EdgeInsets.only(
            top: mHeight * .05, left: mWidth * .05, right: mWidth * .05),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: mHeight * .4,
              width: mWidth * .7,
              decoration: BoxDecoration(
                color: cBlue,
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
                borderRadius: const BorderRadius.all(cRadius10),
                boxShadow: [
                  BoxShadow(
                    color: cGrey.withOpacity(.5),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 2.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: mWidth,
              child: Html(
                data: html,
              ),
            )
          ],
        ),
      ),
    );
  }
}
