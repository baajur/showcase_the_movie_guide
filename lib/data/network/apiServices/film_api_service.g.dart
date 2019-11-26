// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FilmApiService implements FilmApiService {
  _FilmApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.themoviedb.org/3/movie';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getFilms(category, page) async {
    ArgumentError.checkNotNull(category, 'category');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'page': page};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$category',
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
  getFilmDetails(movieId, {appendToResponse = 'similar'}) async {
    ArgumentError.checkNotNull(movieId, 'movieId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'append_to_response': appendToResponse
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$movieId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FilmDetails.fromJson(_result.data);
    return Future.value(value);
  }
}
