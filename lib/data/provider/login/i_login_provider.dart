import 'package:dio/dio.dart';

abstract class ILoginProvider {
  Future<Response> login({required String username, required String password});
}
