library core;

import 'dart:convert';

import 'error_item.dart';

class ErrorBase {
  ErrorBase({this.errors});

  List<ErrorItem>? errors;

  factory ErrorBase.fromJson(String str) => ErrorBase.fromMap(json.decode(str));

  String toJson(ErrorBase data) => json.encode(toMap(data));

  factory ErrorBase.fromMap(Map<String, dynamic> json) {
    final ErrorBase errorItem = ErrorBase(
      errors: List<ErrorItem>.from(
        json['errors'].map((x) => ErrorItem.fromJson(x)),
      ),
    );
    return errorItem;
  }

  Map<String, dynamic> toMap(ErrorBase data) {
    final Map<String, Object> map = {
      'errors': data.errors!,
    };
    return map;
  }
}
