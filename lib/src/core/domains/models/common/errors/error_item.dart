library core;

import 'dart:convert';

class ErrorItem {
  ErrorItem({
    this.code,
    this.message,
    this.alertType,
    this.title,
  });

  String? alertType;
  String? code;
  String? message;
  String? title;

  factory ErrorItem.fromJson(String str) => ErrorItem.fromMap(json.decode(str));

  String toJson(ErrorItem data) => json.encode(toMap(data));

  factory ErrorItem.fromMap(Map<String, dynamic> json) {
    final ErrorItem errorItem = ErrorItem(
      code: json['code'],
      message: json['message'],
      alertType: json['type'] ?? 'Alert',
    );
    return errorItem;
  }

  Map<String, dynamic> toMap(ErrorItem data) {
    final Map<String, Object> map = {
      'code': data.code ?? '',
      'message': data.message ?? '',
      'type': data.alertType ?? ''
    };
    return map;
  }
}
