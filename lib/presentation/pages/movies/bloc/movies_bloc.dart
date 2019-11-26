import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:showcase_the_movie_guide/domain/models/movie_category.dart';

import './bloc.dart';
import '../../../../domain/repositories/movie_repository.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository _movieRepository;

  final List<String> _filmCategories = [
    'popular',
    'top_rated',
    'now_playing',
    'upcoming',
  ];

  final List<String> _tvShowCategories = [
    'popular',
    'top_rated',
    'on_the_air',
  ];

  MoviesBloc(this._movieRepository);

  @override
  MoviesState get initialState => Loading();

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is LoadFilms) {
      yield* _mapLoadFilmsToState();
    } else if (event is LoadTvShows) {
      yield* _mapLoadTvShowsToState();
    }
  }

  Stream<MoviesState> _mapLoadFilmsToState() async* {
    try {
      final result = List<MovieCategory>();

      for (int i = 0; i < _filmCategories.length; i++) {
        result.add(MovieCategory(_filmCategories[i],
            await _movieRepository.getFilmDataSource(_filmCategories[i])));
      }

      yield Films(result);
    } catch (e) {
      yield Error(e);
    }
  }

  Stream<MoviesState> _mapLoadTvShowsToState() async* {
    try {
      final result = List<MovieCategory>();

      for (int i = 0; i < _tvShowCategories.length; i++) {
        result.add(MovieCategory(_tvShowCategories[i],
            await _movieRepository.getTvShowDataSource(_tvShowCategories[i])));
      }

      yield TvShows(result);
    } catch (e) {
      yield Error(e);
    }
  }

  void loadFilms() {
    add(LoadFilms());
  }

  void loadTvShows() {
    add(LoadTvShows());
  }
}
