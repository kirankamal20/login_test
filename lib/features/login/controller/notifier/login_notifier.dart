import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test/data/repository/login/login_repository_pod.dart';
import 'package:login_test/features/login/state/login_state.dart';

class LoginNotifier extends AutoDisposeAsyncNotifier<LoginState> {
  @override
  FutureOr<LoginState> build() {
    return InitialState();
  }

  void login(
      {required String username,
      required String pasword,
      required Function() onSuccess,
      required Function() onError}) async {
    state = AsyncValue.data(LoadingState());
    final result = await ref
        .watch(loginRepositoryPod)
        .login(username: username, password: pasword);

    result.when((success) {
      onSuccess();
      state = AsyncValue.data(LoadedState());
    }, (error) {
      onError();
      state = AsyncValue.data(LoginErrorState());
    });
  }
}
