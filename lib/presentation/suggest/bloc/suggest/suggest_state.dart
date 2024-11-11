enum SuggestRemoteState { initial, loading, success, failure }

sealed class SuggestState<T> {
  SuggestRemoteState state;
  T? valueOrNull;
  Object? error;

  T get value => this.valueOrNull!;

  SuggestState({
    required this.state,
    this.valueOrNull,
    this.error,
  });
}

class Initial<T> extends SuggestState<T> {
  final T data;

  Initial({
    required this.data,
  }) : super(state: SuggestRemoteState.initial, valueOrNull: data);
}

class Loading<T> extends SuggestState<T> {
  final T data;

  Loading({
    required this.data,
  }) : super(state: SuggestRemoteState.loading, valueOrNull: data);
}

class Success<T> extends SuggestState<T> {
  final T data;

  Success({
    required this.data,
  }) : super(state: SuggestRemoteState.success, valueOrNull: data);
}

class Failure<T> extends SuggestState<T> {
  final Object? message;

  Failure({
    required this.message,
  }) : super(state: SuggestRemoteState.failure, error: message);
}
