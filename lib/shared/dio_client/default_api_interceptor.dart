import 'package:dio/dio.dart';
 import 'package:login_test/shared/dio_client/default_api_error_handler.dart';

class DefaultAPIInterceptor extends Interceptor {
  DefaultAPIInterceptor({
    required this.dio,
  });
  final Dio dio;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    defaultAPIErrorHandler(err, handler, dio);
  }
}
