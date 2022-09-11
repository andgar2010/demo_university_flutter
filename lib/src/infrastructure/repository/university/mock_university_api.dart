import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../../domains/domains.dart';

class UniversityMockApi extends UniversityGateway {
  @override
  Future<Either<ErrorItem, List<UniversityModel?>?>> university() async {
    List<Map<String, Object?>> universitiesMock = [
      {
        'alpha_two_code': 'US',
        'domains': <String>['marywood.edu'],
        'country': 'United States',
        'state-province': null,
        'web_pages': <String>['http://www.marywood.edu'],
        'name': 'Marywood University'
      },
      {
        'alpha_two_code': 'US',
        'domains': <String>['lindenwood.edu'],
        'country': 'United States',
        'state-province': null,
        'web_pages': <String>['http://www.lindenwood.edu/'],
        'name': 'Lindenwood University'
      },
      {
        'alpha_two_code': 'US',
        'domains': <String>['pointpark.edu'],
        'country': 'United States',
        'state-province': 'Pennsylvania',
        'web_pages': <String>['https://pointpark.edu/'],
        'name': 'Point Park University'
      },
      {
        'alpha_two_code': 'US',
        'domains': <String>['northwood.edu'],
        'country': 'United States',
        'state-province': 'Michigan',
        'web_pages': <String>['https://northwood.edu/'],
        'name': 'Northwood University'
      }
    ];

    final List<UniversityModel?> universities =
        universitiesMock.map((university) {
      return UniversityModel.fromMap(university);
    }).toList();
    return right<ErrorItem, List<UniversityModel?>?>(universities);
  }
}
