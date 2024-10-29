import 'package:drsar/Application/Blocs/HomeServices/bloc/homeservices_bloc.dart';
import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/HomeServices/home_services.dart';
import 'package:drsar/Presentation/HomeServices/home_services_webview.dart';
import 'package:drsar/Presentation/Widgets/CustomDesigns/skelton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHomeServices extends StatefulWidget {
  const ScreenHomeServices({Key? key}) : super(key: key);

  @override
  State<ScreenHomeServices> createState() => _ScreenHomeServicesState();
}

class _ScreenHomeServicesState extends State<ScreenHomeServices> {
  late List<HomeServicesModel> homeServicesModel;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<HomeservicesBloc, HomeservicesState>(
        builder: (context, state) {
          if (state is HomeservicesLoading) {
            return Container(
              height: mHeight,
              width: mWidth,
              padding: EdgeInsets.only(top: mHeight * .01),
              color: cWhite,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => Container(
                  height: mHeight * .45,
                  width: mWidth * .9,
                  margin: EdgeInsets.only(
                    bottom: mHeight * .02,
                    top: index == 0 ? mHeight * .01 : 0,
                  ),
                  padding: EdgeInsets.only(
                    top: mHeight * .01,
                    bottom: mHeight * .01,
                    left: mWidth * .05,
                    right: mWidth * .05,
                  ),
                  decoration: BoxDecoration(
                    color: cWhite,
                    borderRadius: const BorderRadius.all(cRadius10),
                    boxShadow: [
                      BoxShadow(
                        color: cGrey.withOpacity(.5),
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: mHeight * .35,
                        width: mWidth * .8,
                        decoration: BoxDecoration(
                          color: cGrey.withOpacity(.15),
                          borderRadius: const BorderRadius.all(cRadius10),
                          boxShadow: const [
                            BoxShadow(
                              color: cWhite,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                      ),
                      LoadAnimation(
                        child: Container(
                          height: mHeight * .05,
                          width: mWidth * .8,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: cGrey.withOpacity(.15),
                            borderRadius: const BorderRadius.all(cRadius10),
                            boxShadow: const [
                              BoxShadow(
                                color: cWhite,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is HomeservicesError) {
            return RefreshIndicator(
              onRefresh: () {
                return onPull(context, 'homeService', 0);
              },
              child: const Center(
                child: Text("Errror"),
              ),
            );
          }

          if (state is HomeservicesLoaded) {
            homeServicesModel =
                BlocProvider.of<HomeservicesBloc>(context).homeServicesModel;
            return RefreshIndicator(
              onRefresh: () {
                return onPull(context, 'homeService', 0);
              },
              child: Container(
                height: mHeight,
                width: mWidth,
                padding: EdgeInsets.only(top: mHeight * .01),
                color: cWhite,
                child: ListView.builder(
                  itemCount: homeServicesModel.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenHomeServicesWebView(
                          image: homeServicesModel[index].thumbNail?.url !=
                                  null
                              ? '${imageBaseUrl}home-service/images/${homeServicesModel[index].thumbNail!.url!}'
                              : homeServicesNullImage,
                          title: homeServicesModel[index].title != null
                              ? homeServicesModel[index].title!
                              : " ",
                          html: homeServicesModel[index].tinyMceData!,
                        ),
                      ),
                    ),
                    child: Container(
                      height: mHeight * .45,
                      width: mWidth * .9,
                      margin: EdgeInsets.only(
                        bottom: mHeight * .02,
                        top: index == 0 ? mHeight * .01 : 0,
                      ),
                      padding: EdgeInsets.only(
                        top: mHeight * .01,
                        bottom: mHeight * .01,
                        left: mWidth * .05,
                        right: mWidth * .05,
                      ),
                      decoration: BoxDecoration(
                        color: cWhite,
                        borderRadius: const BorderRadius.all(cRadius10),
                        boxShadow: [
                          BoxShadow(
                            color: cGrey.withOpacity(.5),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: mHeight * .35,
                            width: mWidth * .8,
                            decoration: BoxDecoration(
                              color: cBlue,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    homeServicesModel[index].thumbNail?.url !=
                                            null
                                        ? '${imageBaseUrl}home-service/images/${homeServicesModel[index].thumbNail!.url!}'
                                        : homeServicesNullImage,
                                  ),
                                  fit: BoxFit.fill),
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
                          Container(
                            height: mHeight * .05,
                            width: mWidth * .8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: const BorderRadius.all(cRadius10),
                              boxShadow: [
                                BoxShadow(
                                  color: cGrey.withOpacity(.5),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Text(
                              homeServicesModel[index].title != null
                                  ? homeServicesModel[index].title!
                                  : " ",
                              style: TextStyle(
                                fontSize: mHeight * .025,
                                shadows: [
                                  BoxShadow(
                                    color: cGrey.withOpacity(.5),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () {
              return onPull(context, 'homeService', 0);
            },
            child: const Center(
              child: Text(
                "Something Went  Wrong",
                style: TextStyle(
                  fontSize: 20,
                  color: cBlack,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
