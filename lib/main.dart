import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userDataBloc/user_data_bloc.dart';

import 'core/app_colors.dart';
import 'core/app_localizations.dart';
import 'di/kiwi.dart';
import 'presentation/blocs/userBloc/user_bloc.dart';
import 'presentation/pages/movies/movies_page.dart';

void main() async {
  initKiwi();
  setupLogging();

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

    return BlocProvider(
      builder: (context) =>
          UserBloc(resolve(), resolve())..checkIfAuthenticated(),
      child: BlocProvider(
        builder: (context) =>
            UserDataBloc(resolve(), BlocProvider.of<UserBloc>(context)),
        child: MaterialApp(
          theme: _buildAppTheme(),
          home: MoviesPage(),
          supportedLocales:
              AppLocalizations.supportedLanguages.map((languageCode) {
            return Locale(languageCode);
          }),
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
