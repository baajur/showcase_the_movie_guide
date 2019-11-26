import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadFilms extends MoviesEvent {}

class LoadTvShows extends MoviesEvent {}
