import 'package:http/http.dart' as http;

import '../../../core/constants/app_imports.dart';

class ApiService {
  ApiService._();
  static const String _baseUrl = "http://185.42.14.208/";
  static Map<String, String> _header() {
    final token = SharedPreferencesHelper().getString("access").toString();
    if (token.isEmpty || token == "null") {
      return {"Content-Type": "application/json"};
    }

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

  static Future<HttpResult> createIncome(
    String amount,
    String date,
    int category,
  ) async {
    return await _post(
      "api/income/",
      body: {"category": category, "amount": amount, "date": date},
    );
  }

  static Future<HttpResult> createExpense(
    String amount,
    String date,
    int category,
  ) async {
    return await _post(
      "api/expense/",
      body: {"category": category, "amount": amount, "date": date},
    );
  }

  static Future<HttpResult> getIncomeList() async {
    return await _get("api/income/");
  }

  static Future<HttpResult> getExpenseList() async {
    return await _get("api/expense/");
  }

  static Future<bool> refreshAccessToken() async {
    String? refreshToken = await SharedPreferencesHelper().getString("refresh");

    Uri url = Uri.parse('http://185.42.14.208/api/api/token/refresh/');
    try {
      var response = await http
          .post(url, body: {"refresh": refreshToken})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final newAccess = decoded["access"];
        final newRefresh = decoded["refresh"] ?? refreshToken;

        await SharedPreferencesHelper().setString("access", newAccess);
        await SharedPreferencesHelper().setString("refresh", newRefresh);

        return true;
      } else {
        /// Tokenlarni o'chiramiz
        await SharedPreferencesHelper().remove("access");
        await SharedPreferencesHelper().remove("refresh");
        await SharedPreferencesHelper().remove("user");

        /// SplashScreen ga redirect qilamiz
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => SplashScreen()),
          (route) => false,
        );

        return false;
      }
    } catch (e) {
      /// Tokenlarni o'chiramiz
      await SharedPreferencesHelper().remove("access");
      await SharedPreferencesHelper().remove("refresh");
      await SharedPreferencesHelper().remove("user");

      /// SplashScreen ga redirect qilamiz
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => SplashScreen()),
        (route) => false,
      );

      return false;
    }
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

      if (response.statusCode == 401) {
        final isRefreshed = await refreshAccessToken();
        if (isRefreshed) {
          return await _post(path, body: body, isSecondHeader: isSecondHeader);
        }
      }

      HttpInspector.onResponse(response);

      var decoded = jsonDecode(response.body);
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: response.statusCode == 200 || response.statusCode == 201,
        result: decoded,
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

      if (response.statusCode == 401) {
        final isRefreshed = await refreshAccessToken();
        if (isRefreshed) {
          return await _get(path); // Qayta yuborish
        }
      }

      HttpInspector.onResponse(response);

      var decoded = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        return HttpResult(statusCode: 200, isSuccess: true, result: decoded);
      } else {}
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
