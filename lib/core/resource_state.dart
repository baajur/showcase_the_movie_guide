import 'package:equatable/equatable.dart';

abstract class ResourceState<T> extends Equatable {
  final T data;
  final Exception error;

  ResourceState({this.data, this.error});

  factory ResourceState.loading() => Loading._();

  factory ResourceState.success(T data) => Success._(data);

  factory ResourceState.error(Exception error) => Failure._(error);

  @override
  List<Object> get props => [data, error];
}

class Loading<T> extends ResourceState<T> {
  Loading._();
}

class Success<T> extends ResourceState<T> {
  Success._(T data) : super(data: data);
}

class Failure<T> extends ResourceState<T> {
  Failure._(Exception error) : super(error: error);
}
