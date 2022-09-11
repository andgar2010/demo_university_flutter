library core;

import '../../core.dart';

abstract class BaseException implements Exception {
  BaseException(this._errorItem);

  final ErrorItem _errorItem;

  @override
  String toString() {
    String codeStr = 'code: ${_errorItem.code}';
    String messageStr = 'message: ${_errorItem.message}';
    return '$codeStr - $messageStr';
  }

  ErrorItem getError() => _errorItem;
}
