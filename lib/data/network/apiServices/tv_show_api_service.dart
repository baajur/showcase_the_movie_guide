import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/tv_show.dart';
import '../showcase_http_client.dart';

part 'tv_show_api_service.g.dart';

@RestApi(baseUrl:  TMDB_API_BASE_URL + 'tv')
abstract class TvShowApiService {
  factory TvShowApiService(Dio dio) = _TvShowApiService;

  @GET('/{category}')
  Future<TvShowResult> getTvShows(
    @Path('category') String category,
    @Query('page') int page,
  );

  @GET('/{movieId}')
  Future<TvShowDetails> getTvShowsDetails(
    @Path('movieId') int movieId,
    { @Query('append_to_response') String appendToResponse = 'similar' }
  );
}
