// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AccountApiService implements AccountApiService {
  _AccountApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.themoviedb.org/3/account';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getAccountDetails(sessionId) async {
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'session_id': sessionId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AccountDetails.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getFavoriteFilms(accountId, sessionId) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'session_id': sessionId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$accountId/favorite/movies',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FilmResult.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getFavoriteTvShows(accountId, sessionId) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'session_id': sessionId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$accountId/favorite/tv',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TvShowResult.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getWatchlistFilms(accountId, sessionId) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'session_id': sessionId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$accountId/watchlist/movies',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FilmResult.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getWatchlistTvShows(accountId, sessionId) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'session_id': sessionId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$accountId/watchlist/tv',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TvShowResult.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  markAsFavorite(accountId, sessionId, body) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'session_id': sessionId};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$accountId/favorite',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Status.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  addToWatchList(accountId, sessionId, body) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'session_id': sessionId};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$accountId/watchlist',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Status.fromJson(_result.data);
    return Future.value(value);
  }
}
