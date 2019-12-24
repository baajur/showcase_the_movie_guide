import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:showcase_the_movie_guide/domain/models/film.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/domain/models/tv_show.dart';
import 'package:showcase_the_movie_guide/domain/repositories/movie_repository.dart';
import 'package:showcase_the_movie_guide/domain/repositories/user_repository.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_bloc.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movieDetails/movie_details_state.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movieDetails/movie_details_event.dart';

class MovieDetailsBloc {
  final Function(Movie) loadMovieDetails;
  final Function(Movie, bool) updateFavorite;
  final Function(Movie, bool) updateWatchlist;

  final Stream<MovieDetailsState> movieDetails;
  final Stream<bool> favorite;
  final Stream<bool> watchlist;

  final Function() dispose;

  MovieDetailsBloc._(
    this.loadMovieDetails,
    this.updateFavorite,
    this.updateWatchlist,
    this.movieDetails,
    this.favorite,
    this.watchlist,
    this.dispose,
  );

  factory MovieDetailsBloc(UserRepository userRepository,
      MovieRepository movieRepository, UserBloc userBloc, Movie movie) {
    final movieDetailsController = BehaviorSubject<MovieDetailsState>();
    final updateListsController = PublishSubject<UpdateListsEvent>();
    final favoriteController = BehaviorSubject<bool>();
    final watchlistController = BehaviorSubject<bool>();

    final updateLists = updateListsController
        .switchMap((event) => _updateLists(userRepository, event, userBloc))
        .listen(
          (event) => event.when(
            updateFavoriteSuccess: (state) =>
                favoriteController.add(state.favorite),
            updateFavoriteFailure: (state) =>
                favoriteController.add(!state.favorite),
            updateWatchlistSuccess: (state) =>
                watchlistController.add(state.watchlist),
            updateWatchlistFailure: (state) =>
                watchlistController.add(!state.watchlist),
          ),
        );

    final loadMovieDetails = (Movie movie) {
      _loadMovieDetails(movieRepository, movie).pipe(movieDetailsController);

      final favorites = userBloc.favoriteMovies.value;
      final watchlist = userBloc.watchlistMovies.value;

      favoriteController.add(
          favorites.any((i) => i.id == movie.id && i.title == movie.title));
      watchlistController.add(
          watchlist.any((i) => i.id == movie.id && i.title == movie.title));
    };

    final updateFavorite = (Movie movie, bool favorite) {
      updateListsController.add(
          UpdateListsEvent.updateFavorite(movie: movie, favorite: favorite));
    };

    final updateWatchlist = (Movie movie, bool watchlist) {
      updateListsController.add(
          UpdateListsEvent.updateWatchlist(movie: movie, watchlist: watchlist));
    };

    final dispose = () {
      updateListsController.close();
      favoriteController.close();
      watchlistController.close();
      updateLists.cancel();
    };

    return MovieDetailsBloc._(
      loadMovieDetails,
      updateFavorite,
      updateWatchlist,
      movieDetailsController,
      favoriteController,
      watchlistController,
      dispose,
    );
  }

  static Stream<MovieDetailsState> _loadMovieDetails(
      MovieRepository movieRepository, Movie movie) async* {
    yield MovieDetailsState.movieDetailsLoading();

    try {
      if (movie is Film) {
        final movieDetails = await movieRepository.getFilmDetails(movie.id);

        yield MovieDetailsState.movieDetailsSuccess(movieDetails: movieDetails);
      } else if (movie is TvShow) {
        final movieDetails = await movieRepository.getTvShowDetails(movie.id);

        yield MovieDetailsState.movieDetailsSuccess(movieDetails: movieDetails);
      }
    } on Exception {
      yield MovieDetailsState.movieDetailsFailure();
    }
  }

  static Stream<UpdateListsState> _updateLists(
      UserRepository userRepository, UpdateListsEvent event, UserBloc userBloc) async* {
    if (event is UpdateFavorite) {
      yield UpdateListsState.updateFavoriteSuccess(
          movie: event.movie, favorite: event.favorite);

      try {
        await userRepository.markAsFavorite(event.movie, event.favorite);
        userBloc.updateFavorite(event.movie, event.favorite);
      } on Exception {
        yield UpdateListsState.updateFavoriteFailure(
            movie: event.movie, favorite: event.favorite);
      }
    } else if (event is UpdateWatchlist) {
      yield UpdateListsState.updateWatchlistSuccess(
          movie: event.movie, watchlist: event.watchlist);

      try {
        await userRepository.addToWatchlist(event.movie, event.watchlist);
        userBloc.updateWatchlist(event.movie, event.watchlist);
      } on Exception {
        yield UpdateListsState.updateWatchlistFailure(
            movie: event.movie, watchlist: event.watchlist);
      }
    }
  }
}
