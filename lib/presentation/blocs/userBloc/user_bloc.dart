import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/repositories/settings_repository.dart';
import 'package:showcase_the_movie_guide/domain/repositories/user_repository.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final SettingsRepository _settingsRepository;

  UserBloc(this._userRepository, this._settingsRepository);

  @override
  UserState get initialState => Unauthenticated();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is CheckIfAuthenticated) {
      yield* _mapLoadAccountDetailsToState(event);
    } else if (event is NotifyUserAuthenticated) {
      yield Authenticated(event.accountDetails);
    }
  }

  Stream<UserState> _mapLoadAccountDetailsToState(
      CheckIfAuthenticated event) async* {
    try {
      if (await _userRepository.isAuthenticated()) {
        final accountDetails = await _userRepository.getAccountDetails();
        yield Authenticated(accountDetails);
      } else {
        yield Unauthenticated();
      }
    } catch (e) {
      yield Unauthenticated();
    }
  }

  void checkIfAuthenticated() {
    add(CheckIfAuthenticated());
  }

  void notifyUserAuthenticated(AccountDetails accountDetails) {
    add(NotifyUserAuthenticated(accountDetails));
  }
}
