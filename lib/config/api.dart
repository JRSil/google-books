import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> get(
    String url, {
    required String urlPath,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final Uri urlParsed = Uri.https(url, urlPath, queryParameters);

    try {
      final response = await http.get(urlParsed, headers: headers);

      if (kDebugMode) {
        print("Url: $urlParsed");
        print("Response: ${response.statusCode} / ${response.body}");
      }

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final Uri urlParsed = Uri.parse(url);

    try {
      final response = await http.post(
        urlParsed,
        headers: headers,
        body: body,
      );

      if (kDebugMode) {
        print("Url: $urlParsed");
        print("Response: ${response.statusCode} / ${response.body}");
      }

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
