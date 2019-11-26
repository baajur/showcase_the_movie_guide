import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateWithLogin extends AuthenticationEvent {
  final String username;
  final String password;

  AuthenticateWithLogin(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class AuthenticateWithToken extends AuthenticationEvent {
  final String token;

  AuthenticateWithToken(this.token);

  @override
  List<Object> get props => [token];
}

class ResetPassword extends AuthenticationEvent {}

class AuthenticateViaBrowser extends AuthenticationEvent {}
