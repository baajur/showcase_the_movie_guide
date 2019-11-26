import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:sprintf/sprintf.dart';
import 'package:url_launcher/url_launcher.dart';

import './bloc.dart';
import '../../../../domain/repositories/settings_repository.dart';
import '../../../../domain/repositories/user_repository.dart';
import '../../../blocs/userBloc/user_bloc.dart';

const _AUTH_URL = 'https://www.themoviedb.org/authenticate/%s' +
    '?redirect_to=showcase://app.vs.showcasethemovieguide';
const _RESET_PASSWORD_URL = 'https://www.themoviedb.org/account/reset-password';

const _PLATFORM_CHANNEL = MethodChannel('app.vs.showcasethemovieguide/auth');

const _QUERY_REQUEST_TOKEN = 'request_token';
const _QUERY_APPROVED = 'approved';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  final SettingsRepository _settingsRepository;

  final UserBloc _userBloc;
  StreamSubscription _streamSubscription;

  AuthenticationBloc(
    this._userRepository,
    this._settingsRepository,
    this._userBloc,
  ) {
    SystemChannels.lifecycle.setMessageHandler((message) {
      if (message.contains('resume')) {
        _getSharedData().then((data) {
          if (data.isEmpty) return;

          final String requestToken = data[_QUERY_REQUEST_TOKEN];
          final String approved = data[_QUERY_APPROVED];

          if (requestToken != null && approved != null && approved == 'true') {
            add(AuthenticateWithToken(requestToken));
          }
        });
      }

      return null;
    });
  }

  Future<Map> _getSharedData() async =>
      await _PLATFORM_CHANNEL.invokeMethod('getSharedData');

  @override
  AuthenticationState get initialState => Unauthenticated();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticateWithLogin) {
      yield* _mapAuthenticateWithLoginToState(event);
    } else if (event is AuthenticateWithToken) {
      yield* _mapAuthenticateWithTokenToState(event);
    } else if (event is AuthenticateViaBrowser) {
      yield* _mapAuthenticateViaBrowserToState();
    } else if (event is ResetPassword) {
      yield* _mapResetPasswordToState();
    }
  }

  @override
  void close() {
    _streamSubscription?.cancel();
    super.close();
  }

  Stream<AuthenticationState> _mapAuthenticateWithLoginToState(
      AuthenticateWithLogin event) async* {
    yield Loading();

    try {
      final result = await _userRepository.authenticateWithLogin(
          event.username, event.password);

      _userBloc.notifyUserAuthenticated(result);
      yield Authenticated(result);
    } catch (e) {
      yield Error(e);
    }
  }

  Stream<AuthenticationState> _mapAuthenticateWithTokenToState(
      AuthenticateWithToken event) async* {
    yield Loading();

    try {
      final result = await _userRepository.authenticateWithToken(event.token);

      _userBloc.notifyUserAuthenticated(result);
      yield Authenticated(result);
    } catch (e) {
      yield Error(e);
    }
  }

  Stream<AuthenticationState> _mapAuthenticateViaBrowserToState() async* {
    yield Loading();

    try {
      final result = await _userRepository.createRequestToken();
      final authUrl = sprintf(_AUTH_URL, [result.requestToken]);

      if (await canLaunch(authUrl)) {
        launch(authUrl);
      }
    } catch (e) {
      yield Error(e);
    }
  }

  Stream<AuthenticationState> _mapResetPasswordToState() async* {
    if (await canLaunch(_RESET_PASSWORD_URL)) {
      launch(_RESET_PASSWORD_URL);
    }
  }

  void createRequestToken() {
    add(AuthenticateViaBrowser());
  }

  void authenticateWithLogin(String username, String password) {
    add(AuthenticateWithLogin(username, password));
  }

  void authenticateWithToken(String token) {
    add(AuthenticateWithToken(token));
  }

  void resetPassword() {
    add(ResetPassword());
  }
}
