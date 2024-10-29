import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';

showFilter(context) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;

  final ValueNotifier<String> filterSelectedNotifier = ValueNotifier(" ");

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      backgroundColor: Colors.transparent,
      content: Container(
        height: mHeight * .369,
        width: mWidth * .5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filter.length,
          itemBuilder: (BuildContext context, int index) =>
              ValueListenableBuilder(
            valueListenable: filterSelectedNotifier,
            builder: (BuildContext context, String filterSelected, _) {
              return GestureDetector(
                onTap: () => filterSelectedNotifier.value = index.toString(),
                child: Container(
                  margin: const EdgeInsets.all(1),
                  alignment: Alignment.center,
                  width: mWidth,
                  height: mHeight * .07,
                  decoration: BoxDecoration(
                    color: cWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: cGrey,
                        offset: Offset(0.0, 1.5),
                        blurRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        filter[index],
                      ),
                      Visibility(
                        visible: filterSelected == index.toString(),
                        child: const Icon(Icons.check),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}

final filter = [
  "A/C Room",
  "Non A/C Room",
  "Deluxe Room",
  "Super Deluxe Room",
  "Luxury Room",
];
