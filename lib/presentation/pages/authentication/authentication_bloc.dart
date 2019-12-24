import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:showcase_the_movie_guide/core/validator.dart';
import 'package:showcase_the_movie_guide/domain/repositories/user_repository.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_bloc.dart';
import 'package:showcase_the_movie_guide/presentation/pages/authentication/authentication_event.dart';
import 'package:showcase_the_movie_guide/presentation/pages/authentication/authentication_state.dart';
import 'package:sprintf/sprintf.dart';
import 'package:url_launcher/url_launcher.dart';

const _AUTH_URL = 'https://www.themoviedb.org/authenticate/%s' +
    '?redirect_to=showcase://app.vs.showcasethemovieguide';
const _RESET_PASSWORD_URL = 'https://www.themoviedb.org/account/reset-password';

const _PLATFORM_CHANNEL = MethodChannel('app.vs.showcasethemovieguide/auth');

const _QUERY_REQUEST_TOKEN = 'request_token';
const _QUERY_APPROVED = 'approved';

class AuthenticationBloc {
  final Function(String, String) authenticateWithLogin;
  final Function() authenticateViaBrowser;
  final Function() resetPassword;

  final Stream<AuthenticationState> authentication;
  final Stream<Set<FieldValidationError>> usernameError;
  final Stream<Set<FieldValidationError>> passwordError;

  final Function() dispose;

  AuthenticationBloc._(
    this.authenticateWithLogin,
    this.authenticateViaBrowser,
    this.resetPassword,
    this.authentication,
    this.usernameError,
    this.passwordError,
    this.dispose,
  );

  factory AuthenticationBloc(UserRepository userRepository, UserBloc userBloc) {
    final validator = DefaultValidator();

    final authenticationController = PublishSubject<AuthenticationEvent>();

    final authentication = authenticationController
        .switchMap((event) => _authenticate(userRepository, event))
        .startWith(AuthenticationState.notAuthenticated());

    authentication.whereType<Authenticated>().listen((event) {
      userBloc.userAuthenticated(event.accountDetails);
    });

    final usernameErrorController =
        BehaviorSubject<Set<FieldValidationError>>.seeded({});
    final passwordErrorController =
        BehaviorSubject<Set<FieldValidationError>>.seeded({});

    final authenticateWithLogin = (String username, String password) {
      final usernameErrors = validator.validate(username);
      final passwordErrors = validator.validate(password);

      if (usernameErrors.isEmpty && passwordErrors.isEmpty) {
        authenticationController.add(AuthenticationEvent.authenticateWithLogin(
            username: username, password: password));
      }

      usernameErrorController.add(usernameErrors);
      passwordErrorController.add(passwordErrors);
    };

    final authenticateViaBrowser = () {
      authenticationController
          .add(AuthenticationEvent.authenticateViaBrowser());
    };

    final resetPassword = () async {
      if (await canLaunch(_RESET_PASSWORD_URL)) {
        launch(_RESET_PASSWORD_URL);
      }
    };

    final dispose = () {
      authenticationController.close();
      usernameErrorController.close();
      passwordErrorController.close();
    };

    SystemChannels.lifecycle.setMessageHandler((message) {
      if (message.contains('resume')) {
        _PLATFORM_CHANNEL.invokeMethod('getSharedData').then((data) {
          if (data.isEmpty) return;

          final String requestToken = data[_QUERY_REQUEST_TOKEN];
          final String approved = data[_QUERY_APPROVED];

          if (requestToken != null && approved != null && approved == 'true') {
            authenticationController.add(
                AuthenticationEvent.authenticateWithToken(token: requestToken));
          }
        });
      }

      return null;
    });

    return AuthenticationBloc._(
      authenticateWithLogin,
      authenticateViaBrowser,
      resetPassword,
      authentication,
      usernameErrorController,
      passwordErrorController,
      dispose,
    );
  }

  static Stream<AuthenticationState> _authenticate(
      UserRepository userRepository, AuthenticationEvent event) async* {
    yield AuthenticationState.authenticationProcessing();

    try {
      if (event is AuthenticateViaBrowser) {
        final requestToken = await userRepository.createRequestToken();
        final authUrl = sprintf(_AUTH_URL, [requestToken.requestToken]);

        if (await canLaunch(authUrl)) {
          launch(authUrl);
        }

        yield AuthenticationState.notAuthenticated();
      } else if (event is AuthenticateWithLogin) {
        final accountDetails = await userRepository.authenticateWithLogin(
            event.username, event.password);

        yield AuthenticationState.authenticated(accountDetails: accountDetails);
      } else if (event is AuthenticateWithToken) {
        final accountDetails =
            await userRepository.authenticateWithToken(event.token);

        yield AuthenticationState.authenticated(accountDetails: accountDetails);
      }
    } on Exception {
      yield AuthenticationState.authenticationError();
    }
  }
}
