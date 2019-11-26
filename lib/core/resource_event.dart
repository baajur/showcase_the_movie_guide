import 'package:equatable/equatable.dart';

abstract class Event<T> extends Equatable {
  final T data;

  Event({this.data});

  factory Event.load({T data}) => LoadEvent._(data);

  @override
  List<Object> get props => [data];
}

class LoadEvent<T> extends Event<T> {
  LoadEvent._(T data) : super(data: data);
}
