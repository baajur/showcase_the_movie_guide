import 'package:super_enum/super_enum.dart';

part 'authentication_event.g.dart';

@superEnum
enum _AuthenticationEvent {
  @object
  AuthenticateViaBrowser,
  @Data(
    fields: [
      DataField('username', String),
      DataField('password', String),
    ],
  )
  AuthenticateWithLogin,
  @Data(
    fields: [
      DataField('token', String),
    ],
  )
  AuthenticateWithToken
}
