library university;

import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../domains.dart';

abstract class UniversityGateway {
  Future<Either<ErrorItem, List<UniversityModel?>?>> university();
}
