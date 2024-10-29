import 'dart:convert';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Domain/Models/Customer/customer_model.dart';
import '../../../Domain/Models/UpdateProfilePic/update_profile_pic.dart';
import '../api_client.dart';
import '../multipart_file_apiclient.dart';

class CustomerApi {
  ApiClient apiClient = ApiClient();
  MultiPartFileApiClient multiPartFileApiClient = MultiPartFileApiClient();

  Future<CustomerModel> fetchCustomerData() async {
    String customerApi = 'customer/me';
    Response response = await apiClient.invokeAPI(customerApi, "GET", null);
    return CustomerModel.fromJson(jsonDecode(response.body));
  }

  Future<UpdateProfilePic> uploadFunction(XFile file, int imgId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Response response = await multiPartFileApiClient.uploadFile(
        filepath: file,
        imgId: imgId.toString(),
        basePath: 'customer/updateProfilePic/${prefs.getInt('userId')}');
    return UpdateProfilePic.fromJson(jsonDecode(response.body));
  }
}
