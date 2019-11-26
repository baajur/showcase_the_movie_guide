import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_localizations.dart';
import '../../../di/kiwi.dart';
import '../../../domain/models/movie.dart';
import '../../blocs/userBloc/bloc.dart';
import '../../blocs/userDataBloc/bloc.dart';
import '../../widgets/movie_item.dart';
import '../../widgets/movie_poster_item.dart';
import '../../widgets/read_more_text.dart';
import '../authentication/authentication_page.dart';
import 'actionsBloc/bloc.dart';
import 'movieDetailsBloc/bloc.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie _movie;

  const MovieDetailsPage(this._movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _buildBackdrop(),
                  _buildGradient(context),
                  _buildTop(context),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              _buildActions(),
              SizedBox(
                height: 16,
              ),
              _buildOverview(context),
              _buildBottom(context),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  CachedNetworkImage _buildBackdrop() {
    return CachedNetworkImage(
      imageUrl: _movie.fullBackdropPath,
      height: 220,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Container _buildGradient(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120),
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Container _buildTop(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.fromLTRB(24, 220 - 150 / 2, 24, 0),
      height: 150,
      child: Row(
        children: <Widget>[
          MoviePosterItem(
            _movie.fullPosterPath,
            height: 150,
            width: 100,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 4, 0, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _movie.title,
                    style: theme.textTheme.headline,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    _movie.releaseDate.isNotEmpty
                        ? DateTime.parse(_movie.releaseDate).year.toString()
                        : '-',
                    style: theme.textTheme.caption,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _movie.voteAverage.toString(),
                        style: theme.textTheme.caption,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        localizations.stringFormat('votes', [_movie.voteCount]),
                        style: theme.textTheme.caption,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildActions() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is Unauthenticated) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthenticationPage(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.playlist_add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthenticationPage(),
                    ),
                  );
                },
              ),
            ],
          );
        } else if (state is Authenticated) {
          return BlocProvider(
            builder: (context) => ActionsBloc(
                _movie, resolve(), BlocProvider.of<UserDataBloc>(context)),
            child: BlocBuilder<ActionsBloc, ActionsState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(state.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        BlocProvider.of<ActionsBloc>(context)
                            .favorite(!state.isFavorite);
                      },
                    ),
                    IconButton(
                      icon: Icon(state.isWatchlist
                          ? Icons.playlist_add_check
                          : Icons.playlist_add),
                      onPressed: () {
                        BlocProvider.of<ActionsBloc>(context)
                            .addToWatchlist(!state.isWatchlist);
                      },
                    ),
                  ],
                );
              },
            ),
          );
        }

        return null;
      },
    );
  }

  Container _buildOverview(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: ReadMoreText(
        _movie.overview,
        trimMode: TrimMode.Line,
        trimLines: 4,
        style: Theme.of(context).textTheme.body1.copyWith(color: Colors.grey),
      ),
    );
  }

  BlocProvider<MovieDetailsBloc> _buildBottom(BuildContext context) {
    return BlocProvider(
      builder: (context) =>
          MovieDetailsBloc(resolve())..loadMovieDetails(_movie),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is Loading) {
            return Container();
          } else if (state is Loaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (state.movieDetails.similar.results.isNotEmpty)
                  _buildSimilar(
                    context,
                    state.movieDetails.similar.results,
                  ),
                _builtMoreInformation(
                  context,
                  state.movieDetails,
                )
              ],
            );
          } else if (state is Error) {
            return Container();
          }

          return null;
        },
      ),
    );
  }

  Column _buildSimilar(
    BuildContext context,
    BuiltList<Movie> movies,
  ) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Text(
            localizations.stringFormat('similar_to', [_movie.title]),
            style: theme.textTheme.subhead.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieItem(movies[index]);
            },
          ),
        ),
      ],
    );
  }

  Column _builtMoreInformation(
    BuildContext context,
    MovieDetails movieDetails,
  ) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Text(
            localizations.string('more_information'),
            style: theme.textTheme.subhead.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildMoreInformationUrlPiece(
                      context,
                      localizations.string('homepage'),
                      movieDetails.homepage,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    _buildMoreInformationPiece(
                      context,
                      localizations.string('status'),
                      movieDetails.status,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildMoreInformationPiece(
                      context,
                      localizations.string('production_companies'),
                      movieDetails.productionCompanies
                          .map((it) => it.name)
                          .join(', '),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Text _buildMoreInformationUrlPiece(
    BuildContext context,
    String title,
    String url,
  ) {
    final theme = Theme.of(context);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: theme.textTheme.body1,
          ),
          TextSpan(
            text: url ?? '-',
            style: theme.textTheme.caption.copyWith(
              color: theme.accentColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
          ),
        ],
      ),
    );
  }

  Text _buildMoreInformationPiece(
    BuildContext context,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: theme.textTheme.body1,
          ),
          TextSpan(
            text: description,
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }
}
