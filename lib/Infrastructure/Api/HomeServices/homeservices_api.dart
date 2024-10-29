import 'dart:convert';

import 'package:http/http.dart';

import '../../../Domain/Models/HomeServices/home_services.dart';
import '../api_client.dart';

class HomeServicesApi {
  ApiClient apiClient = ApiClient();

  Future<List<HomeServicesModel>> fetchHomeService() async {
    String hospitalsPath = "home-service/all";
    Response response = await apiClient.invokeAPI(hospitalsPath, "GET", null);
    print(response.body);
    return HomeServicesModel.listFromJson(jsonDecode(response.body));
  }
}
