import 'dart:io';
import 'package:http/http.dart' as http;

abstract class BaseApi {
  static String get baseUrl => 'http://127.0.0.1:5000/api/dashboard/';
  static final client = http.Client();
  static const _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmI5ZmJhMzEyNjEyNGVhY2U2YmJkOSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcyMzU3MjIwNSwiZXhwIjoxNzMyMjEyMjA1fQ.P3gm62ytDR4wcZh8mNI3fzyCNDsRfqkmYgMtBBNJaDo';
  
  static Future<http.Response> getRequest({
    required String endPoint,
  }) async {
    final response = await client.get(Uri.parse(baseUrl + endPoint), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      'Authorization': 'Bearer $_token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw HttpException(
          'An error occurred body: ${response.body} status code: ${response.statusCode}');
    }
  }

  static Future<http.Response> postRequest(
      {required String endPoint, Map<String, dynamic>? data}) async {
    final response = await client.post(Uri.parse(baseUrl + endPoint),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: data);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw HttpException(
          'An error occurred body: ${response.body} status code: ${response.statusCode}');
    }
  }

  static Future<http.Response> putRequest(
      {required String endPoint,
      required String id,
      required Map<String, dynamic> data,
      requierd}) async {
    final response = await client.put(Uri.parse('${baseUrl + endPoint}/$id'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: data);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw HttpException(
          'An error occurred body: ${response.body} status code: ${response.statusCode}');
    }
  }

  static Future<http.Response> deleteRequest({
    required String endPoint,
    required String id,
  }) async {
    final response = await client.delete(
      Uri.parse('${baseUrl + endPoint}/$id'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw HttpException(
          'An error occurred body: ${response.body} status code: ${response.statusCode}');
    }
  }
}
