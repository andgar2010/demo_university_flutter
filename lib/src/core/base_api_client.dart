library core;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../config/config.dart';
import 'core.dart';

class BaseApiClient {
  final BuildContext _context;
  AppConfig? _appConfig;

  BaseApiClient(this._context) {
    _appConfig = Provider.of<AppConfig>(_context, listen: false);
  }

  Client _createClient({int timeOut = 10}) {
    // HttpClient httpClient = HttpClient();
    // httpClient.idleTimeout = const Duration(seconds: 10);
    // httpClient.connectionTimeout = Duration(seconds: timeOut);
    Client client = Client();
    return client;
  }

  /// Petición http get Async
  ///
  /// [service] End-point del servicio
  ///
  /// [params] Parametros de la url
  ///
  /// [timeOut] Timeout de la petición (segundos)
  Future<Map<String, dynamic>?> getAsync(
    String service,
    Map<String, String>? params,
    HttpContentType? contentType, {
    int timeOut = 10,
  }) async {
    String queryString = '';

    if (params != null) {
      params.forEach(
        (key, value) {
          value = value.replaceAll(' ', '%20');
          if (queryString.isEmpty) {
            queryString += '?$key=$value';
          } else {
            queryString += '&$key=$value';
          }
        },
      );
    }

    String relativeUrl = _appConfig!.apiAssetsBaseUrl + service + queryString;
    Client httpClient = _createClient(timeOut: timeOut);
    Uri pathHttp = Uri.parse(relativeUrl);
    Response response = await httpClient.get(pathHttp);
    String stringDataJson = utf8.decode(response.bodyBytes);
    Map<String, dynamic>? decodedResponse = jsonDecode(stringDataJson);

    return decodedResponse;
  }
}
