import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test/data/provider/login/login_proivder_pod.dart';
import 'package:login_test/data/repository/login/i_login_repository.dart';
import 'package:login_test/data/repository/login/login_repository.dart';

final loginRepositoryPod = Provider.autoDispose<ILoginRepository>((ref) {
  return LoginRepository(iLoginProvider: ref.watch(loginProvider));
});
