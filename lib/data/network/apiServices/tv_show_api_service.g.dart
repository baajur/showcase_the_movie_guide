// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TvShowApiService implements TvShowApiService {
  _TvShowApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.themoviedb.org/3/tv';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getTvShows(category, page) async {
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
    final value = TvShowResult.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getTvShowsDetails(movieId, {appendToResponse = 'similar'}) async {
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
    final value = TvShowDetails.fromJson(_result.data);
    return Future.value(value);
  }
}
