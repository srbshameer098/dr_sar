import 'dart:convert';

import 'package:http/http.dart';

import '../../../Domain/Models/HospitalId/hospital_id_model.dart';
import '../../../Domain/Models/Hospitals/hospitalsmodel.dart';
import '../api_client.dart';

class HospitalsApi {
  ApiClient apiClient = ApiClient();

  Future<List<HospitalsModel>> fetchHospitalsData() async {
    String hospitalsPath =
        'hospital/all';
    Response response = await apiClient.invokeAPI(hospitalsPath, "GET", null);
    print(response.body);
    return HospitalsModel.listFromJson(jsonDecode(response.body));
  }

  Future<HospitalById> fetchHospitalDataId(id) async {
    String hospitalIdPath =
        'hospital/$id';
    Response response = await apiClient.invokeAPI(hospitalIdPath, "GET", null);
    print(response.body);
    return HospitalById.fromJson(jsonDecode(response.body));
  }
}
