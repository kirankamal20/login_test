import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test/data/provider/login/i_login_provider.dart';
import 'package:login_test/data/provider/login/login_provider.dart';
import 'package:login_test/shared/dio_client/dio_client_provider.dart';

final loginProvider = Provider.autoDispose<ILoginProvider>((ref) {
  return LoginProvider(dio: ref.watch(dioProvider));
});
