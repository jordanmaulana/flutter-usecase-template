class Resource<T, E> {
  final T? data;
  final E? error;

  const Resource._({this.data, this.error});

  factory Resource.success(T data) => Resource._(data: data);
  factory Resource.failure(E error) => Resource._(error: error);

  void when({
    required void Function(T data) onSuccess,
    required void Function(E error) onFailure,
  }) {
    if (data != null) {
      onSuccess(data as T);
    } else if (error != null) {
      onFailure(error as E);
    }
  }

  bool get hasData => data != null;
  bool get hasError => error != null;
}

extension ResourceExtensions<T> on T {
  Resource<T, E> toResourceSuccess<E>() {
    return Resource.success(this);
  }
}

extension ResourceFailureExtension<E> on E {
  Resource<T, E> toResourceFailure<T>() {
    return Resource.failure(this);
  }
}
