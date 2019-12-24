import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:showcase_the_movie_guide/res/constants.dart';
import 'package:showcase_the_movie_guide/domain/models/tv_show.dart';

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
