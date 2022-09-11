library core;

import 'package:flutter/material.dart';

import '../../../../core.dart';

class TybaApiClient implements BaseApiClientGateway {
  final BuildContext _context;
  late BaseApiClient _baseClient;

  TybaApiClient(this._context) {
    _baseClient = BaseApiClient(_context);
  }

  @override
  Future<Map<String, dynamic>> get(
    String service, {
    Map<String, String>? params,
    HttpContentType? contentType = HttpContentType.Json,
    int timeOut = 10,
  }) async {
    Map<String, dynamic>? response = await _baseClient.getAsync(
      service,
      params,
      contentType,
      timeOut: timeOut,
    );
    return _validateResponse(response!);
  }

  @override
  Future<Map<String, dynamic>> send(
    HttpRequestType method,
    String service, {
    Map<String, dynamic>? data,
    HttpContentType? contentType = HttpContentType.Json,
    int timeOut = 10,
  }) async {
    throw UnimplementedError();
  }

  Map<String, dynamic> _validateResponse(Map<String, dynamic> response) {
    if (response.containsKey('errors')) {
      ErrorBase errors = ErrorBase.fromMap(response);
      ErrorItem item = errors.errors![0];
      throw ApiException(item);
    }

    return response;
  }
}
