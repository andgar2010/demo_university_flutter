library university;

import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../domains.dart';

class UniversityUsecase {
  final UniversityGateway _gateway;

  UniversityUsecase(this._gateway);

  Future<Either<ErrorItem, List<UniversityModel?>?>> getUniversity() async =>
      _gateway.university();
}
