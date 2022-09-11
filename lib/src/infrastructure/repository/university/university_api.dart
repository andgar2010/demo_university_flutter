import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../../core/core.dart';
import '../../../domains/domains.dart';

class UniversityApi extends UniversityGateway {
  static const _apiBaseUrl = 'https://tyba-assets.s3.amazonaws.com';
  static const _service = '/FE-Engineer-test';

  @override
  Future<Either<ErrorItem, List<UniversityModel?>?>> university() async {
    const String urlUniversitiesJson = '$_apiBaseUrl$_service/universities.json';
    final Client client = Client();
    final Uri uri = Uri.parse(urlUniversitiesJson);
    final Response response = await client.get(uri);
    final String dataJson = utf8.decode(response.bodyBytes);
    final List decodedResponse = jsonDecode(dataJson);
    final List<UniversityModel> universities = decodedResponse
        .map((university) => UniversityModel.fromMap(university))
        .toList();

    return right<ErrorItem, List<UniversityModel?>?>(universities);
  }
}
