import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/models/film.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/domain/models/status.dart';
import 'package:showcase_the_movie_guide/domain/models/tv_show.dart';

import '../models/request_token.dart';

abstract class UserRepository {

  Future<RequestToken> createRequestToken();

  Future<AccountDetails> authenticateWithToken(String token);

  Future<AccountDetails> authenticateWithLogin(String usename, String password);

  Future<bool> isAuthenticated();

  Future<AccountDetails> getAccountDetails();

  Future<List<Film>> getFavoriteFilms();

  Future<List<TvShow>> getFavoriteTvShows();

  Future<List<Film>> getWatchlistFilms();

  Future<List<TvShow>> getWatchlistTvShows();

  Future<Status> markAsFavorite(Movie movie, bool favorite);

  Future<Status> addToWatchlist(Movie movie, bool watchlist);
}