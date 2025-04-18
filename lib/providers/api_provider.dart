import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiProvider {
  final String _baseUrl = 'http://10.0.2.2/www/Partner/public/api';
  final GetStorage _storage = GetStorage();

  Future<Map<String, String>> getHeaders() async {
    String? token = _storage.read('access_token');
    if (token != null) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  // GET request
  Future<dynamic> get(String endpoint) async {
    var url = Uri.parse('$_baseUrl/$endpoint');
    var headers = await getHeaders();

    try {
      final response = await http.get(url, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // POST request
  Future<dynamic> post(String endpoint, dynamic data) async {
    var url = Uri.parse('$_baseUrl/$endpoint');
    var headers = await getHeaders();

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // PUT request
  Future<dynamic> put(String endpoint, dynamic data) async {
    var url = Uri.parse('$_baseUrl/$endpoint');
    var headers = await getHeaders();

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // DELETE request
  Future<dynamic> delete(String endpoint) async {
    var url = Uri.parse('$_baseUrl/$endpoint');
    var headers = await getHeaders();

    try {
      final response = await http.delete(url, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // Multipart POST request (for uploading files)
  Future<dynamic> multipartPost(String endpoint, Map<String, String> fields, List<http.MultipartFile> files) async {
    var url = Uri.parse('$_baseUrl/$endpoint');
    var headers = await getHeaders();

    try {
      var request = http.MultipartRequest('POST', url);
      request.headers.addAll(headers);
      request.fields.addAll(fields);
      request.files.addAll(files);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // Handle response
  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 400:
        throw Exception('Bad request: ${response.body}');
      case 401:
      case 403:
      // Handle unauthorized or forbidden
        Get.offAllNamed('/login');
        throw Exception('Unauthorized: ${response.body}');
      case 404:
        throw Exception('Not found: ${response.body}');
      case 500:
      default:
        throw Exception('Server error: ${response.body}');
    }
  }

// Handle error (continuation)
  void _handleError(dynamic error) {
    if (kDebugMode) {
      print('API Error: $error');
    }
    throw Exception('Error connecting to server: $error');
  }

  // Helper method for uploading images
  Future<List<String>> uploadImages(List<String> localPaths, String endpoint) async {
    List<String> uploadedUrls = [];

    for (var imagePath in localPaths) {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse('$_baseUrl/$endpoint')
      );

      var headers = await getHeaders();
      request.headers.addAll(headers);

      request.files.add(await http.MultipartFile.fromPath(
        'image',
        imagePath,
      ));

      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseData = json.decode(response.body);
          String imageUrl = responseData['url'];
          uploadedUrls.add(imageUrl);
        }
      } catch (e) {
        _handleError(e);
      }
    }

    return uploadedUrls;
  }
}