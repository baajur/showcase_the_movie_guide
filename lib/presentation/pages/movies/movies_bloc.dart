import 'dart:core';

import 'package:rxdart/rxdart.dart';
import 'package:showcase_the_movie_guide/domain/models/movie_category.dart';
import 'package:showcase_the_movie_guide/domain/repositories/movie_repository.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movies/movies_state.dart';

enum MoviesSection { film, tvShow }

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

class MoviesBloc {
  final Function(MoviesSection) load;

  final Stream<MoviesSection> section;
  final Stream<MoviesState> movies;

  final Function() dispose;

  MoviesBloc._(
    this.load,
    this.section,
    this.movies,
    this.dispose,
  );

  factory MoviesBloc(MovieRepository movieRepository) {
    final sectionController =
        BehaviorSubject<MoviesSection>.seeded(MoviesSection.film);
    final moviesController = BehaviorSubject<MoviesState>();

    final movies = sectionController
        .switchMap((event) => _load(movieRepository, event))
        .startWith(MoviesState.moviesLoading());

    final load = (MoviesSection section) {
      sectionController.add(section);
    };

    final dispose = () {
      sectionController.close();
      moviesController.close();
    };

    return MoviesBloc._(
      load,
      sectionController,
      movies,
      dispose,
    );
  }

  static Stream<MoviesState> _load(
      MovieRepository movieRepository, MoviesSection section) async* {
    yield MoviesState.moviesLoading();

    try {
      if (section == MoviesSection.film) {
        final categories = List<MovieCategory>();

        for (final category in _filmCategories) {
          categories.add(MovieCategory(
              category, await movieRepository.getFilmDataSource(category)));
        }

        yield MoviesState.moviesSuccess(categories: categories);
      } else if (section == MoviesSection.tvShow) {
        final categories = List<MovieCategory>();

        for (final category in _tvShowCategories) {
          categories.add(MovieCategory(
              category, await movieRepository.getTvShowDataSource(category)));
        }

        yield MoviesState.moviesSuccess(categories: categories);
      }
    } on Exception {
      yield MoviesState.moviesFailure();
    }
  }
}
