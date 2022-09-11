library core;

import '../../../core.dart';

abstract class BaseApiClientGateway {
  Future<dynamic> get(
    String service, {
    Map<String, String>? params,
    HttpContentType? contentType,
  });

  Future<dynamic> send(
    HttpRequestType method,
    String service, {
    Map<String, dynamic>? data,
    HttpContentType? contentType,
  });
}
