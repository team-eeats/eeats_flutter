enum NoticeDetailRemoteState { initial, loading, success, failure }

sealed class NoticeDetailState<T> {
  NoticeDetailRemoteState state;
  T? valueOrNull;
  Object? error;

  T get value => this.valueOrNull!;

  NoticeDetailState({
    required this.state,
    this.valueOrNull,
    this.error,
  });
}

class Initial<T> extends NoticeDetailState<T> {
  final T data;

  Initial({
    required this.data,
  }) : super(state: NoticeDetailRemoteState.initial, valueOrNull: data);
}

class Loading<T> extends NoticeDetailState<T> {
  final T data;

  Loading({
    required this.data,
  }) : super(state: NoticeDetailRemoteState.loading, valueOrNull: data);
}

class Success<T> extends NoticeDetailState<T> {
  final T data;

  Success({
    required this.data,
  }) : super(state: NoticeDetailRemoteState.success, valueOrNull: data);
}

class Failure<T> extends NoticeDetailState<T> {
  final Object? message;

  Failure({
    required this.message,
  }) : super(state: NoticeDetailRemoteState.failure, error: message);
}
