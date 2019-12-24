import 'package:dio/dio.dart';
import 'package:showcase_the_movie_guide/res/constants.dart';

class ShowcaseHttpClient {
  static Dio create() {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        // Do something before request is sent
        options.queryParameters
            .addEntries([MapEntry(TMDB_API_QUERY, TMDB_API_KEY)]);
        return options; //continue
        // If you want to resolve the request with some custom data，
        // you can return a `Response` object or return `dio.resolve(data)`.
        // If you want to reject the request with a error message,
        // you can return a `DioError` object or return `dio.reject(errMsg)`
      },
      onResponse: (Response response) async {
        // Do something with response data
        return response; // continue
      },
      onError: (DioError e) async {
        // Do something with response error
        return e; //continue
      },
    ));
    dio.interceptors.add(LogInterceptor(
      requestHeader: false,
      responseHeader: false,
      requestBody: true,
      responseBody: true,
    ));

    return dio;
  }
}
