import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Application/Blocs/AppoinmentsBloc/bloc/appoinments_bloc_bloc.dart';
import 'Application/Blocs/Customer/bloc/customer_bloc.dart';
import 'Application/Blocs/Doctors/bloc/doctors_bloc.dart';
import 'Application/Blocs/HomeServices/bloc/homeservices_bloc.dart';
import 'Application/Blocs/Hospital/bloc/hospital_id_bloc.dart';
import 'Application/Blocs/Hospitals/hospitals_bloc.dart';
import 'Application/Blocs/OTPLogin/otp_login_bloc.dart';
import 'Application/Blocs/Sos/sos_bloc.dart';
import 'Application/Blocs/UserAuth/bloc/user_auth_bloc.dart';
import 'Infrastructure/Api/AppoinmentsApi/appoinments_api.dart';
import 'Infrastructure/Api/Customer/customer_api.dart';
import 'Infrastructure/Api/Doctors/doctors_api.dart';
import 'Infrastructure/Api/HomeServices/homeservices_api.dart';
import 'Infrastructure/Api/Hospitals/hospital_api.dart';
import 'Infrastructure/Api/Sos/sos_api.dart';
import 'Infrastructure/Api/UserAuth/user_auth_api.dart';
import 'Presentation/SplashScreen/screen_splash.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  HospitalsApi hospitalsApi = HospitalsApi();
  DoctorsApi doctorsApi = DoctorsApi();
  HomeServicesApi homeServicesApi = HomeServicesApi();
  CustomerApi customerApi = CustomerApi();
  UserApi userApi = UserApi();
  AppoinmentsApi appoinmentsApi = AppoinmentsApi();
  SosApi sosApi = SosApi();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HospitalsBloc(hospitalsApi),
        ),
        BlocProvider(
          create: (context) => DoctorsBloc(doctorsApi),
        ),
        BlocProvider(
          create: (context) => HospitalIdBloc(hospitalsApi),
        ),
        BlocProvider(
          create: (context) => HomeservicesBloc(homeServicesApi),
        ),
        BlocProvider(
          create: (context) => CustomerBloc(customerApi),
        ),
        BlocProvider(
          create: (context) => UserAuthBloc(userApi),
        ),
        BlocProvider(
          create: (context) => AppoinmentsBloc(appoinmentsApi),
        ),
        BlocProvider(
          create: (context) => OtploginBloc(userApi),
        ),
        BlocProvider(
          create: (context) => SosBloc(sosApi),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
