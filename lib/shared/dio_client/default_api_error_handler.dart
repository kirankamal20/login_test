import 'package:dio/dio.dart';

Future<void> defaultAPIErrorHandler(
  DioError err,
  ErrorInterceptorHandler handler,
  Dio dio,
) async {
  switch (err.type) {
    case DioErrorType.connectionTimeout:
      handler.resolve(
        Response(
          data: {'detail': 'connect timeout error'},
          requestOptions: err.requestOptions,
        ),
      );
      break;
    case DioErrorType.sendTimeout:
      handler.resolve(
        Response(
          data: {'detail': 'sending data is slow'},
          requestOptions: err.requestOptions,
        ),
      );
      break;
    case DioErrorType.receiveTimeout:
      handler.resolve(
        Response(
          data: {'detail': 'receiving data is slow'},
          requestOptions: err.requestOptions,
        ),
      );
      break;
    case DioErrorType.badResponse:
      final response = err.response!;
      if (response.statusCode == 404) {
        handler.resolve(
          Response(
            data: {
              'detail': 'server error: status code ${response.statusCode}'
            },
            requestOptions: RequestOptions(path: err.requestOptions.path),
          ),
        );
      } else {
        handler.resolve(
          Response(
            data: response.data,
            requestOptions: RequestOptions(path: err.requestOptions.path),
          ),
        );
      }

      break;
    case DioErrorType.cancel:
      handler.resolve(
        Response(
          data: {'detail': 'user cancelled request'},
          requestOptions: err.requestOptions,
        ),
      );
      break;
    case DioErrorType.badCertificate:
      handler.resolve(
        Response(
          data: {'detail': 'Bad certificate'},
          requestOptions: err.requestOptions,
        ),
      );
      break;
    case DioErrorType.connectionError:
      handler.resolve(
        Response(
          data: {'detail': 'No Internet'},
          requestOptions: err.requestOptions,
        ),
      );
      break;
    case DioErrorType.unknown:
      handler.resolve(
        Response(
          data: {'detail': 'other error data:${err.response?.data}'},
          requestOptions: err.requestOptions,
        ),
      );
      break;
  }
}
