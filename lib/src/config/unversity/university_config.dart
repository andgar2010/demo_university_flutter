library university;

import '../../domains/domains.dart';

class UniversityConfig {
  late UniversityUsecase universityUsecase;

  UniversityConfig(UniversityGateway api) {
    universityUsecase = UniversityUsecase(api);
  }
}
