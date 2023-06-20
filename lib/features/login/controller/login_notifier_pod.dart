import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test/features/login/controller/notifier/login_notifier.dart';
import 'package:login_test/features/login/state/login_state.dart';

final loginStatePod =
    AsyncNotifierProvider.autoDispose<LoginNotifier, LoginState>(
        LoginNotifier.new);
