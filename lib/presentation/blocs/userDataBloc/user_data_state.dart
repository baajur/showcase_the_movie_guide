import '../../../domain/models/film.dart';
import '../../../domain/models/tv_show.dart';

abstract class UserDataState {}

class NotLoaded extends UserDataState {}

class UserData extends UserDataState {
  final List<Film> favoriteFilms;
  final List<TvShow> favoriteTvShows;
  final List<Film> watchlistFilms;
  final List<TvShow> watchlistTvShows;

  UserData(
    this.favoriteFilms,
    this.favoriteTvShows,
    this.watchlistFilms,
    this.watchlistTvShows,
  );

  UserData copyWith({
    List<Film> favoriteFilms,
    List<TvShow> favoriteTvShows,
    List<Film> watchlistFilms,
    List<TvShow> watchlistTvShows,
  }) {
    return UserData(
      favoriteFilms ?? this.favoriteFilms,
      favoriteTvShows ?? this.favoriteTvShows,
      watchlistFilms ?? this.watchlistFilms,
      watchlistTvShows ?? this.watchlistTvShows,
    );
  }
}
