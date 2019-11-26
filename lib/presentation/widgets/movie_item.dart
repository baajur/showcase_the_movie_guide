import 'package:flutter/material.dart';

import '../../domain/models/movie.dart';
import '../pages/movieDetails/movie_details_page.dart';
import 'movie_poster_item.dart';

class MovieItem extends StatelessWidget {
  final Movie _movie;

  const MovieItem(this._movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(_movie),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        width: 110,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MoviePosterItem(_movie.fullPosterPath),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: Text(
                _movie.title,
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
