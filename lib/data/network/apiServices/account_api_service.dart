import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:showcase_the_movie_guide/res/constants.dart';
import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/models/film.dart';
import 'package:showcase_the_movie_guide/domain/models/status.dart';
import 'package:showcase_the_movie_guide/domain/models/tv_show.dart';

part 'account_api_service.g.dart';

@RestApi(baseUrl: TMDB_API_BASE_URL + 'account')
abstract class AccountApiService {
  factory AccountApiService(Dio dio) = _AccountApiService;

  @GET('')
  Future<AccountDetails> getAccountDetails(
    @Query('session_id') String sessionId,
  );

  @GET('/{account_id}/favorite/movies')
  Future<FilmResult> getFavoriteFilms(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
  );

  @GET('/{account_id}/favorite/tv')
  Future<TvShowResult> getFavoriteTvShows(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
  );

  @GET('/{account_id}/watchlist/movies')
  Future<FilmResult> getWatchlistFilms(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
  );

  @GET('/{account_id}/watchlist/tv')
  Future<TvShowResult> getWatchlistTvShows(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
  );

  @POST('/{account_id}/favorite')
  Future<Status> markAsFavorite(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
    @Body() Map<String, String> body,
  );

  @POST('/{account_id}/watchlist')
  Future<Status> addToWatchList(
    @Path('account_id') int accountId,
    @Query('session_id') String sessionId,
    @Body() Map<String, String> body,
  );
}
