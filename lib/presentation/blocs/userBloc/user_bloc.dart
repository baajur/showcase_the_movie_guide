import 'package:rxdart/rxdart.dart';
import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/domain/repositories/user_repository.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_event.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_state.dart';

class UserBloc {
  final Function() checkIfAuthenticated;
  final Function(Movie, bool) updateFavorite;
  final Function(Movie, bool) updateWatchlist;
  final Function(AccountDetails) userAuthenticated;

  final Stream<UserAuthenticationState> userAuthentication;
  final ValueStream<List<Movie>> favoriteMovies;
  final ValueStream<List<Movie>> watchlistMovies;

  final Function() dispose;

  UserBloc._(this.checkIfAuthenticated,
      this.updateFavorite,
      this.updateWatchlist,
      this.userAuthenticated,
      this.userAuthentication,
      this.favoriteMovies,
      this.watchlistMovies,
      this.dispose,);

  factory UserBloc(UserRepository userRepository) {
    final userAuthentication = BehaviorSubject<UserAuthenticationState>();

    final userListController = PublishSubject<UserListsEvent>();

    final favoriteMoviesController = BehaviorSubject<List<Movie>>();
    final watchlistMoviesController = BehaviorSubject<List<Movie>>();

    Rx.merge([
      userAuthentication
          .whereType<UserAuthenticated>()
          .switchMap((event) => _loadFavorite(userRepository)),
      userListController.whereType<UpdateFavorites>().map((event) {
        final favorites = favoriteMoviesController.value;
        if (event.favorite) {
          favorites.add(event.movie);
        } else {
          favorites.removeWhere((movie) =>
          event.movie.id == movie.id && event.movie.title == movie.title);
        }

        return List.of(favorites);
      })
    ]).pipe(favoriteMoviesController);

    Rx.merge([
      userAuthentication
          .whereType<UserAuthenticated>()
          .switchMap((event) => _loadWatchlist(userRepository)),
      userListController.whereType<UpdateWatchlist>().map((event) {
        final watchlist = watchlistMoviesController.value;
        if (event.watchlist) {
          watchlist.add(event.movie);
        } else {
          watchlist.removeWhere((movie) =>
          event.movie.id == movie.id && event.movie.title == movie.title);
        }

        return List.of(watchlist);
      })
    ]).pipe(watchlistMoviesController);

    final checkIfAuthenticated = () {
      _checkIfAuthenticated(userRepository).pipe(userAuthentication);
    };

    final updateFavorite = (Movie movie, bool favorite) {
      userListController.add(
          UserListsEvent.updateFavorites(movie: movie, favorite: favorite));
    };

    final updateWatchlist = (Movie movie, bool watchlist) {
      userListController.add(
          UserListsEvent.updateWatchlist(movie: movie, watchlist: watchlist));
    };

    final userAuthenticated = (AccountDetails accountDetails) {
      userAuthentication.add(UserAuthenticationState.userAuthenticated(
          accountDetails: accountDetails));
    };

    final dispose = () {
      userAuthentication.close();
      userListController.close();
    };

    return UserBloc._(
      checkIfAuthenticated,
      updateFavorite,
      updateWatchlist,
      userAuthenticated,
      userAuthentication,
      favoriteMoviesController,
      watchlistMoviesController,
      dispose,
    );
  }

  static Stream<UserAuthenticationState> _checkIfAuthenticated(
      UserRepository userRepository) async* {
    if (await userRepository.isAuthenticated()) {
      final accountDetails = await userRepository.getAccountDetails();
      yield UserAuthenticationState.userAuthenticated(
          accountDetails: accountDetails);
    } else {
      yield UserAuthenticationState.userNotAuthenticated();
    }
  }

  static Stream<List<Movie>> _loadFavorite(
      UserRepository userRepository) async* {
    try {
      yield await userRepository.getFavoriteMovies();
    } on Exception {}
  }

  static Stream<List<Movie>> _loadWatchlist(
      UserRepository userRepository) async* {
    try {
      yield await userRepository.getWatchlistMovies();
    } on Exception {}
  }
}
