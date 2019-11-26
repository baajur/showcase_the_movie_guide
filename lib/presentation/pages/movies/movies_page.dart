import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_the_movie_guide/core/exceptions.dart';
import 'package:showcase_the_movie_guide/presentation/pages/about/about_page.dart';

import '../../../core/app_localizations.dart';
import '../../../di/kiwi.dart';
import '../../blocs/userBloc/bloc.dart';
import '../../widgets/movie_category_item.dart';
import '../authentication/authentication_page.dart';
import 'bloc/bloc.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => MoviesBloc(resolve())..loadFilms(),
      child: Scaffold(
        drawer: _buildDrawer(context),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxInScrolled) {
              return [_buildSliverAppBar(context, innerBoxInScrolled)];
            },
            body: _buildBody(),
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Drawer(
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is Unauthenticated) {
                    return SafeArea(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.perm_identity),
                            title: Text(localizations.string('login')),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AuthenticationPage(),
                                ),
                              );
                            },
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  } else if (state is Authenticated) {
                    return UserAccountsDrawerHeader(
                      arrowColor: Colors.red,
                      currentAccountPicture: ClipRRect(
                        borderRadius: BorderRadius.circular(64),
                        child: CachedNetworkImage(
                          imageUrl:
                              state.accountDetails.avatar.gravatar.fullPath,
                          width: 64,
                          height: 64,
                        ),
                      ),
                      accountName: Text(state.accountDetails.name),
                      accountEmail: Text(state.accountDetails.username),
                    );
                  }

                  return null;
                },
              ),
              ListTile(
                leading: Icon(Icons.tv),
                selected: state is Films,
                title: Text(localizations.string('films')),
                onTap: () {
                  BlocProvider.of<MoviesBloc>(context).loadFilms();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.live_tv),
                selected: state is TvShows,
                title: Text(localizations.string('tv_shows')),
                onTap: () {
                  BlocProvider.of<MoviesBloc>(context).loadTvShows();
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(localizations.string('about')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(
    BuildContext context,
    bool innerBoxInScrolled,
  ) {
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

  BlocBuilder<MoviesBloc, MoviesState> _buildBody() {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Films) {
          return ListView.builder(
            key: ValueKey(state.runtimeType),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: state.films.length,
            itemBuilder: (context, index) {
              return MovieCategoryItem(
                state.films[index],
              );
            },
          );
        } else if (state is TvShows) {
          return ListView.builder(
            key: ValueKey(state.runtimeType),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: state.tvShows.length,
            itemBuilder: (context, index) {
              return MovieCategoryItem(
                state.tvShows[index],
              );
            },
          );
        } else if (state is Error) {
          return _mapErrorStateToWidget(context, state);
        }

        return null;
      },
    );
  }

  Widget _mapErrorStateToWidget(BuildContext context, Error state) {
    final localizations = AppLocalizations.of(context);

    if (state.exception is NetworkNotAvailableException) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            localizations.string('error_network_not_available'),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          localizations.string('error_unknown'),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
