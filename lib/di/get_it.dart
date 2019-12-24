import 'package:get_it/get_it.dart';
import 'package:showcase_the_movie_guide/core/network_info.dart';
import 'package:showcase_the_movie_guide/core/network_utils.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/account_api_service.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/auth_api_service.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/film_api_service.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/tv_show_api_service.dart';
import 'package:showcase_the_movie_guide/data/network/showcase_http_client.dart';
import 'package:showcase_the_movie_guide/data/repositories/local_settings_repository.dart';
import 'package:showcase_the_movie_guide/data/repositories/tmdb_movie_repository.dart';
import 'package:showcase_the_movie_guide/data/repositories/tmdb_user_repository.dart';
import 'package:showcase_the_movie_guide/domain/repositories/movie_repository.dart';
import 'package:showcase_the_movie_guide/domain/repositories/settings_repository.dart';
import 'package:showcase_the_movie_guide/domain/repositories/user_repository.dart';

T getIt<T>([name]) => GetIt.instance.get<T>(name);

void initGetIt() {
  // Network
  GetIt.instance
    ..registerSingleton(ShowcaseHttpClient.create())
    ..registerFactory(() => FilmApiService(getIt()))
    ..registerFactory(() => TvShowApiService(getIt()))
    ..registerFactory(() => AuthApiService(getIt()))
    ..registerFactory(() => AccountApiService(getIt()));

  // Utils
  GetIt.instance..registerFactory<NetworkInfo>(() => NetworkUtils());

  // Repositories
  GetIt.instance
    ..registerFactory<SettingsRepository>(() => LocalSettingsRepository())
    ..registerFactory<MovieRepository>(
        () => TmdbMovieRepository(getIt(), getIt(), getIt()))
    ..registerFactory<UserRepository>(
        () => TmdbUserRepository(getIt(), getIt(), getIt()));
}
