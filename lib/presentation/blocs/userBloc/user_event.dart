import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:super_enum/super_enum.dart';

part 'user_event.g.dart';

@superEnum
enum _UserListsEvent {
  @Data(
    fields: [
      DataField('movie', Movie),
      DataField('favorite', bool),
    ],
  )
  UpdateFavorites,
  @Data(
    fields: [
      DataField('movie', Movie),
      DataField('watchlist', bool),
    ],
  )
  UpdateWatchlist
}
