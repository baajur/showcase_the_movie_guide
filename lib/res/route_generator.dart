import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/presentation/pages/about/about_page.dart';
import 'package:showcase_the_movie_guide/presentation/pages/authentication/authentication_page.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movieDetails/movie_details_page.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movies/movies_page.dart';
import 'package:showcase_the_movie_guide/presentation/pages/route_error/route_error_page.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case MoviesPage.routeName:
        return MaterialPageRoute(builder: (_) => MoviesPage());
      case MovieDetailsPage.routeName:
        if (args is Movie) {
          return MaterialPageRoute(
            builder: (_) => MovieDetailsPage(args),
          );
        }
        return _buildRouteError(settings.name);
      case AuthenticationPage.routeName:
        return MaterialPageRoute(
          builder: (_) => AuthenticationPage(),
        );
      case AboutPage.routeName:
        return MaterialPageRoute(builder: (_) => AboutPage());
      default:
        return _buildRouteError(settings.name);
    }
  }

  static Route<dynamic> _buildRouteError(String route) {
    return MaterialPageRoute(builder: (_) => RouteErrorPage(route));
  }
}
