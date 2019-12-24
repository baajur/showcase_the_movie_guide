import 'package:flutter/material.dart';
import 'package:showcase_the_movie_guide/res/localizations.dart';

class RouteErrorPage extends StatelessWidget {
  static const routeName = '/routeError';

  final String route;

  const RouteErrorPage(this.route, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Text(
          localizations.stringFormat('route_error', [route])
        ),
      ),
    );
  }
}
