import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:super_enum/super_enum.dart';

part 'movie_details_event.g.dart';

@superEnum
enum _UpdateListsEvent {
  @Data(
    fields: [
      DataField('movie', Movie),
      DataField('favorite', bool),
    ],
  )
  UpdateFavorite,
  @Data(
    fields: [
      DataField('movie', Movie),
      DataField('watchlist', bool),
    ],
  )
  UpdateWatchlist,
}
