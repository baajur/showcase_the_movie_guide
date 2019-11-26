import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/film.dart';
import '../showcase_http_client.dart';

part 'film_api_service.g.dart';

@RestApi(baseUrl: TMDB_API_BASE_URL + 'movie')
abstract class FilmApiService {
  factory FilmApiService(Dio dio) = _FilmApiService;

  @GET('/{category}')
  Future<FilmResult> getFilms(
    @Path('category') String category,
    @Query('page') int page,
  );

  @GET('/{movieId}')
  Future<FilmDetails> getFilmDetails(
    @Path('movieId') int movieId,
    { @Query('append_to_response') String appendToResponse = 'similar' }
  );
}
