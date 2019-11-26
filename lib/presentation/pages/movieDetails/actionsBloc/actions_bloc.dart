import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../../../../domain/models/film.dart';
import '../../../../domain/models/movie.dart';
import '../../../../domain/models/tv_show.dart';
import '../../../../domain/repositories/user_repository.dart';
import '../../../blocs/userDataBloc/user_data_bloc.dart';
import '../../../blocs/userDataBloc/user_data_state.dart';

class ActionsBloc extends Bloc<ActionsEvent, ActionsState> {
  final Movie _movie;
  final UserRepository _userRepository;
  final UserDataBloc _userDataBloc;

  StreamSubscription streamSubscription;

  ActionsBloc(this._movie, this._userRepository, this._userDataBloc) {
    streamSubscription = _userDataBloc.listen((state) {
      if (state is UserData) {
        if (_movie is Film) {
          final isFavorite =
              state.favoriteFilms.map((i) => i.id).contains(_movie.id);
          final isWatchlist =
              state.watchlistFilms.map((i) => i.id).contains(_movie.id);
          updateStatus(isFavorite, isWatchlist);
        } else if (_movie is TvShow) {
          final isFavorite =
              state.favoriteTvShows.map((i) => i.id).contains(_movie.id);
          final isWatchlist =
              state.watchlistTvShows.map((i) => i.id).contains(_movie.id);
          updateStatus(isFavorite, isWatchlist);
        }
      }
    });
  }

  @override
  void close() {
    streamSubscription.cancel();
    super.close();
  }

  @override
  ActionsState get initialState => ActionsState(false, false);

  @override
  Stream<ActionsState> mapEventToState(
    ActionsEvent event,
  ) async* {
    if (event is Favorite) {
      yield ActionsState(event.favorite, state.isWatchlist);
      await _userRepository.markAsFavorite(_movie, event.favorite);
      _userDataBloc.updateFavorites(_movie, event.favorite);
    } else if (event is AddToWatchlist) {
      yield ActionsState(state.isFavorite, event.watchlist);
      await _userRepository.addToWatchlist(_movie, event.watchlist);
      _userDataBloc.updateWatchlist(_movie, event.watchlist);
    } else if (event is UpdateStatus) {
      yield ActionsState(event.favorite, event.watchlist);
    }
  }

  void favorite(bool favorite) {
    add(Favorite(favorite));
  }

  void addToWatchlist(bool addToWatchlist) {
    add(AddToWatchlist(addToWatchlist));
  }

  void updateStatus(bool favorite, bool watchlist) {
    add(UpdateStatus(favorite, watchlist));
  }
}
