import 'package:equatable/equatable.dart';
import 'package:super_enum/super_enum.dart';

part 'movies_state.g.dart';

@superEnum
enum _MoviesState {
  @object
  MoviesLoading,
  @Data(
    fields: [
      DataField('categories', List),
    ],
  )
  MoviesSuccess,
  @object
  MoviesFailure,
}
