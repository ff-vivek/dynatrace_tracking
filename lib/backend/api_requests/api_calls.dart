import 'dart:convert';
import 'dart:typed_data';
import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';

import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetTodoCall {
  static Future<ApiCallResponse> call() async {
    final client = Dynatrace().createHttpClient();
    final response = await FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'get todo',
        apiUrl: 'https://jsonplaceholder.typicode.com/todos/2',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      client: client,
      interceptors,
    );
    client.close();
    return response;
  }

  static final interceptors = [
    ExampleInterceptor(),
  ];
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
