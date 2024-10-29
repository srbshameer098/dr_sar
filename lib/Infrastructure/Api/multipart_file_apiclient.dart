import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MultiPartFileApiClient {
  static const String endPoint = 'https://api.drsar.in/';

  Future<http.Response> uploadFile(
      {required XFile filepath, required String basePath,required String imgId}) async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString('jwt');
    Map<String, String> headerParams = {
      "authorization": "Bearer $jwt",
      "Accept": "application/json",
      "Content-Type": "multipart/form-data"
    };

    print(endPoint + basePath);
    var request = http.MultipartRequest('PUT', Uri.parse(endPoint + basePath));
    request.headers.addAll(headerParams);
    print(endPoint + basePath);
    print("request : $endPoint$basePath");
    List<http.MultipartFile> newList = [];
    if (filepath.path != "") {
      var multipartFile =
          await http.MultipartFile.fromPath("file", filepath.path.toString());

      print(filepath.path.toString());
      newList.add(multipartFile);
    }

    request.files.addAll(newList);
    request.fields.addAll({"imgId": imgId});

    http.StreamedResponse res = await request.send();

    http.Response responsed = await http.Response.fromStream(res);
    print(responsed);
    print(responsed.body);
    final responseData = json.decode(responsed.body);

    print('worked 4');
    if (res.statusCode == 200) {
      print(responseData);
    } else {
      print('Error');
    }
    print("reason : $res.");
    print(responsed);
    return responsed;
  }
}
