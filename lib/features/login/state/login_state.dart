abstract class LoginState {
  LoginState();
}

class InitialState extends LoginState {
  InitialState();
}

class LoadingState extends LoginState {
  LoadingState();
}

class LoadedState extends LoginState {
  LoadedState();
}

class LoginErrorState extends LoginState {
  LoginErrorState();
}

extension LoginStateUnion on LoginState {
  T map<T>({
    required T Function(InitialState) initialState,
    required T Function(LoadingState) loadingState,
    required T Function(LoadedState) loadedState,
    required T Function(LoginErrorState) loginErrorState,
  }) {
    if (this is InitialState) {
      return initialState(this as InitialState);
    }
    if (this is LoadingState) {
      return loadingState(this as LoadingState);
    }
    if (this is LoadedState) {
      return loadedState(this as LoadedState);
    }
    if (this is LoginErrorState) {
      return loginErrorState(this as LoginErrorState);
    }
    throw AssertionError('Union does not match any possible values');
  }
}