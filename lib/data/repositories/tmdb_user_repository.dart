import '../../domain/models/account.dart';
import '../../domain/models/film.dart';
import '../../domain/models/movie.dart';
import '../../domain/models/request_token.dart';
import '../../domain/models/status.dart';
import '../../domain/models/tv_show.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../network/apiServices/account_api_service.dart';
import '../network/apiServices/auth_api_service.dart';

class TmdbUserRepository implements UserRepository {
  final AuthApiService _authApiService;
  final AccountApiService _accountApiSevice;
  final SettingsRepository _settingsRepository;

  TmdbUserRepository(
      this._authApiService, this._accountApiSevice, this._settingsRepository);

  @override
  Future<RequestToken> createRequestToken() async {
    return await _authApiService.createRequestToken();
  }

  @override
  Future<AccountDetails> authenticateWithToken(String token) async {
    return await _authApiService
        .createSessionId({'request_token': token}).then((sessionId) async {
      final accountDetails =
          await _accountApiSevice.getAccountDetails(sessionId.sessionId);
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
          await _accountApiSevice.getAccountDetails(sessionId.sessionId);
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
  Future<List<Film>> getFavoriteFilms() async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();

    final result =
        await _accountApiSevice.getFavoriteFilms(accountDetails.id, sessionId);
    return result.results.toList();
  }

  @override
  Future<List<TvShow>> getFavoriteTvShows() async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();

    final result = await _accountApiSevice.getFavoriteTvShows(
        accountDetails.id, sessionId);
    return result.results.toList();
  }

  @override
  Future<List<Film>> getWatchlistFilms() async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();

    final result =
        await _accountApiSevice.getWatchlistFilms(accountDetails.id, sessionId);
    return result.results.toList();
  }

  @override
  Future<List<TvShow>> getWatchlistTvShows() async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();

    final result = await _accountApiSevice.getWatchlistTvShows(
        accountDetails.id, sessionId);
    return result.results.toList();
  }

  @override
  Future<Status> markAsFavorite(Movie movie, bool favorite) async {
    final sessionId = await _settingsRepository.getSessionId();
    final accountDetails = await _settingsRepository.getAccountDetails();
    return await _accountApiSevice.markAsFavorite(
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
    return await _accountApiSevice.addToWatchList(
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
