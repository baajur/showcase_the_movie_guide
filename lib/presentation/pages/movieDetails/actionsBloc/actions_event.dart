import 'package:equatable/equatable.dart';

abstract class ActionsEvent extends Equatable {
  const ActionsEvent();

  @override
  List<Object> get props => [];
}

class Favorite extends ActionsEvent {
  final bool favorite;

  Favorite(this.favorite);

  @override
  List<Object> get props => [favorite];
}

class AddToWatchlist extends ActionsEvent {
  final bool watchlist;

  AddToWatchlist(this.watchlist);

  @override
  List<Object> get props => [watchlist];
}

class UpdateStatus extends ActionsEvent {
  final bool favorite;
  final bool watchlist;

  UpdateStatus(this.favorite, this.watchlist);

  @override
  List<Object> get props => [favorite, watchlist];
}
