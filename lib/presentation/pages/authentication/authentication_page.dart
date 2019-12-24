import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase_the_movie_guide/core/validator.dart';
import 'package:showcase_the_movie_guide/di/get_it.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_bloc.dart';
import 'package:showcase_the_movie_guide/presentation/pages/authentication/authentication_bloc.dart';
import 'package:showcase_the_movie_guide/presentation/pages/authentication/authentication_state.dart';
import 'package:showcase_the_movie_guide/res/colors.dart';
import 'package:showcase_the_movie_guide/res/localizations.dart';

class AuthenticationPage extends StatelessWidget {
  static const routeName = '/authentication';

  @override
  Widget build(BuildContext context) {
    return Provider<AuthenticationBloc>(
      create: (_) =>
          AuthenticationBloc(getIt(), Provider.of<UserBloc>(context)),
      dispose: (_, bloc) => bloc.dispose(),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: tmdbPrimaryColor,
          scaffoldBackgroundColor: tmdbSecondaryColor,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                color: tmdbSecondaryColor,
              ),
          buttonTheme: Theme.of(context).buttonTheme.copyWith(
                buttonColor: tmdbPrimaryColor,
              ),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: AuthenticationForm(),
        ),
      ),
    );
  }
}

class AuthenticationForm extends StatefulWidget {
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  var _obscurePassword = true;

  TextEditingController _usernameController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return Consumer<AuthenticationBloc>(
      builder: (context, authenticationBloc, _) {
        return StreamBuilder<AuthenticationState>(
          stream: authenticationBloc.authentication,
          initialData: AuthenticationState.notAuthenticated(),
          builder: (context, snapshot) {
            bool enabled = !(snapshot.data is AuthenticationProcessing);

            return Form(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      localizations.string('login_to_your_account'),
                      style: theme.textTheme.title,
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    StreamBuilder<Set<FieldValidationError>>(
                        stream: authenticationBloc.usernameError,
                        initialData: {},
                        builder: (context, snapshot) {
                          return TextFormField(
                            enabled: enabled,
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText:
                                    localizations.string('hint_username'),
                                border: OutlineInputBorder(),
                                errorText:
                                    _usernameErrorText(context, snapshot.data)),
                          );
                        }),
                    SizedBox(
                      height: 8,
                    ),
                    StreamBuilder<Set<FieldValidationError>>(
                        stream: authenticationBloc.passwordError,
                        initialData: {},
                        builder: (context, snapshot) {
                          return TextFormField(
                            enabled: enabled,
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                  color: Colors.grey,
                                ),
                                labelText:
                                    localizations.string('hint_password'),
                                border: OutlineInputBorder(),
                                errorText:
                                    _passwordErrorText(context, snapshot.data)),
                          );
                        }),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            localizations.string('reset_password'),
                            style: theme.textTheme.caption,
                          ),
                          onTap: authenticationBloc.resetPassword,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RaisedButton(
                      onPressed: enabled
                          ? () {
                              authenticationBloc.authenticateWithLogin(
                                  _usernameController.text,
                                  _passwordController.text);
                            }
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(localizations.string('login_with_tmdb')),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      child: Text(
                        localizations.string('login_via_browser'),
                        style: theme.textTheme.body1,
                      ),
                      onTap: authenticationBloc.authenticateViaBrowser,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  String _usernameErrorText(
      BuildContext context, Set<FieldValidationError> errors) {
    if (errors.isEmpty) {
      return null;
    }

    switch (errors.first) {
      case FieldValidationError.fieldIsEmpty:
        return AppLocalizations.of(context).string('error_empty_username');
      default:
        return null;
    }
  }

  String _passwordErrorText(
      BuildContext context, Set<FieldValidationError> errors) {
    if (errors.isEmpty) {
      return null;
    }

    switch (errors.first) {
      case FieldValidationError.fieldIsEmpty:
        return AppLocalizations.of(context).string('error_empty_password');
      default:
        return null;
    }
  }
}
