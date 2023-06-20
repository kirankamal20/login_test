import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test/shared/dio_client/default_api_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

final dioProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  dio.options.baseUrl =
      'https://ensemble-uat.lp-its.com/FlutterAuditService.asmx/';

  dio.interceptors.add(
    TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
      ),
    ),
  );
  dio.interceptors.addAll([
    RetryInterceptor(
      dio: dio,
      // logPrint: talker.log, // specify log function (optional)
      // retry count (optional)
      retries: 2,
      retryDelays: [
        const Duration(seconds: 2),
        const Duration(seconds: 4),
        const Duration(seconds: 6),
      ],
      retryEvaluator: (error, i) {
        // only retry on DioError
        if (error.error is SocketException) {
          // only retry on timeout error
          return true;
        } else {
          return false;
        }
      },
    ),
    DefaultAPIInterceptor(dio: dio),
  ]);
  // fixBadCertificate(dio: dio, platform: ref.read(platFormPod));
  return dio;
});
