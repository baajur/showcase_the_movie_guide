import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info/package_info.dart';
import 'package:showcase_the_movie_guide/res/colors.dart';
import 'package:showcase_the_movie_guide/res/localizations.dart';
import 'package:url_launcher/url_launcher.dart';

const _TMDB_URL = 'https://www.themoviedb.org/';
const _PRIVACY_POLICY_URL =
    'https://theprojectn.app/showcasethemovieguide/privacy_policy.html';

class AboutPage extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: localizations.string('app_first_title'),
                      style: theme.textTheme.headline),
                  TextSpan(
                    text: localizations.string('app_second_title'),
                    style: theme.textTheme.headline
                        .copyWith(color: theme.accentColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    localizations
                        .stringFormat('version', [snapshot.data.version]),
                    style: theme.textTheme.body1,
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 8,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: localizations.string('powered_by'),
                    style: theme.textTheme.body1,
                  ),
                  TextSpan(
                    text: localizations.string('tmdb'),
                    style: theme.textTheme.body1.copyWith(
                      color: theme.accentColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (await canLaunch(_TMDB_URL)) {
                          launch(_TMDB_URL);
                        }
                      },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SvgPicture.asset(
              'assets/images/PoweredBy.svg',
              color: tmdbPrimaryColor,
              width: 200,
            ),
            SizedBox(
              height: 8,
            ),
            Text.rich(
              TextSpan(
                text: localizations.string('privacy_policy'),
                style: theme.textTheme.body1.copyWith(
                  color: theme.accentColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    if (await canLaunch(_PRIVACY_POLICY_URL)) {
                      launch(_PRIVACY_POLICY_URL);
                    }
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
