library university;

import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';
import '../../../domains/domains.dart';

class UniversityPresenter extends ChangeNotifier {
  UniversityPresenter({required this.config});

  final UniversityConfig config;

  List<UniversityModel?>? _model;

  Future<List<UniversityModel?>?>? getDataAll() async {
    return _universitiesRequestAll();
  }

  Future<List<UniversityModel?>?>? _universitiesRequestAll() async {
    Either<ErrorItem, List<UniversityModel?>?>? response =
        await config.universityUsecase.getUniversity();
    response.fold(
      (error) {},
      (data) {
        _model = data;
      },
    );
    return _model;
  }
}
