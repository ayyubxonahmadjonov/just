import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'http_response.dart';
// ignore: depend_on_referenced_packages
// import 'package:alice/alice.dart';

class HttpInspector {
  const HttpInspector._();
  // static final Alice _alice = Alice(navigatorKey: AppNavigator.navigatorKey);
  static onResponse(http.Response response) {
    if (kDebugMode) {
      // var decoded = jsonDecode(response.body);
      // String str = const JsonEncoder.withIndent(' ').convert(decoded);
      // str.printf(name: 'HttpInspector');
      // _alice.onHttpResponse(response);
      // _responses.add(AppHttpResponse.fromResponse(response));
      // _streamController.sink.add(_responses);
      // Map<String, int> counts = getresponseCount();
      // NotificationService.showSimpleNotification(
      //   1,
      //   title: 'Beeto App (Total: ${counts['total']} requests)',
      //   body: 'Success  ${counts['success']} | Error ${counts['failure']}',
      // );
    }
  }

  static final _streamController = StreamController<List<AppHttpResponse>>();
  static final stream = _streamController.stream.asBroadcastStream();
  static final List<AppHttpResponse> _responses = [];
  static List<AppHttpResponse> get responses => _responses.reversed.toList();

  static Map<String, int> getresponseCount() {
    int success = 0;
    int failure = 0;

    for (var response in _responses) {
      if (response.statusCode == 200) {
        success++;
      } else {
        failure++;
      }
    }

    return {'total': success + failure, 'success': success, 'failure': failure};
  }
}

class HttpInfo {}
