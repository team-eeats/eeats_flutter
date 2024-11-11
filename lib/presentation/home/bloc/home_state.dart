enum HomeRemoteState { initial, loading, success, failure }

sealed class HomeState<T> {
  HomeRemoteState state;
  T? valueOrNull;
  Object? error;

  T get value => this.valueOrNull!;

  HomeState({
    required this.state,
    this.valueOrNull,
    this.error,
  });
}

class Initial<T> extends HomeState<T> {
  final T data;

  Initial({
    required this.data,
  }) : super(state: HomeRemoteState.initial, valueOrNull: data);
}

class Loading<T> extends HomeState<T> {
  final T data;

  Loading({
    required this.data,
  }) : super(state: HomeRemoteState.loading, valueOrNull: data);
}

class Success<T> extends HomeState<T> {
  final T data;

  Success({
    required this.data,
  }) : super(state: HomeRemoteState.success, valueOrNull: data);
}

class Failure<T> extends HomeState<T> {
  final Object? message;

  Failure({
    required this.message,
  }) : super(state: HomeRemoteState.failure, error: message);
}
