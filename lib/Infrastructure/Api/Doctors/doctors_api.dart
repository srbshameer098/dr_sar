import 'dart:convert';


import 'package:http/http.dart';

import '../../../Domain/Models/Doctors/doctors_model.dart';
import '../api_client.dart';

class DoctorsApi {
  ApiClient apiClient = ApiClient();

  Future<List<DoctorsModel>> fetchHospitalsData() async {
    String doctorsApipath = 'doctor/all';
    Response response = await apiClient.invokeAPI(doctorsApipath, "GET", null);

    return DoctorsModel.listFromJson(jsonDecode(response.body));
  }
}
