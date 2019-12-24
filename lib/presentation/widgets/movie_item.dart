import 'package:flutter/material.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/presentation/pages/movieDetails/movie_details_page.dart';
import 'package:showcase_the_movie_guide/presentation/widgets/movie_poster_item.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MovieDetailsPage.routeName, arguments: movie);
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        width: 110,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MoviePosterItem(movie.fullPosterPath),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: Text(
                movie.title,
                maxLines: 2,
                style: theme.textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
