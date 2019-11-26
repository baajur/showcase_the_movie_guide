import 'package:kiwi/kiwi.dart';

import '../core/network_info.dart';
import '../core/network_utils.dart';
import '../data/network/apiServices/account_api_service.dart';
import '../data/network/apiServices/auth_api_service.dart';
import '../data/network/apiServices/film_api_service.dart';
import '../data/network/apiServices/tv_show_api_service.dart';
import '../data/network/showcase_http_client.dart';
import '../data/repositories/local_settings_repository.dart';
import '../data/repositories/tmdb_movie_repository.dart';
import '../data/repositories/tmdb_user_repository.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/repositories/settings_repository.dart';
import '../domain/repositories/user_repository.dart';

part 'kiwi.g.dart';

void initKiwi() {
  Container()
    ..registerSingleton((c) => ShowcaseHttpClient.create())
    ..registerFactory((c) => FilmApiService(c()))
    ..registerFactory((c) => TvShowApiService(c()))
    ..registerFactory((c) => AuthApiService(c()))
    ..registerFactory((c) => AccountApiService(c()));
  _$Kiwi()
    ..initCore()
    ..initData();
}

T resolve<T>([name]) => Container().resolve(name);

abstract class Kiwi {
  @Register.singleton(NetworkInfo, from: NetworkUtils)
  void initCore();

  @Register.singleton(MovieRepository, from: TmdbMovieRepository)
  @Register.singleton(UserRepository, from: TmdbUserRepository)
  @Register.singleton(SettingsRepository, from: LocalSettingsRepository)
  void initData();
}
