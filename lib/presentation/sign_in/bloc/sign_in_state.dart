enum SignInRemoteState { initial, loading, success, failure }

sealed class SignInState<T> {
  SignInRemoteState state;
  T? valueOrNull;
  Object? error;

  T get value => this.valueOrNull!;

  SignInState({
    required this.state,
    this.valueOrNull,
    this.error,
  });
}

class Initial<T> extends SignInState<T> {
  final T data;

  Initial({
    required this.data,
  }) : super(state: SignInRemoteState.initial, valueOrNull: data);
}

class Loading<T> extends SignInState<T> {
  Loading() : super(state: SignInRemoteState.loading);
}

class Success<T> extends SignInState<T> {
  final T data;

  Success({
    required this.data,
  }) : super(state: SignInRemoteState.success, valueOrNull: data);
}

class Failure<T> extends SignInState<T> {
  final Object? message;

  Failure({
    required this.message,
  }) : super(state: SignInRemoteState.failure, error: message);
}
