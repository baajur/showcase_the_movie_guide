import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase_the_movie_guide/di/get_it.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_bloc.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_state.dart';
import 'package:showcase_the_movie_guide/presentation/pages/about/about_page.dart';
import 'package:showcase_the_movie_guide/presentation/pages/authentication/authentication_page.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movies/movies_bloc.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movies/movies_state.dart';
import 'package:showcase_the_movie_guide/presentation/widgets/movie_category_item.dart';
import 'package:showcase_the_movie_guide/res/localizations.dart';

class MoviesPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Provider<MoviesBloc>(
      create: (_) => MoviesBloc(getIt()),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        drawer: _buildDrawer(context),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxInScrolled) {
              return [_buildSliverAppBar(context, innerBoxInScrolled)];
            },
            body: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Drawer(
      child: Consumer2<UserBloc, MoviesBloc>(
        builder: (context, userBloc, moviesBloc, _) {
          return StreamBuilder<MoviesSection>(
            stream: moviesBloc.section,
            initialData: MoviesSection.film,
            builder: (context, snapshot) {
              return Column(
                children: <Widget>[
                  StreamBuilder<UserAuthenticationState>(
                    stream: userBloc.userAuthentication,
                    initialData: UserAuthenticationState.userNotAuthenticated(),
                    builder: (context, snapshot) {
                      return snapshot.data.when(
                        userAuthenticated: (state) {
                          return UserAccountsDrawerHeader(
                            arrowColor: Colors.red,
                            currentAccountPicture: ClipRRect(
                              borderRadius: BorderRadius.circular(64),
                              child: CachedNetworkImage(
                                imageUrl: state
                                    .accountDetails.avatar.gravatar.fullPath,
                                width: 64,
                                height: 64,
                              ),
                            ),
                            accountName: Text(state.accountDetails.name),
                            accountEmail: Text(state.accountDetails.username),
                          );
                        },
                        userNotAuthenticated: (state) {
                          return SafeArea(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.perm_identity),
                                  title: Text(localizations.string('login')),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushNamed(
                                        AuthenticationPage.routeName);
                                  },
                                ),
                                Divider(),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.tv),
                    selected: snapshot.data == MoviesSection.film,
                    title: Text(localizations.string('films')),
                    onTap: () {
                      moviesBloc.load(MoviesSection.film);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.live_tv),
                    selected: snapshot.data == MoviesSection.tvShow,
                    title: Text(localizations.string('tv_shows')),
                    onTap: () {
                      moviesBloc.load(MoviesSection.tvShow);
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(localizations.string('about')),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(AboutPage.routeName);
                    },
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(
      BuildContext context, bool innerBoxInScrolled) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return SliverAppBar(
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: localizations.string('app_first_title'),
              style: theme.textTheme.title,
            ),
            TextSpan(
              text: localizations.string('app_second_title'),
              style: theme.textTheme.title.copyWith(color: theme.accentColor),
            )
          ],
        ),
      ),
      floating: true,
      forceElevated: innerBoxInScrolled,
    );
  }

  Consumer _buildBody(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Consumer<MoviesBloc>(
      builder: (context, moviesBloc, _) {
        return StreamBuilder<MoviesState>(
          stream: moviesBloc.movies,
          initialData: MoviesState.moviesLoading(),
          builder: (context, snapshot) {
            return snapshot.data.when(
              moviesLoading: (state) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              moviesSuccess: (state) {
                return ListView.builder(
                  key: ValueKey(state.runtimeType),
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return MovieCategoryItem(
                      state.categories[index],
                    );
                  },
                );
              },
              moviesFailure: (state) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      localizations.string('error_unknown'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
