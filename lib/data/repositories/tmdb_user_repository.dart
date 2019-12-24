import 'package:showcase_the_movie_guide/data/network/apiServices/account_api_service.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/auth_api_service.dart';
import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/domain/models/request_token.dart';
import 'package:showcase_the_movie_guide/domain/models/status.dart';
import 'package:showcase_the_movie_guide/domain/repositories/settings_repository.dart';
import 'package:showcase_the_movie_guide/domain/repositories/user_repository.dart';

class TmdbUserRepository implements UserRepository {
  final AuthApiService _authApiService;
  final AccountApiService _accountApiService;
  final SettingsRepository _settingsRepository;

  TmdbUserRepository(
      this._authApiService, this._accountApiService, this._settingsRepository);

  @override
  Future<RequestToken> createRequestToken() async {
    return await _authApiService.createRequestToken();
  }

  @override
  Future<AccountDetails> authenticateWithToken(String token) async {
    return await _authApiService
        .createSessionId({'request_token': token}).then((sessionId) async {
      final accountDetails =
          await _accountApiService.getAccountDetails(sessionId.sessionId);
      await _settingsRepository.storeSessionId(sessionId.sessionId);
      await _settingsRepository.storeAccountDetails(accountDetails);
      return accountDetails;
    });
  }

  @override
  Future<AccountDetails> authenticateWithLogin(
      String username, String password) async {
    return await _authApiService.createRequestToken().then((requestToken) {
      return _authApiService.validateTokenWithLogin({
        'username': username,
        'password': password,
        'request_token': requestToken.requestToken
      });
    }).then((requestToken) {
      return _authApiService
          .createSessionId({'request_token': requestToken.requestToken});
    }).then((sessionId) async {
      final accountDetails =
          await _accountApiService.getAccountDetails(sessionId.sessionId);
      await _settingsRepository.storeSessionId(sessionId.sessionId);
      await _settingsRepository.storeAccountDetails(accountDetails);
      return accountDetails;
    });
  }

  @override
  Future<bool> isAuthenticated() async {
    return await _settingsRepository.getSessionId() != null &&
        await _settingsRepository.getAccountDetails() != null;
  }

  Future<AccountDetails> getAccountDetails() async {
    return await _settingsRepository.getAccountDetails();
  }

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();

    final films =
        await _accountApiService.getFavoriteFilms(accountDetails.id, sessionId);
    final tvShows = await _accountApiService.getFavoriteTvShows(
        accountDetails.id, sessionId);

    return [...films.results, ...tvShows.results];
  }

  @override
  Future<List<Movie>> getWatchlistMovies() async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();

    final films = await _accountApiService.getWatchlistFilms(
        accountDetails.id, sessionId);
    final tvShows = await _accountApiService.getWatchlistTvShows(
        accountDetails.id, sessionId);
    return [...films.results, ...tvShows.results];
  }

  @override
  Future<Status> markAsFavorite(Movie movie, bool favorite) async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();
    return await _accountApiService.markAsFavorite(
      accountDetails.id,
      sessionId,
      {
        'media_type': movie.stringType,
        'media_id': '${movie.id}',
        'favorite': '$favorite'
      },
    );
  }

  @override
  Future<Status> addToWatchlist(Movie movie, bool watchlist) async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();
    return await _accountApiService.addToWatchList(
      accountDetails.id,
      sessionId,
      {
        'media_type': movie.stringType,
        'media_id': '${movie.id}',
        'watchlist': '$watchlist'
      },
    );
  }
}
