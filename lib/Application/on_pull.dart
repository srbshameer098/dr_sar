
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Blocs/Customer/bloc/customer_bloc.dart';
import 'Blocs/Doctors/bloc/doctors_bloc.dart';
import 'Blocs/HomeServices/bloc/homeservices_bloc.dart';
import 'Blocs/Hospital/bloc/hospital_id_bloc.dart';
import 'Blocs/Hospitals/hospitals_bloc.dart';

onPull(BuildContext context, String screen, int? id) async {
  if (screen == 'hospital') {
    BlocProvider.of<HospitalsBloc>(context).add(FetchHospitalDataEvent());
  } else if (screen == 'homeService') {
    BlocProvider.of<HomeservicesBloc>(context).add(FetchHomeServicesData());
  } else if (screen == 'doctor') {
    BlocProvider.of<DoctorsBloc>(context).add(FetchDoctorsDataEvent());
  } else if (screen == 'profile') {
    BlocProvider.of<CustomerBloc>(context).add(FetchCustomerDataEvent());
  } else if (screen == 'hospitalid') {
    BlocProvider.of<HospitalIdBloc>(context).add(FetchHospitalIDDataEvent(id!));
  }
}
