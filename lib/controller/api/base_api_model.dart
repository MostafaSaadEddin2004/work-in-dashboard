import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class BaseApi {
  static String get baseUrl => 'http://127.0.0.1:5000/api/';

  static Future<http.Response> getRequest({
    required String endPoint,
  }) async {
    // final sharedPrefs = await SharedPreferences.getInstance();
    // final token = sharedPrefs.getString('token');

    final response = await http.get(Uri.parse(baseUrl + endPoint), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzZhZjY3N2VhM2EwZmEyYzg2NDEwNSIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxNDg2MDM5NCwiZXhwIjoxNzE1MTE5NTk0fQ.fvjH39Mrhq_USd1EgqnNvjeWJ79y8385WSqJqqO_6mc',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      throw HttpException(errorMessage);
    }
  }

  static Future<http.Response> postRequest(
      {required String endPoint, Map<String, dynamic>? data}) async {
    // final sharedPrefs = await SharedPreferences.getInstance();
    // final token = sharedPrefs.getString('token');
    final response = await http.post(Uri.parse(baseUrl + endPoint),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzZhZjY3N2VhM2EwZmEyYzg2NDEwNSIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxNDg2MDM5NCwiZXhwIjoxNzE1MTE5NTk0fQ.fvjH39Mrhq_USd1EgqnNvjeWJ79y8385WSqJqqO_6mc',
        },
        body: data);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      throw HttpException(errorMessage);
    }
  }

  static Future<http.Response> putRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    // final sharedPrefs = await SharedPreferences.getInstance();
    // final token = sharedPrefs.getString('token');
    final response = await http.put(Uri.parse(baseUrl + endPoint),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzZhZjY3N2VhM2EwZmEyYzg2NDEwNSIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxNDg2MDM5NCwiZXhwIjoxNzE1MTE5NTk0fQ.fvjH39Mrhq_USd1EgqnNvjeWJ79y8385WSqJqqO_6mc',
        },
        body: data);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      throw HttpException(errorMessage);
    }
  }

  static Future<http.Response> deleteRequest({
    required String endPoint,
    required int id,
  }) async {
    // final sharedPrefs = await SharedPreferences.getInstance();
    // final token = sharedPrefs.getString('token');
    final response = await http.delete(
      Uri.parse('$baseUrl$endPoint/$id'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzZhZjY3N2VhM2EwZmEyYzg2NDEwNSIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxNDg2MDM5NCwiZXhwIjoxNzE1MTE5NTk0fQ.fvjH39Mrhq_USd1EgqnNvjeWJ79y8385WSqJqqO_6mc',
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      throw HttpException(errorMessage);
    }
  }
}
