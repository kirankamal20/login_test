import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test/features/login/controller/login_notifier_pod.dart';
import 'package:login_test/features/login/state/login_state.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({required this.login, super.key});
  final void Function() login;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginstate = ref.watch(loginStatePod);
    return loginstate.when(
      data: (data) => data.map(
        initialState: (p0) => ElevatedButton(
            onPressed: () {
              login();
            },
            child: 'Login'.text.make().p(10)),
        loadingState: (p0) => ElevatedButton(
            onPressed: () {},
            child: const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )),
        loadedState: (p0) {
          return ElevatedButton(
              onPressed: () {
                login();
              },
              child: 'Login Succcess'.text.make().p(10));
        },
        loginErrorState: (p0) => ElevatedButton(
            onPressed: () {
              login();
            },
            child: 'Retry'.text.make().p(10)),
      ),
      error: (error, stackTrace) => ElevatedButton(
          onPressed: () {
            login();
          },
          child: 'Retry'.text.make().p(10)),
      loading: () => ElevatedButton(
        onPressed: () {},
        child: const SizedBox(
          height: 5,
          width: 5,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
