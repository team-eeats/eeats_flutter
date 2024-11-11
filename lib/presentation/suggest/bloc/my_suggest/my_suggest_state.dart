enum MySuggestRemoteState { initial, loading, success, failure }

sealed class MySuggestState<T> {
  MySuggestRemoteState state;
  T? valueOrNull;
  Object? error;

  T get value => this.valueOrNull!;

  MySuggestState({
    required this.state,
    this.valueOrNull,
    this.error,
  });
}

class Initial<T> extends MySuggestState<T> {
  final T data;

  Initial({
    required this.data,
  }) : super(state: MySuggestRemoteState.initial, valueOrNull: data);
}

class Loading<T> extends MySuggestState<T> {
  final T data;

  Loading({
    required this.data,
  }) : super(state: MySuggestRemoteState.loading, valueOrNull: data);
}

class Success<T> extends MySuggestState<T> {
  final T data;

  Success({
    required this.data,
  }) : super(state: MySuggestRemoteState.success, valueOrNull: data);
}

class Failure<T> extends MySuggestState<T> {
  final Object? message;

  Failure({
    required this.message,
  }) : super(state: MySuggestRemoteState.failure, error: message);
}
