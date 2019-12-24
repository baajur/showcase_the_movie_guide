import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:showcase_the_movie_guide/di/get_it.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_bloc.dart';
import 'package:showcase_the_movie_guide/res/route_generator.dart';

import 'res/colors.dart';
import 'res/localizations.dart';

void main() async {
  setupLogging();
  initGetIt();

  runApp(MyApp());
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MultiProvider(
      providers: [
        Provider<UserBloc>(
          create: (_) => UserBloc(getIt())..checkIfAuthenticated(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        theme: _buildAppTheme(),
        supportedLocales:
            AppLocalizations.supportedLanguages.map((languageCode) {
          return Locale(languageCode);
        }),
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale != null) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
          }

          return supportedLocales.first;
        },
      ),
    );
  }

  ThemeData _buildAppTheme() {
    final baseTheme = ThemeData.dark();

    return baseTheme.copyWith(
      accentColor: primaryColor,
      canvasColor: secondaryColor,
      scaffoldBackgroundColor: secondaryColor,
      appBarTheme: baseTheme.appBarTheme.copyWith(
        elevation: 0,
        color: secondaryColor,
      ),
    );
  }
}
