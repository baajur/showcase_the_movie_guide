import 'package:equatable/equatable.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:super_enum/super_enum.dart';

part 'movie_details_state.g.dart';

@superEnum
enum _MovieDetailsState {
  @object
  MovieDetailsLoading,
  @Data(
    fields: [
      DataField('movieDetails', MovieDetails),
    ],
  )
  MovieDetailsSuccess,
  @object
  MovieDetailsFailure,
}

@superEnum
enum _UpdateListsState {
  @Data(
    fields: [
      DataField('movie', Movie),
      DataField('favorite', bool),
    ],
  )
  UpdateFavoriteSuccess,
  @Data(
    fields: [
      DataField('movie', Movie),
      DataField('favorite', bool),
    ],
  )
  UpdateFavoriteFailure,
  @Data(
    fields: [
      DataField('movie', Movie),
      DataField('watchlist', bool),
    ],
  )
  UpdateWatchlistSuccess,
  @Data(
    fields: [
      DataField('movie', Movie),
      DataField('watchlist', bool),
    ],
  )
  UpdateWatchlistFailure,
}
