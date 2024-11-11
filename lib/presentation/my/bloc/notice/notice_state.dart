enum NoticeRemoteState { initial, loading, success, failure }

sealed class NoticeState<T> {
  NoticeRemoteState state;
  T? valueOrNull;
  Object? error;

  T get value => this.valueOrNull!;

  NoticeState({
    required this.state,
    this.valueOrNull,
    this.error,
  });
}

class Initial<T> extends NoticeState<T> {
  final T data;

  Initial({
    required this.data,
  }) : super(state: NoticeRemoteState.initial, valueOrNull: data);
}

class Loading<T> extends NoticeState<T> {
  final T data;

  Loading({
    required this.data,
  }) : super(state: NoticeRemoteState.loading, valueOrNull: data);
}

class Success<T> extends NoticeState<T> {
  final T data;

  Success({
    required this.data,
  }) : super(state: NoticeRemoteState.success, valueOrNull: data);
}

class Failure<T> extends NoticeState<T> {
  final Object? message;

  Failure({
    required this.message,
  }) : super(state: NoticeRemoteState.failure, error: message);
}
