import 'package:equatable/equatable.dart';
import 'package:showcase_the_movie_guide/domain/models/account.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CheckIfAuthenticated extends UserEvent {}

class NotifyUserAuthenticated extends UserEvent {
  final AccountDetails accountDetails;

  NotifyUserAuthenticated(this.accountDetails);

  @override
  List<Object> get props => [accountDetails];
}
