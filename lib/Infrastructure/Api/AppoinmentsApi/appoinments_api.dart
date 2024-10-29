import 'dart:convert';


import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Domain/Models/AppoinmentsTable/appoinments_table_model.dart';
import '../api_client.dart';

class AppoinmentsApi {
  ApiClient apiClient = ApiClient();

  Future<AppoinmentsModel> createAppoinments(String timeSlotId,String reason) async {
    final prefs = await SharedPreferences.getInstance();
    String appoinmentsApi = "doctor-appointment/book-appointment";
    final appoinmentsBody = {
      "timeSlotId": timeSlotId,
      "userId": prefs.getInt('uesrId'),
      "reason":reason,
    };

    Response response =
        await apiClient.invokeAPI(appoinmentsApi, "POST", appoinmentsBody);
    return AppoinmentsModel.fromJson(jsonDecode(response.body));
  }
}
