import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:real_project/service/shared_preferences)service.dart';

import 'http_inspector.dart';
import 'http_result.dart';

class ApiService {
  ApiService._();
  static const String _baseUrl = "http://185.42.14.208/";

  static Map<String, String> _header() {
    final token = SharedPreferencesHelper().getString("access").toString();
    print('bu token == $token');
    if (token.isEmpty || token == "null") {
      print('token bosh');
      return {"Content-Type": "application/json"};
    }
    print('token is not empty $token');
    print("Authorization header: Bearer $token");

    return {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token',
    };
  }

  static Map<String, String> _header2() {
    return {"Content-Type": "application/json"};
  }

  //=====LOGIN=====
  static Future<HttpResult> login(String email, String password) async {
    var body = {"email": email, "password": password};

    return await _post("api/login/", body: body);
  }

  static Future<HttpResult> registr(
    String name,
    String email,
    String password,
  ) async {
    var body = {"full_name": name, "email": email, "password": password};

    return await _post("api/register/", body: body);
  }

  static Future<HttpResult> resetPasswordbyEmail(String email) async {
    var body = {"email": email};

    return await _post("api/forgot-password/send-code/", body: body);
  }

  static Future<HttpResult> confirmSmsCode(
    String email,
    String code,
    String new_Password,
  ) async {
    var body = {"email": email, "code": code, "new_password": new_Password};

    return await _post("api/forgot-password/reset/", body: body);
  }

  static Future<HttpResult> getProfile() async {
    return await _get("api/profile/");
  }
  //=====GET ALL COURSES =====

  static Future<HttpResult> _post(
    String path, {
    Object? body,
    bool? isSecondHeader = false,
  }) async {
    Uri url = Uri.parse('$_baseUrl$path');
    try {
      http.Response response = await http
          .post(
            url,
            body: jsonEncode(body),
            headers: isSecondHeader == true ? _header2() : _header(),
          )
          .timeout(const Duration(seconds: 30));

      HttpInspector.onResponse(response);

      var decoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return HttpResult(
          statusCode: response.statusCode,
          isSuccess: true,
          result: decoded,
        );
      }

      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }

      return HttpResult(
        statusCode: response.statusCode,
        // result: decoded['message'].toString(),
        result: decoded.toString(),

        path: path,
      );
    } catch (err) {
      return HttpResult(statusCode: -1, result: err, path: path);
    }
  }

  static Future<HttpResult> _get(String path) async {
    Uri url;
    url = Uri.parse('$_baseUrl$path');
    try {
      http.Response response = await http
          .get(url, headers: _header())
          .timeout(const Duration(seconds: 30));
      HttpInspector.onResponse(response);

      var decoded = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        return HttpResult(statusCode: 200, isSuccess: true, result: decoded);
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(
        statusCode: response.statusCode,
        // result: decoded['message'].toString(),
        result: decoded.toString(),
        path: path,
        method: 'GET',
      );
    } catch (err) {
      return HttpResult(statusCode: -1, result: err, path: path, method: 'GET');
    }
  }

  static Future<HttpResult> _patch(String path, {Object? body}) async {
    Uri url = Uri.parse('$_baseUrl$path');

    try {
      http.Response response = await http
          .patch(url, body: jsonEncode(body), headers: _header())
          .timeout(const Duration(seconds: 30));
      HttpInspector.onResponse(response);
      var decoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return HttpResult(
          statusCode: 200,
          isSuccess: true,
          result: decoded,
          method: 'PATCH',
          path: path,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(
        statusCode: response.statusCode,
        result: decoded['message'].toString(),
        method: 'PATCH',
        path: path,
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        method: 'PATCH',
        path: path,
      );
    }
  }
}

class AppStrings2 {
  static const String INVALID_RESPONSE = 'Неверный ответ';
  static const String SOCKET_EXCEPTION = 'Нет соединения с интернетом';
  static const String FORMAT_ERROR = 'Неверный формат';
  static const String UNKNOWN_ERROR = 'Неизвестная ошибка';
  static const String TIMEOUT_EXCEPTION = 'Исключение тайм-аута';
  static const String HTTP_ERROR = 'HTTP-ошибка';
}
