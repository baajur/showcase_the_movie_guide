import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:super_enum/super_enum.dart';

part 'user_state.g.dart';

@superEnum
enum _UserAuthenticationState {
  @Data(
    fields: [
      DataField('accountDetails', AccountDetails),
    ],
  )
  UserAuthenticated,
  @object
  UserNotAuthenticated
}

