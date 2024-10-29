
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Presentation/LoginScreen/loginscreen.dart';
import '../../Presentation/MainScreen/mainscreen.dart';
import '../Blocs/Customer/bloc/customer_bloc.dart';
import '../Blocs/Doctors/bloc/doctors_bloc.dart';
import '../Blocs/HomeServices/bloc/homeservices_bloc.dart';
import '../Blocs/Hospitals/hospitals_bloc.dart';

checkUser(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  Future.delayed(
    const Duration(seconds: 3),
    () {
      if (prefs.getString('jwt') == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ScreenLogin()),
            (route) => false);
      } else {
        BlocProvider.of<HospitalsBloc>(context).add(FetchHospitalDataEvent());
        BlocProvider.of<DoctorsBloc>(context).add(FetchDoctorsDataEvent());
        BlocProvider.of<HomeservicesBloc>(context).add(FetchHomeServicesData());
        BlocProvider.of<CustomerBloc>(context).add(FetchCustomerDataEvent());
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => ScreenMain(
              eIndex: 0,
            ),
          ),
          (route) => false,
        );
      }
    },
  );
}
