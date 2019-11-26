import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:showcase_the_movie_guide/domain/models/film.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/domain/models/tv_show.dart';
import 'package:showcase_the_movie_guide/domain/repositories/user_repository.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/bloc.dart';
import './bloc.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserRepository _userRepository;
  final UserBloc _userBloc;

  StreamSubscription _streamSubscription;

  UserDataBloc(this._userRepository, this._userBloc) {
    _streamSubscription = _userBloc.listen((state) {
      if (state is Authenticated) {
        loadUserData();
      }
    });
  }

  @override
  void close() {
    _streamSubscription.cancel();
    super.close();
  }

  @override
  UserDataState get initialState => NotLoaded();

  @override
  Stream<UserDataState> mapEventToState(
    UserDataEvent event,
  ) async* {
    if (event is LoadUserData) {
      yield* _mapLoadUserDataToState();
    } else if (event is UpdateFavorites) {
      yield* _mapUpdateFavoriteToState(event);
    } else if (event is UpdateWatchlist) {
      yield* _mapUpdateWatchlistToState(event);
    }
  }

  Stream<UserDataState> _mapLoadUserDataToState() async* {
    try {
      final favoriteFilms = await _userRepository.getFavoriteFilms();
      final favoriteTvShows = await _userRepository.getFavoriteTvShows();
      final watchlistFilms = await _userRepository.getWatchlistFilms();
      final watchlistTvShows = await _userRepository.getWatchlistTvShows();

      yield UserData(
        favoriteFilms,
        favoriteTvShows,
        watchlistFilms,
        watchlistTvShows,
      );
    } catch (e) {
      yield NotLoaded();
    }
  }

  Stream<UserData> _mapUpdateFavoriteToState(UpdateFavorites event) async* {
    final currentState = state;
    if (currentState is UserData) {
      final movie = event.movie;
      final favorite = event.favorite;

      if (movie is Film) {
        final favoriteFilms = currentState.favoriteFilms;
        favorite ? favoriteFilms.add(movie) : favoriteFilms.remove(movie);
        yield currentState.copyWith(favoriteFilms: favoriteFilms);
      } else if (movie is TvShow) {
        final favoriteTvShows = currentState.favoriteTvShows;
        favorite ? favoriteTvShows.add(movie) : favoriteTvShows.remove(movie);
        yield currentState.copyWith(favoriteTvShows: favoriteTvShows);
      }
    }
  }

  Stream<UserData> _mapUpdateWatchlistToState(UpdateWatchlist event) async* {
    final currentState = state;
    if (currentState is UserData) {
      final movie = event.movie;
      final favorite = event.watchlist;

      if (movie is Film) {
        final watchlistFilms = currentState.watchlistFilms;
        favorite ? watchlistFilms.add(movie) : watchlistFilms.remove(movie);
        yield currentState.copyWith(watchlistFilms: watchlistFilms);
      } else if (movie is TvShow) {
        final watchlistTvShows = currentState.watchlistTvShows;
        favorite ? watchlistTvShows.add(movie) : watchlistTvShows.remove(movie);
        yield currentState.copyWith(watchlistTvShows: watchlistTvShows);
      }
    }
  }

  void loadUserData() {
    add(LoadUserData());
  }

  void updateFavorites(Movie movie, bool favorite) {
    add(UpdateFavorites(movie, favorite));
  }

  void updateWatchlist(Movie movie, bool watchlist) {
    add(UpdateWatchlist(movie, watchlist));
  }
}
