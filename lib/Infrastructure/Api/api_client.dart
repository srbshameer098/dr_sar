import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';

class ApiClient {
  static const String basePath = 'http://192.168.18.6:1337/';

  Future<Response> invokeAPI(
    String path,
    String method,
    Object? body,
  ) async {
    Map<String, String> headerParams = {};
    if (method == 'POST' || method == 'GET' || method == 'PUT') {
      final prefs = await SharedPreferences.getInstance();
      final jwt = prefs.getString('jwt');
      print(jwt);
      headerParams = {
        'Authorization': "Bearer $jwt",
        'Content-Type': 'application/json'
      };
    }

    Response response;

    String url = basePath + path;
    print(url);
    print(path);
    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;

    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
                headers: headerParams,
                body: jsonEncode(body))
            .timeout(
          const Duration(seconds: 15),
        );
        break;
      case "PUT":
        response = await put(
          Uri.parse(url),
          headers: headerParams,
          body: jsonEncode(body),
        );
        break;
      case "PATCH":
        response = await patch(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: nullableHeaderParams);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        ).timeout(
          const Duration(seconds: 15),
        );
        break;
      case "REGISTER":
        response = await post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        ).timeout(
          const Duration(seconds: 15),
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        ).timeout(
          const Duration(seconds: 15),
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: headerParams);
    }

    print('status of $path =>${response.statusCode}');
    print(response.body);

    if (response.statusCode >= 400) {
      log('$path : ${response.statusCode} : ${response.body}');
      print(response.body);
      throw ApiException(
        message: response.body,
        statusCode: response.statusCode,
      );
    }
    return response;
  }
}
