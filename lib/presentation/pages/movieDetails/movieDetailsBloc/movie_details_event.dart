import 'package:equatable/equatable.dart';

import '../../../../domain/models/movie.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieDetails extends MovieDetailsEvent {
  final Movie movie;

  LoadMovieDetails(this.movie);

  @override
  List<Object> get props => [movie];
}
