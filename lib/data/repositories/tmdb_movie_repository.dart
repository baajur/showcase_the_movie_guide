import 'package:showcase_the_movie_guide/core/exceptions.dart';
import 'package:showcase_the_movie_guide/core/network_info.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/film_api_service.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/tv_show_api_service.dart';
import 'package:showcase_the_movie_guide/domain/models/film.dart';
import 'package:showcase_the_movie_guide/domain/models/tv_show.dart';
import 'package:showcase_the_movie_guide/domain/repositories/movie_repository.dart';
import 'package:showcase_the_movie_guide/domain/repositories/paged_repository.dart';

const int _PAGE_SIZE = 20;

class TmdbMovieRepository extends PagedRepository implements MovieRepository {
  final FilmApiService _filmApiService;
  final TvShowApiService _tvShowApiService;

  final NetworkInfo _networkInfo;

  TmdbMovieRepository(
      this._filmApiService, this._tvShowApiService, this._networkInfo);

  @override
  Future<DataSource<Film>> getFilmDataSource(String category) async {
    if (!await _networkInfo.isNetworkAvailable())
      throw NetworkNotAvailableException();

    return createPaged((index) async {
      final result = await _filmApiService.getFilms(category, index);
      return result.results.toList();
    }, _PAGE_SIZE);
  }

  @override
  Future<FilmDetails> getFilmDetails(int id) async {
    return await _filmApiService.getFilmDetails(id);
  }

  @override
  Future<DataSource<TvShow>> getTvShowDataSource(String category) async {
    if (!await _networkInfo.isNetworkAvailable())
      throw NetworkNotAvailableException();

    return createPaged((index) async {
      final result = await _tvShowApiService.getTvShows(category, index);
      return result.results.toList();
    }, _PAGE_SIZE);
  }

  @override
  Future<TvShowDetails> getTvShowDetails(int id) async {
    return await _tvShowApiService.getTvShowsDetails(id);
  }
}
