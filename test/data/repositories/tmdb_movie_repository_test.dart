import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:showcase_the_movie_guide/core/exceptions.dart';
import 'package:showcase_the_movie_guide/core/network_info.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/film_api_service.dart';
import 'package:showcase_the_movie_guide/data/network/apiServices/tv_show_api_service.dart';
import 'package:showcase_the_movie_guide/data/repositories/tmdb_movie_repository.dart';

class MockFilmsApiService extends Mock implements FilmApiService {}

class MockTvShowsApiServcie extends Mock implements TvShowApiService {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockFilmsApiService mockFilmsApiService;
  MockTvShowsApiServcie mockTvShowsApiServcie;
  MockNetworkInfo mockNetworkInfo;

  TmdbMovieRepository movieApiRepository;

  setUp(() {
    mockFilmsApiService = MockFilmsApiService();
    mockTvShowsApiServcie = MockTvShowsApiServcie();
    mockNetworkInfo = MockNetworkInfo();

    movieApiRepository = TmdbMovieRepository(
      mockFilmsApiService,
      mockTvShowsApiServcie,
      mockNetworkInfo,
    );
  });

  final filmCategory = 'popular';

  group('getFilmDataSource', () {
    test(
      'should check if device online',
      () async {
        // arrange
        when(mockNetworkInfo.isNetworkAvailable())
            .thenAnswer((_) async => true);
        // act
        movieApiRepository.getFilmDataSource(filmCategory);
        // assert
        verify(mockNetworkInfo.isNetworkAvailable());
      },
    );

    test(
      'should throw an exception when network is not available',
      () async {
        // arrange
        when(mockNetworkInfo.isNetworkAvailable())
            .thenAnswer((_) async => false);
        // act
        final call = movieApiRepository.getFilmDataSource;
        // assert
        expect(() => call(filmCategory),
            throwsA(isA<NetworkNotAvailableException>()));
        verify(mockNetworkInfo.isNetworkAvailable());
        verifyZeroInteractions(mockFilmsApiService);
      },
    );
  });
}
