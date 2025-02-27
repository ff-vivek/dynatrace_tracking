// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/api_requests/api_interceptor.dart';
import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';

// Step 3: Create Interceptor
// Step 4: Add Interceptor to API calls
class DynatraceInterceptor extends FFApiInterceptor {
  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Perform any necessary calls or modifications to the [options] before
    // the API call is made.
    WebRequestTiming timing = await Dynatrace()
        .getCurrentAction()
        .createWebRequestTiming(options.apiUrl);
    print(timing);

    Map<String, dynamic> headers = options.headers;
    if (timing.getRequestTag() != '') {
      headers[timing.getRequestTagHeader()] = timing.getRequestTag();
    }
    return options;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    // Perform any necessary calls or modifications to the [response] prior
    // to returning it.
    WebRequestTiming timing = await Dynatrace()
        .getCurrentAction()
        .createWebRequestTiming(
            response.response?.request?.url.toString() ?? '');

    timing.stopWebRequestTiming(
        response.statusCode, response.response?.reasonPhrase);
    return response;
  }
}
