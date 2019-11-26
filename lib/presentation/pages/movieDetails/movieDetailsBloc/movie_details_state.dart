import 'package:equatable/equatable.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  List<Object> get props => [];
}

class Loading extends MovieDetailsState {}

class Loaded extends MovieDetailsState {
  final MovieDetails movieDetails;

  Loaded(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}

class Error extends MovieDetailsState {
  final Exception exception;

  Error(this.exception);

  @override
  List<Object> get props => [exception];
}
