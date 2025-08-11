sealed class RequestState<T> {
  const RequestState();
}

class RequestStateInitial<T> extends RequestState<T> {
  const RequestStateInitial();
}

class RequestStateSuccess<T> extends RequestState<T> {
  final T data;
  const RequestStateSuccess(this.data);
}

class RequestStateLoading<T> extends RequestState<T> {
  const RequestStateLoading();
}

class RequestStateError<T> extends RequestState<T> {
  final String message;
  const RequestStateError(this.message);

}