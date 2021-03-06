import 'package:showcase_the_movie_guide/domain/models/film.dart';
import 'package:showcase_the_movie_guide/domain/models/tv_show.dart';
import 'package:showcase_the_movie_guide/domain/repositories/paged_repository.dart';

abstract class MovieRepository {
  Future<DataSource<Film>> getFilmDataSource(String category);

  Future<FilmDetails> getFilmDetails(int id);

  Future<DataSource<TvShow>> getTvShowDataSource(String category);

  Future<TvShowDetails> getTvShowDetails(int id);
}
