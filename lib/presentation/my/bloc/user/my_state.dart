enum MyRemoteState { initial, loading, success, failure }

sealed class MyState<T> {
  MyRemoteState state;
  T? valueOrNull;
  Object? error;

  T get value => this.valueOrNull!;

  MyState({
    required this.state,
    this.valueOrNull,
    this.error,
  });
}

class Initial<T> extends MyState<T> {
  final T data;

  Initial({
    required this.data,
  }) : super(state: MyRemoteState.initial, valueOrNull: data);
}

class Loading<T> extends MyState<T> {
  final T data;

  Loading({
    required this.data,
  }) : super(state: MyRemoteState.loading, valueOrNull: data);
}

class Success<T> extends MyState<T> {
  final T data;

  Success({
    required this.data,
  }) : super(state: MyRemoteState.success, valueOrNull: data);
}

class Failure<T> extends MyState<T> {
  final Object? message;

  Failure({
    required this.message,
  }) : super(state: MyRemoteState.failure, error: message);
}
