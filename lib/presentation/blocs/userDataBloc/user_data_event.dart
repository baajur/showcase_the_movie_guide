import 'package:equatable/equatable.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object> get props => [];
}

class LoadUserData extends UserDataEvent {}

class UpdateFavorites extends UserDataEvent {
  final Movie movie;
  final bool favorite;

  UpdateFavorites(this.movie, this.favorite);

  @override
  List<Object> get props => [movie, favorite];
}

class UpdateWatchlist extends UserDataEvent {
  final Movie movie;
  final bool watchlist;

  UpdateWatchlist(this.movie, this.watchlist);

  @override
  List<Object> get props => [movie, watchlist];
}