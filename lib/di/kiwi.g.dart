// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kiwi.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Kiwi extends Kiwi {
  void initCore() {
    final Container container = Container();
    container
        .registerSingleton<NetworkInfo, NetworkUtils>((c) => NetworkUtils());
  }

  void initData() {
    final Container container = Container();
    container.registerSingleton<MovieRepository, TmdbMovieRepository>((c) =>
        TmdbMovieRepository(
            c<FilmApiService>(), c<TvShowApiService>(), c<NetworkInfo>()));
    container.registerSingleton<UserRepository, TmdbUserRepository>((c) =>
        TmdbUserRepository(c<AuthApiService>(), c<AccountApiService>(),
            c<SettingsRepository>()));
    container.registerSingleton<SettingsRepository, LocalSettingsRepository>(
        (c) => LocalSettingsRepository());
  }
}
