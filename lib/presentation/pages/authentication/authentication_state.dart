import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:super_enum/super_enum.dart';

part 'authentication_state.g.dart';

@superEnum
enum _AuthenticationState {
  @object
  NotAuthenticated,
  @object
  AuthenticationProcessing,
  @Data(
    fields: [
      DataField('accountDetails', AccountDetails),
    ],
  )
  Authenticated,
  @object
  AuthenticationError
}
