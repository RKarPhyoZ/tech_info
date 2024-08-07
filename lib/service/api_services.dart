import 'dart:convert';

import 'package:http/http.dart' as http;

import '../util/common.dart';

class ApiResponse {
  int statusCode;
  String bodyString;
  Map bodyData;

  ApiResponse({
    required this.statusCode,
    required this.bodyString,
    required this.bodyData,
  });
}

class ApiServices {
  static String apiToken = "";
  static bool byAuth = false;

  ApiResponse _convertResponse(http.Response response) {
    dynamic bodyData = '';

    try {
      bodyData = jsonDecode(response.body);
      if (response.statusCode == 401) {
        // _handleUnauthorized();
      } else if (response.statusCode == 503 || response.statusCode == 521) {
        // _handleServerMaintenance();
      }
    } catch (e) {
      bodyData = {};
    }

    return ApiResponse(
      statusCode: response.statusCode,
      bodyString: response.body,
      bodyData: bodyData,
    );
  }

  void _validateResponse(ApiResponse apiResponse, Function(Map) onSuccess,
      Function(Map) onFailure) {
    if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
      onSuccess(apiResponse.bodyData);
    } else {
      try {
        onFailure(apiResponse.bodyData);
      } catch (e) {
        Utils.errorAlert(apiResponse.bodyData["message"].toString());
      }
    }
  }

  Future<void> request({
    required String method,
    required String endPoint,
    Map<String, dynamic>? payload,
    bool xNeedToken = false,
    bool xBaseUrlIncluded = true,
    required Function(Map) onSuccess,
    required Function(Map) onFailure,
  }) async {
    try {
      http.Response response;
      Uri url = Uri.parse(
          xBaseUrlIncluded ? '${ApiEndPoints.baseUrl}$endPoint' : endPoint);

      if (method == 'GET') {
        response = await http.get(url, headers: _buildHeaders(xNeedToken));
      } else if (method == 'POST') {
        response = await http.post(url,
            body: jsonEncode(payload), headers: _buildHeaders(xNeedToken));
      } else {
        throw Exception('Unsupported HTTP method: $method');
      }

      ApiResponse apiResponse = _convertResponse(response);
      _validateResponse(apiResponse, onSuccess, onFailure);
    } catch (e) {
      onFailure({"message": "An error occurred: ${e.toString()}"});
    }
  }

  Map<String, String> _buildHeaders(bool xNeedToken) {
    return {
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      if (xNeedToken) 'Authorization': 'Bearer $apiToken',
    };
  }
}

class ApiEndPoints {
  static String baseUrl = "https://dummyjson.com/";
  static String category = "products/categories";
}
