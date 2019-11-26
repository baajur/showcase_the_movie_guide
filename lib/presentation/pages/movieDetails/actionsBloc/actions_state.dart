import 'package:equatable/equatable.dart';

class ActionsState extends Equatable {
  final bool isFavorite;
  final bool isWatchlist;

  const ActionsState(this.isFavorite, this.isWatchlist);

  @override
  List<Object> get props => [isFavorite, isWatchlist];
}
