enum SplashRemoteState { initial, loading, success, failure }

sealed class SplashState<T> {
  SplashRemoteState state;
  T? valueOrNull;
  Object? error;

  T get value => this.valueOrNull!;

  SplashState({
    required this.state,
    this.valueOrNull,
    this.error,
  });
}

class Initial<T> extends SplashState<T> {
  final T data;

  Initial({
    required this.data,
  }) : super(state: SplashRemoteState.initial, valueOrNull: data);
}

class Loading<T> extends SplashState<T> {
  final T data;

  Loading({
    required this.data,
  }) : super(state: SplashRemoteState.loading, valueOrNull: data);
}

class Success<T> extends SplashState<T> {
  final T data;

  Success({
    required this.data,
  }) : super(state: SplashRemoteState.success, valueOrNull: data);
}

class Failure<T> extends SplashState<T> {
  final Object? message;

  Failure({
    required this.message,
  }) : super(state: SplashRemoteState.failure, error: message);
}
