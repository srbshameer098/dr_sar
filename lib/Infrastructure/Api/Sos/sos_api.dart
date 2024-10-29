import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_client.dart';

class SosApi {
  ApiClient apiClient = ApiClient();
  final String path = 'sos/emergency';

  Future<Response> sos({required String long, required String lat,required String landmark}) async {
    final prefs = await SharedPreferences.getInstance();

    Map body = {
      'name': prefs.getString('name'),
      'phone': prefs.getString('phone'),
      'landmark':landmark,
      'lat': lat,
      'lon': long
    };
    Response response = await apiClient.invokeAPI(path, 'POST', body);
    return response;
  }
}
