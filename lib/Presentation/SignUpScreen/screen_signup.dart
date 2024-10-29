import 'package:drsar/Application/Blocs/OTPLogin/otp_login_bloc.dart';
import 'package:drsar/Application/Blocs/UserAuth/bloc/user_auth_bloc.dart';
import 'package:drsar/Domain/Constants/Color/colors.dart';
import 'package:drsar/Domain/Constants/constants.dart';
import 'package:drsar/Domain/Models/Customer/customer_model.dart';
import 'package:drsar/Domain/Models/UserAuthentication/user_register_model.dart';
import 'package:drsar/Presentation/Dialogs/custom_transistion_dailog.dart';
import 'package:drsar/Presentation/Dialogs/show_dob_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:image_picker/image_picker.dart';

var date = " ";
ValueNotifier<String> dobNotifier = ValueNotifier("");
ValueNotifier<bool> isImagePicked = ValueNotifier(false);
TextEditingController mobControllerSignUp = TextEditingController();

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController healthInfoController = TextEditingController();

  @override
  void dispose() {
    Loader.hide();
    super.dispose();
  }

  late XFile? pickedFile;
  late UserRegisterModel userRegisterModel;
  late CustomerModel customerModel;
  final ImagePicker picker = ImagePicker();
  String genderValue = " ";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _submit() async {
      if (_formKey.currentState!.validate()) {
        BlocProvider.of<UserAuthBloc>(context).add(
          UserAuthenticationEvent(
            mobControllerSignUp.text.trim(),
            context,
            nameController.text,
            emailController.text.trim(),
            placeController.text,
            date,
            genderValue,
            healthInfoController.text,
          ),
        );
      } else {
        print('Login not success');
      }
    }

    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
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
          print(state.toString());
          userRegisterModel =
              BlocProvider.of<UserAuthBloc>(context).userRegisterModel;
          BlocProvider.of<OtploginBloc>(context).add(
            SendOtpEvent(
              mobControllerSignUp.text,
            ),
          );
          print("Signup Screen USer auth success");
        }
        if (state is UserAuthFailed) {
          Loader.hide();
          showCustomDialog(
            context,
            "Something Went Wrong please try again later",
            Icons.warning_rounded,
            cYellow,
          );
        }
        if (state is ExistingUser) {
          Loader.hide();
          showCustomDialog(
            context,
            "Mobile Number is Already Registered",
            Icons.warning_rounded,
            cYellow,
          );
        }
      },
      child: Scaffold(
        backgroundColor: cWhite,
        body: SizedBox(
          width: mWidth,
          height: mHeight,
          child: Padding(
            padding: EdgeInsets.only(
              right: mWidth * .01,
              bottom: mHeight * .007,
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: mHeight * .25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo/drSarlogo.png',
                          height: mHeight * .2,
                          width: mWidth * .3,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: cTeal.withOpacity(.8),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: mWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: mWidth,
                          padding: EdgeInsets.only(
                            left: mWidth * .1,
                          ),
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
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    hintText: "username",
                                  ),
                                  validator: (val) {
                                    if (val == "") {
                                      return "Name can't empty";
                                    } else if (val!.length < 3) {
                                      return "Name must be 3 character or above";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: mHeight * .08,
                          width: mWidth,
                          padding: EdgeInsets.only(
                            left: mWidth * .1,
                          ),
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
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: emailController,
                                  validator: (val) {
                                    if (val!.isEmpty ||
                                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                            .hasMatch(val)) {
                                      return "Invalid e-mail";
                                    }
                                    return null;
                                  },
                                  autofillHints: const [AutofillHints.email],
                                  decoration: const InputDecoration(
                                    hintText: "E-mail",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: mHeight * .08,
                          width: mWidth,
                          padding: EdgeInsets.only(
                            left: mWidth * .1,
                          ),
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
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  validator: (val) {
                                    if (val == "") {
                                      return "Location Can't Empty";
                                    }
                                    return null;
                                  },
                                  controller: placeController,
                                  decoration: const InputDecoration(
                                    hintText: "Location",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: mHeight * .08,
                          width: mWidth,
                          padding: EdgeInsets.only(
                            left: mWidth * .1,
                          ),
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
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: mobControllerSignUp,
                                  validator: (val) {
                                    if (val == "") {
                                      return "Phone Number Can't Empty";
                                    } else if (val!.length < 10) {
                                      return "Phone number must be 10 characters";
                                    }
                                    return null;
                                  },
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "Phone Number",
                                  ),
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
                            padding: EdgeInsets.only(
                              left: mWidth * .1,
                            ),
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
                                  height: mHeight * .11,
                                  width: mWidth * .72,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: mHeight * .01,
                                      ),
                                      ValueListenableBuilder(
                                        valueListenable: dobNotifier,
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
                          padding: EdgeInsets.only(
                            left: mWidth * .1,
                          ),
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
                                height: mHeight * .11,
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
                                            value: "MALE",
                                            groupValue: genderValue,
                                            onChanged: (value) {
                                              setState(() {
                                                genderValue = value.toString();
                                              });
                                              print(genderValue);
                                            }),
                                      ),
                                      cHeight20,
                                      SizedBox(
                                        height: mHeight * .03,
                                        child: RadioListTile(
                                          title: const Text("Female"),
                                          value: "FEMALE",
                                          groupValue: genderValue,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                genderValue = value.toString();
                                              },
                                            );
                                            print(genderValue);
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
                                      textInputAction: TextInputAction.done,
                                      maxLines: null,
                                      controller: healthInfoController,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add),
                                          ),
                                          hintText: "Diabetics,BloodPressure"),
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
                  cHeight10,
                  Container(
                    padding:
                        EdgeInsets.only(left: mWidth * .1, right: mWidth * .1),
                    width: mWidth * .85,
                    height: mHeight * .058,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: cEnabledButtonColor,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _submit();
                      },
                      child: const Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    pickedFile = await picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      isImagePicked.value = true;
    }
    if (pickedFile == null) return;
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
                  const Text('Camera')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
