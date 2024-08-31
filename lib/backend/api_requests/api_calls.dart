import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchClaimsCall {
  static Future<ApiCallResponse> call({
    String? searchString = 'Dan',
    String? columnName = 'name',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search claims',
      apiUrl:
          'https://nsoghqqtwvbssfeqjrtf.supabase.co/rest/v1/claims?$columnName=ilike.*$searchString*&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zb2docXF0d3Zic3NmZXFqcnRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUwMzUxNDAsImV4cCI6MjA0MDYxMTE0MH0.POytBQ0lSHpaWY0QMB8aPBPWGf9o0Ao7bjiyITteav0',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zb2docXF0d3Zic3NmZXFqcnRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUwMzUxNDAsImV4cCI6MjA0MDYxMTE0MH0.POytBQ0lSHpaWY0QMB8aPBPWGf9o0Ao7bjiyITteav0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllClaimsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get all claims',
      apiUrl:
          'https://nsoghqqtwvbssfeqjrtf.supabase.co/rest/v1/claims?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zb2docXF0d3Zic3NmZXFqcnRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUwMzUxNDAsImV4cCI6MjA0MDYxMTE0MH0.POytBQ0lSHpaWY0QMB8aPBPWGf9o0Ao7bjiyITteav0',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zb2docXF0d3Zic3NmZXFqcnRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUwMzUxNDAsImV4cCI6MjA0MDYxMTE0MH0.POytBQ0lSHpaWY0QMB8aPBPWGf9o0Ao7bjiyITteav0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProcessPhotoCall {
  static Future<ApiCallResponse> call({
    String? imageUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "url": "$imageUrl"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'processPhoto',
      apiUrl: 'http://52.224.95.167/sentinel-corsair',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
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
  if (item is DocumentReference) {
    return item.path;
  }
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
