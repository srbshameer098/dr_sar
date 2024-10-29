import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:flutter/material.dart';

final ValueNotifier<bool> isSearchEmptyNotifier = ValueNotifier(true);

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
    required this.isVisible,
    this.hospitalName,
    required this.search,
  }) : super(key: key);
  final bool isVisible;
  final TextEditingController searchController = TextEditingController();

  final String? hospitalName;
  final Function(String) search;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: mHeight * .0),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      height: mHeight * .098,
      width: mWidth,
      child: SizedBox(
        height: mHeight * .05,
        width: mWidth,
        child: ValueListenableBuilder(
            valueListenable: isSearchEmptyNotifier,
            builder: (BuildContext context, bool isSearchEmpty, _) {
              return TextFormField(
                onChanged: search,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 5),
                  suffixIcon: isSearchEmpty
                      ? Visibility(
                          visible: isVisible,
                          child: Padding(
                            padding: EdgeInsets.only(right: mWidth * .02),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/Icons/hostpital.png",
                                  height: 15,
                                  width: 15,
                                  color: selectedItemColor.withOpacity(.5),
                                ),
                                Text(
                                  hospitalName!,
                                  maxLines: 05,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: selectedItemColor.withOpacity(.5),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : null,
                  fillColor: searchFieldBackgroundColor,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search Here...",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(70),
                      right: Radius.circular(70),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
