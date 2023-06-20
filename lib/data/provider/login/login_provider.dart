// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'i_login_provider.dart';

class LoginProvider implements ILoginProvider {
  Dio dio;
  LoginProvider({
    required this.dio,
  });
  @override
  Future<Response> login({required String username, required String password}) {
    return dio
        .post('mainLogin', data: {"username": username, "password": password});
  }
}
