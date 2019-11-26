import 'package:equatable/equatable.dart';

import '../../../../domain/models/account.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthenticationState {}

class Loading extends AuthenticationState {}

class RequestToken extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final AccountDetails accountDetails;

  Authenticated(this.accountDetails);

  @override
  List<Object> get props => [accountDetails];
}

class Error extends AuthenticationState {
  final Exception exception;

  Error(this.exception);

  @override
  List<Object> get props => [exception];
}
