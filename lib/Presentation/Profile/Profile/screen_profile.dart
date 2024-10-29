import 'package:drsar/Application/Blocs/Customer/bloc/customer_bloc.dart';
import 'package:drsar/Application/CheckUser/user_logout.dart';
import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/Customer/customer_model.dart';
import 'package:drsar/Presentation/Profile/screen_editprofile.dart';
import 'package:drsar/Presentation/Widgets/CustomDesigns/skelton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  late CustomerModel customerModel;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () {
        return onPull(context, 'profile', 0);
      },
      child: Scaffold(
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is CustomerLoading) {
              return SizedBox(
                height: mHeight,
                width: mWidth,
                child: RefreshIndicator(
                  onRefresh: () {
                    return onPull(context, 'profile', 0);
                  },
                  child: ListView(
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        width: mWidth * .90,
                        height: mHeight * .03,
                      ),
                      SizedBox(
                        height: mHeight * .3,
                        width: mWidth * .5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: cGrey.withOpacity(.15),
                                  radius: 50,
                                ),
                              ],
                            ),
                            LoadAnimation(
                              child: Container(
                                color: cGrey.withOpacity(.15),
                                height: mHeight * .03,
                                width: mWidth * .3,
                                child: const Text(
                                  "   ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: cBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            LoadAnimation(
                              child: Container(
                                color: cGrey.withOpacity(.15),
                                height: mHeight * .03,
                                width: mWidth * .3,
                                child: const Text(
                                  " ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: cBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: mHeight * .5,
                        width: mWidth,
                        padding: EdgeInsets.only(
                          left: mWidth * .1,
                          right: mWidth * .05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: mWidth * .05),
                              alignment: Alignment.centerLeft,
                              height: mHeight * .05,
                              width: mWidth,
                              color: cGrey.withOpacity(.15),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: mWidth * .05),
                              alignment: Alignment.centerLeft,
                              height: mHeight * .05,
                              width: mWidth,
                              color: cGrey.withOpacity(.15),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: mWidth * .05),
                              alignment: Alignment.centerLeft,
                              height: mHeight * .05,
                              width: mWidth,
                              color: cGrey.withOpacity(.15),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: mWidth * .05),
                              alignment: Alignment.centerLeft,
                              height: mHeight * .05,
                              width: mWidth,
                              color: cGrey.withOpacity(.15),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: mWidth * .05),
                              alignment: Alignment.centerLeft,
                              height: mHeight * .05,
                              width: mWidth,
                              color: cGrey.withOpacity(.15),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }

            if (state is CustomerLoaded) {
              customerModel =
                  BlocProvider.of<CustomerBloc>(context).customerModel;
              return SizedBox(
                height: mHeight,
                width: mWidth,
                child: ListView(
                  children: [
                    Container(
                      height: mHeight * .3,
                      width: mWidth * .5,
                      decoration: BoxDecoration(
                        color: cWhite,
                        borderRadius: BorderRadius.all(
                          Radius.circular(mHeight * .005),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: mWidth * .05,
                        right: mWidth * .05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: mWidth * .90,
                            height: mHeight * .04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    userLogout(context);
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                    color: cBlack,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ScreenEditProfile(
                                          imgId: customerModel.customer
                                                      ?.profilePic?.length !=
                                                  0
                                              ? customerModel
                                                  .customer!.profilePic![0].id!
                                              : 0,
                                          profilePic: customerModel.customer
                                                      ?.profilePic?.length !=
                                                  0
                                              ? customerModel
                                                  .customer!.profilePic![0].url!
                                              : null,
                                          number: customerModel
                                                      .customer?.phone !=
                                                  null
                                              ? customerModel.customer!.phone!
                                              : " ",
                                          place: customerModel.customer?.city !=
                                                  null
                                              ? customerModel.customer!.city!
                                              : " ",
                                          email: customerModel
                                                      .customer?.email !=
                                                  null
                                              ? customerModel.customer!.email!
                                              : " ",
                                          name: customerModel.customer?.name !=
                                                  null
                                              ? customerModel.customer!.name!
                                              : " ",
                                          gender: customerModel
                                                      .customer?.gender !=
                                                  null
                                              ? customerModel.customer!.gender!
                                              : " ",
                                          healthInfo: customerModel.customer
                                                      ?.additionalHealthIssues !=
                                                  null
                                              ? customerModel.customer!
                                                  .additionalHealthIssues!
                                                  .toString()
                                                  .trim()
                                              : " ",
                                          dateOfBirth:
                                              customerModel.customer?.dob !=
                                                      null
                                                  ? customerModel.customer!.dob!
                                                  : " ",
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: cBlack,
                                    size: mHeight * .02,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 50,
                                backgroundImage: customerModel
                                            .customer?.profilePic?.length !=
                                        0
                                    ? NetworkImage(
                                        '${imageBaseUrl}customer/images/${customerModel.customer!.profilePic![0].url!}')
                                    : const AssetImage(
                                            'assets/Icons/profile.png')
                                        as ImageProvider,
                              ),
                            ],
                          ),
                          Text(
                            customerModel.customer?.name != null
                                ? customerModel.customer!.name!
                                : " ",
                            style: const TextStyle(
                              fontSize: 16,
                              color: cBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            customerModel.customer?.city != null
                                ? customerModel.customer!.city!
                                : " ",
                            style: const TextStyle(
                              fontSize: 12,
                              color: cBlueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: mHeight * .5,
                      width: mWidth,
                      padding: EdgeInsets.only(
                        left: mWidth * .1,
                        right: mWidth * .05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.email,
                                color: cTeal,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: mWidth * .05),
                                alignment: Alignment.centerLeft,
                                height: mHeight * .05,
                                width: mWidth * .70,
                                child: Text(
                                  customerModel.customer?.email != null
                                      ? customerModel.customer!.email!
                                      : " ",
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: cBlack,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: cTeal,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: mWidth * .05),
                                alignment: Alignment.centerLeft,
                                height: mHeight * .05,
                                width: mWidth * .70,
                                child: Text(
                                  customerModel.customer?.phone != null
                                      ? customerModel.customer!.phone!
                                      : " ",
                                  maxLines: 1,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: cBlack,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.date_range,
                                color: cTeal,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: mWidth * .05),
                                alignment: Alignment.centerLeft,
                                height: mHeight * .05,
                                width: mWidth * .70,
                                child: Text(
                                  customerModel.customer?.dob != null
                                      ? customerModel.customer!.dob!
                                      : " ",
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: cBlack,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.male,
                                color: cTeal,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: mWidth * .05),
                                alignment: Alignment.centerLeft,
                                height: mHeight * .05,
                                width: mWidth * .70,
                                child: Text(
                                  customerModel.customer?.gender != null
                                      ? customerModel.customer!.gender!
                                      : " ",
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: cBlack,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.health_and_safety,
                                color: cTeal,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: mWidth * .05),
                                alignment: Alignment.centerLeft,
                                height: mHeight * .15,
                                width: mWidth * .70,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: customerModel
                                      .customer!.additionalHealthIssues!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) => Text(
                                    customerModel.customer!
                                        .additionalHealthIssues![index],
                                    maxLines: 5,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: cBlack,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is CustomerError) {
              // userLogout(context);
              return const Center(
                child: Text(
                  "Error",
                  style: TextStyle(color: cBlack),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
