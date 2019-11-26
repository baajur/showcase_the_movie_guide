import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../../../../domain/models/film.dart';
import '../../../../domain/models/movie.dart';
import '../../../../domain/models/tv_show.dart';
import '../../../../domain/repositories/movie_repository.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieRepository _movieRepository;

  MovieDetailsBloc(this._movieRepository);

  @override
  MovieDetailsState get initialState => Loading();

  @override
  Stream<MovieDetailsState> mapEventToState(
    MovieDetailsEvent event,
  ) async* {
    if (event is LoadMovieDetails) {
      yield* _mapLoadMovieDetailsToState(event);
    }
  }

  Stream<MovieDetailsState> _mapLoadMovieDetailsToState(
      LoadMovieDetails event) async* {
    try {
      if (event.movie is Film) {
        FilmDetails filmDetails =
            await _movieRepository.getFilmDetails(event.movie.id);
        yield Loaded(filmDetails);
      } else if (event.movie is TvShow) {
        TvShowDetails tvShowDetails =
            await _movieRepository.getTvShowDetails(event.movie.id);
        yield Loaded(tvShowDetails);
      }
    } catch (e) {
      yield Error(e);
    }
  }

  void loadMovieDetails(Movie movie) {
    add(LoadMovieDetails(movie));
  }
}
