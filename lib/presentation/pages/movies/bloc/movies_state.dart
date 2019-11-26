import 'package:equatable/equatable.dart';
import 'package:showcase_the_movie_guide/domain/models/movie_category.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class Loading extends MoviesState {}

class Films extends MoviesState {
  final List<MovieCategory> films;

  Films(this.films);

  @override
  List<Object> get props => [films];
}

class TvShows extends MoviesState {
  final List<MovieCategory> tvShows;

  TvShows(this.tvShows);

  @override
  List<Object> get props => [tvShows];
}

class Error extends MoviesState {
  final Exception exception;

  Error(this.exception);

  @override
  List<Object> get props => [exception];
}
