import '../../core.dart';

class ApiException extends BaseException {
  ApiException(ErrorItem errorItem) : super(errorItem);
}
