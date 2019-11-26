import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_localizations.dart';
import '../../../core/exceptions.dart';
import '../../../di/kiwi.dart';
import '../../blocs/userBloc/user_bloc.dart';
import 'bloc/authentication_bloc.dart';
import 'bloc/bloc.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
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
        body: BlocProvider(
          builder: (context) => AuthenticationBloc(
            resolve(),
            resolve(),
            BlocProvider.of<UserBloc>(context),
          ),
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              _handleState(context, state);
            },
            child: AuthenticationForm(),
          ),
        ),
      ),
    );
  }

  void _handleState(BuildContext context, AuthenticationState state) {
    if (state is Authenticated) {
      Navigator.of(context).pop();
    } else if (state is Error) {
      final exception = state.exception;

      if (exception is ApiException) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(exception.status.statusMessage),
          ),
        );
      }
    }
  }
}

class AuthenticationForm extends StatefulWidget {
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formGlobalKey = GlobalKey<FormState>();

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
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        bool enabled = !(state is Loading);

        return Form(
          key: _formGlobalKey,
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
                TextFormField(
                  enabled: enabled,
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateUsername,
                  decoration: InputDecoration(
                    labelText: localizations.string('hint_username'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  enabled: enabled,
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: _obscurePassword,
                  validator: _validatePassword,
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
                    labelText: localizations.string('hint_password'),
                    border: OutlineInputBorder(),
                  ),
                ),
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
                      onTap: () async {
                        BlocProvider.of<AuthenticationBloc>(context).resetPassword();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  onPressed: enabled
                      ? () {
                          if (_formGlobalKey.currentState.validate()) {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .authenticateWithLogin(_usernameController.text,
                                    _passwordController.text);
                          }
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
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .createRequestToken();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _validateUsername(String username) {
    if (username.isEmpty)
      return AppLocalizations.of(context).string('error_empty_username');
    return null;
  }

  String _validatePassword(String password) {
    if (password.isEmpty)
      return AppLocalizations.of(context).string('error_empty_password');
    return null;
  }
}
