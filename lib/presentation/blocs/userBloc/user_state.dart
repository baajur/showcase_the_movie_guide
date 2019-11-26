import 'package:equatable/equatable.dart';
import 'package:showcase_the_movie_guide/domain/models/account.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class Unauthenticated extends UserState {}

class Authenticated extends UserState {
  final AccountDetails accountDetails;

  Authenticated(this.accountDetails);

  @override
  List<Object> get props => [accountDetails];
}