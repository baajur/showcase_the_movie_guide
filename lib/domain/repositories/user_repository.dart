import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/domain/models/request_token.dart';
import 'package:showcase_the_movie_guide/domain/models/status.dart';

abstract class UserRepository {
  Future<RequestToken> createRequestToken();

  Future<AccountDetails> authenticateWithToken(String token);

  Future<AccountDetails> authenticateWithLogin(String usename, String password);

  Future<bool> isAuthenticated();

  Future<AccountDetails> getAccountDetails();

  Future<List<Movie>> getFavoriteMovies();

  Future<List<Movie>> getWatchlistMovies();

  Future<Status> markAsFavorite(Movie movie, bool favorite);

  Future<Status> addToWatchlist(Movie movie, bool watchlist);
}
