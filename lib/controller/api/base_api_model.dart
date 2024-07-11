import 'dart:io';
import 'package:http/http.dart' as http;

abstract class BaseApi {
  static String get baseUrl => 'http://127.0.0.1:5000/api/';

  static Future<http.Response> getRequest({
    required String endPoint,
  }) async {
    final response = await http.get(Uri.parse(baseUrl + endPoint), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NWVjNjdkZjAzNDYzMWRjM2M5MWQxNCIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxNzQ4NzQxNiwiZXhwIjoxNzI2MTI3NDE2fQ.1a4AixlrdPfcjVGw1Ij_qGz91EE_q5F67h3nUZSbh2E',
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
    final response = await http.post(Uri.parse(baseUrl + endPoint),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NWVjNjdkZjAzNDYzMWRjM2M5MWQxNCIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxNzQ4NzQxNiwiZXhwIjoxNzI2MTI3NDE2fQ.1a4AixlrdPfcjVGw1Ij_qGz91EE_q5F67h3nUZSbh2E',
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
    final response = await http.put(Uri.parse('${baseUrl + endPoint}/$id'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NWVjNjdkZjAzNDYzMWRjM2M5MWQxNCIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxNzQ4NzQxNiwiZXhwIjoxNzI2MTI3NDE2fQ.1a4AixlrdPfcjVGw1Ij_qGz91EE_q5F67h3nUZSbh2E',
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
    final response = await http.delete(
      Uri.parse('${baseUrl + endPoint}/$id'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NWVjNjdkZjAzNDYzMWRjM2M5MWQxNCIsImlzQWRtaW4iOnRydWUsImlhdCI6MTcxNzQ4NzQxNiwiZXhwIjoxNzI2MTI3NDE2fQ.1a4AixlrdPfcjVGw1Ij_qGz91EE_q5F67h3nUZSbh2E',
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
