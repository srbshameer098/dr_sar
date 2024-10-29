import 'dart:io';
import 'package:drsar/Application/Blocs/Customer/bloc/customer_bloc.dart';
import 'package:drsar/Application/Blocs/UserAuth/bloc/user_auth_bloc.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Presentation/MainScreen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:image_picker/image_picker.dart';

var date = " ";
late String dob;
ValueNotifier<String> uDate = ValueNotifier(dob);

class ScreenEditProfile extends StatefulWidget {
  const ScreenEditProfile({
    Key? key,
    required this.number,
    required this.place,
    required this.email,
    required this.name,
    required this.gender,
    required this.healthInfo,
    required this.dateOfBirth,
    required this.profilePic,
    required this.imgId,
  }) : super(key: key);

  final String number;
  final String place;
  final String email;
  final String name;
  final String gender;
  final String healthInfo;
  final String dateOfBirth;
  final String? profilePic;
  final int imgId;

  @override
  State<ScreenEditProfile> createState() => _ScreenEditProfileState();
}

class _ScreenEditProfileState extends State<ScreenEditProfile> {
  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
    );

    setState(() {
      _imageFile = pickedFile!;
      _image = File(_imageFile!.path);
    });
    if (pickedFile != null) {
    } else {
      return;
    }
  }

  late TextEditingController nameController;
  late TextEditingController placeController;
  late TextEditingController emailController;
  late TextEditingController mobController;
  late TextEditingController dobController;
  late TextEditingController healthInfoController;

  @override
  void initState() {
    dob = widget.dateOfBirth;
    nameController = TextEditingController(text: widget.name);
    placeController = TextEditingController(text: widget.place);
    emailController = TextEditingController(text: widget.email);
    mobController = TextEditingController(text: widget.number);
    dobController = TextEditingController(text: widget.dateOfBirth);
    healthInfoController = TextEditingController(
        text: widget.healthInfo.split('[').last.split(']').first);
    super.initState();
  }

  XFile? _imageFile;
  File? _image;
  final ImagePicker picker = ImagePicker();
  late String genderValue = widget.gender;

  @override
  void dispose() {
    nameController;
    placeController;
    emailController;
    mobController;
    dobController;
    healthInfoController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
        print("Create Customer Bloc");
        if (state is UserAuthLoading) {
          Loader.show(context,
              isSafeAreaOverlay: false,
              isAppbarOverlay: true,
              isBottomBarOverlay: false,
              progressIndicator: const CircularProgressIndicator(),
              themeData: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Colors.black38)),
              overlayColor: const Color(0x99E8EAF6));
        }
        if (state is UserAuthSuccess) {
          Loader.hide();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => ScreenMain(
                  eIndex: 3,
                ),
              ),
              (route) => false);
          BlocProvider.of<CustomerBloc>(context).add(FetchCustomerDataEvent());
        }
        if (state is UserAuthFailed) {
          Loader.hide();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => ScreenMain(
                  eIndex: 3,
                ),
              ),
                  (route) => false);
          // showCustomDialog(
          //   context,
          //   "profile Cant be edited",
          //   Icons.person_off,
          //   cTeal,
          // );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: cWhite,
          automaticallyImplyLeading: false,
          title: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: cBlack,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_imageFile != null) {
                  BlocProvider.of<CustomerBloc>(context).add(
                    UploadProfilePic(_imageFile!, widget.imgId),
                  );
                }

                BlocProvider.of<UserAuthBloc>(context).add(
                  UserEditEvent(
                    mobController.text,
                    context,
                    nameController.text,
                    emailController.text,
                    placeController.text,
                    dob,
                    genderValue,
                    healthInfoController.text,
                  ),
                );
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: cBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: mHeight,
          width: mWidth,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: mHeight * .03),
                child: SizedBox(
                  width: mWidth * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  backgroundImage: FileImage(_image!),
                                  radius: 50,
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  backgroundImage: const AssetImage(
                                      'assets/Icons/profile.png'),
                                  radius: 50,
                                ),
                          Positioned(
                            right: 1,
                            bottom: 2,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: cWhite,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (builder) {
                                      return cameraBottomSheet();
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.grey[300],
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 18,
                                    color: Color(0xff05477D),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mHeight * .0,
                      ),
                    ],
                  ),
                ),
              ),
              cHeight30,
              //start list of person data.
              SizedBox(
                width: mWidth,
                child: Padding(
                  padding: EdgeInsets.only(right: mWidth * .03),
                  child: Column(
                    children: [
                      Container(
                        height: mHeight * .08,
                        width: mWidth,
                        padding: EdgeInsets.only(left: mWidth * .1),
                        decoration: const BoxDecoration(
                          color: cWhite,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.person,
                              color: cTeal,
                            ),
                            cWidth30,
                            Container(
                              alignment: Alignment.center,
                              height: mHeight * .06,
                              width: mWidth * .72,
                              color: cWhite,
                              child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  hintText: "User Name",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: mHeight * .08,
                        width: mWidth,
                        padding: EdgeInsets.only(left: mWidth * .1),
                        decoration: const BoxDecoration(
                          color: cWhite,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.email,
                              color: cTeal,
                            ),
                            cWidth30,
                            Container(
                              alignment: Alignment.center,
                              height: mHeight * .06,
                              width: mWidth * .72,
                              color: cWhite,
                              child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  hintText: "User g-mail",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: mHeight * .08,
                        width: mWidth,
                        padding: EdgeInsets.only(left: mWidth * .1),
                        decoration: const BoxDecoration(
                          color: cWhite,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: cTeal,
                            ),
                            cWidth30,
                            Container(
                              alignment: Alignment.center,
                              height: mHeight * .06,
                              width: mWidth * .72,
                              color: cWhite,
                              child: TextField(
                                controller: placeController,
                                decoration: const InputDecoration(
                                  hintText: "User Location",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: mHeight * .08,
                        width: mWidth,
                        padding: EdgeInsets.only(left: mWidth * .1),
                        decoration: const BoxDecoration(
                          color: cWhite,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.call,
                              color: cTeal,
                            ),
                            cWidth30,
                            Container(
                              alignment: Alignment.center,
                              height: mHeight * .06,
                              width: mWidth * .72,
                              color: cWhite,
                              child: TextField(
                                controller: mobController,
                                maxLength: 10,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "User Phone Number"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDobPicker(context);
                        },
                        child: Container(
                          height: mHeight * .11,
                          width: mWidth,
                          padding: EdgeInsets.only(left: mWidth * .1),
                          decoration: const BoxDecoration(
                            color: cWhite,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: cTeal,
                              ),
                              cWidth30,
                              SizedBox(
                                height: mHeight * .13,
                                width: mWidth * .72,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: mHeight * .01,
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable: uDate,
                                      builder: (context, String newDate, _) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(newDate),
                                            GestureDetector(
                                              onTap: () {
                                                showDobPicker(context);
                                              },
                                              child: const Icon(
                                                Icons.calendar_month,
                                                color: cTeal,
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                    const Text(
                                      'Select your date',
                                      style: TextStyle(
                                        color: cGrey,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: mHeight * .15,
                        width: mWidth,
                        padding: EdgeInsets.only(left: mWidth * .1),
                        decoration: const BoxDecoration(
                          color: cWhite,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.male,
                              color: cTeal,
                            ),
                            cWidth10,
                            const Text(
                              "Gender: ",
                              style: TextStyle(color: cBlack, fontSize: 17),
                            ),
                            SizedBox(
                              height: mHeight * .12,
                              width: mWidth * .50,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: mHeight * .01,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: mHeight * .03,
                                      child: RadioListTile(
                                        title: const Text("Male"),
                                        value: "male",
                                        groupValue: genderValue,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              genderValue = value.toString();
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    cHeight20,
                                    SizedBox(
                                      height: mHeight * .03,
                                      child: RadioListTile(
                                        title: const Text("Female"),
                                        value: "female",
                                        groupValue: genderValue,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              genderValue = value.toString();
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: mWidth,
                            padding: EdgeInsets.only(left: mWidth * .1),
                            decoration: const BoxDecoration(
                              color: cWhite,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.notes,
                                  color: cTeal,
                                ),
                                cWidth30,
                                Container(
                                  alignment: Alignment.center,
                                  width: mWidth * .72,
                                  color: cWhite,
                                  child: TextFormField(
                                    controller: healthInfoController,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add),
                                      ),
                                      hintText: "Add or Change your helth info",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  cameraBottomSheet() {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mHeight * .20,
      width: mWidth,
      decoration: const BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          SizedBox(
            height: mHeight * .01,
          ),
          const Text(
            'Choose profile photo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: mHeight * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      takePhoto(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                  ),
                  const Text('Gallery')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      takePhoto(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                  const Text('Camera'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

showDobPicker(context) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SizedBox(
        width: mWidth * .98,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                cWidth10,
                Padding(
                  padding:
                      EdgeInsets.only(left: mWidth * .13, top: mHeight * .01),
                  child: const Text(
                    "Select DOB",
                    style: TextStyle(
                      color: cBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            CalendarDatePicker(
              onDateChanged: (selectedDate) {
                date = selectedDate.toString().split(' ').first;
                uDate.value = date.toString();
                Navigator.pop(context);
              },
              initialDate: DateTime.now(),
              firstDate: DateTime.now().add(
                const Duration(days: -100000000),
              ),
              lastDate: DateTime.now(),
            ),
          ],
        ),
      ),
    ),
  );
}
