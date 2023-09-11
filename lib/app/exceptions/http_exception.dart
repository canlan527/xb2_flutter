import 'package:xb2_flutter/app/exceptions/app_exception.dart';

class HttpException extends AppException {
  HttpException([String message = '网络请求出了问题']) : super(message);
}
