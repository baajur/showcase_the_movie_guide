import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase_the_movie_guide/di/get_it.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_bloc.dart';
import 'package:showcase_the_movie_guide/presentation/blocs/userBloc/user_state.dart';
import 'package:showcase_the_movie_guide/presentation/pages/authentication/authentication_page.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movieDetails/movie_details_bloc.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movieDetails/movie_details_state.dart';
import 'package:showcase_the_movie_guide/presentation/widgets/movie_item.dart';
import 'package:showcase_the_movie_guide/presentation/widgets/movie_poster_item.dart';
import 'package:showcase_the_movie_guide/presentation/widgets/read_more_text.dart';
import 'package:showcase_the_movie_guide/res/localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/movieDetails';

  final Movie movie;

  const MovieDetailsPage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<MovieDetailsBloc>(
      create: (_) => MovieDetailsBloc(
          getIt(), getIt(), Provider.of<UserBloc>(context), movie)
        ..loadMovieDetails(movie),
      dispose: (_, bloc) => bloc.dispose,
      child: Scaffold(
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
                _buildActions(context),
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
      ),
    );
  }

  CachedNetworkImage _buildBackdrop() {
    return CachedNetworkImage(
      imageUrl: movie.fullBackdropPath,
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
            movie.fullPosterPath,
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
                    movie.title,
                    style: theme.textTheme.headline,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    movie.releaseDate.isNotEmpty
                        ? DateTime.parse(movie.releaseDate).year.toString()
                        : '-',
                    style: theme.textTheme.caption,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        movie.voteAverage.toString(),
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
                        localizations.stringFormat('votes', [movie.voteCount]),
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

  Widget _buildActions(BuildContext context) {
    return Consumer2<UserBloc, MovieDetailsBloc>(
      builder: (context, userBloc, movieDetailsBloc, _) {
        return StreamBuilder<UserAuthenticationState>(
          stream: userBloc.userAuthentication,
          initialData: UserAuthenticationState.userNotAuthenticated(),
          builder: (context, snapshot) {
            return snapshot.data.when(
              userAuthenticated: (state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    StreamBuilder<bool>(
                      stream: movieDetailsBloc.favorite,
                      initialData: false,
                      builder: (context, snapshot) {
                        return IconButton(
                          icon: Icon(snapshot.data
                              ? Icons.favorite
                              : Icons.favorite_border),
                          onPressed: () {
                            movieDetailsBloc.updateFavorite(movie, !snapshot.data);
                          },
                        );
                      },
                    ),
                    StreamBuilder<bool>(
                      stream: movieDetailsBloc.watchlist,
                      initialData: false,
                      builder: (context, snapshot) {
                        return IconButton(
                          icon: Icon(snapshot.data
                              ? Icons.playlist_add_check
                              : Icons.playlist_add),
                          onPressed: () {
                            movieDetailsBloc.updateWatchlist(movie, !snapshot.data);
                          },
                        );
                      },
                    ),
                  ],
                );
              },
              userNotAuthenticated: (state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AuthenticationPage.routeName);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.playlist_add),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AuthenticationPage.routeName);
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Container _buildOverview(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: ReadMoreText(
        movie.overview,
        trimMode: TrimMode.Line,
        trimLines: 4,
        style: Theme.of(context).textTheme.body1.copyWith(color: Colors.grey),
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Consumer<MovieDetailsBloc>(
      builder: (context, movieDetailsBloc, _) {
        return StreamBuilder<MovieDetailsState>(
          stream: movieDetailsBloc.movieDetails,
          initialData: MovieDetailsState.movieDetailsLoading(),
          builder: (context, snapshot) {
            return snapshot.data.when(
              movieDetailsLoading: (state) {
                return Container();
              },
              movieDetailsSuccess: (state) {
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
              },
              movieDetailsFailure: (state) {
                return Container();
              },
            );
          },
        );
      },
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
            localizations.stringFormat('similar_to', [movie.title]),
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
      BuildContext context, String title, String url) {
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
