import 'package:flutter/material.dart';
import 'package:flutter_paging/flutter_paging.dart';
import 'package:showcase_the_movie_guide/res/localizations.dart';
import 'package:showcase_the_movie_guide/domain/models/movie_category.dart';
import 'package:showcase_the_movie_guide/presentation/widgets/movie_item.dart';

class MovieCategoryItem extends StatelessWidget {
  final MovieCategory category;

  const MovieCategoryItem(
    this.category, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    category.dataSource.init();

    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Text(
            localizations.string(category.category),
            style: theme.textTheme.subhead.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
        ),
        Container(
          height: 220,
          child: PagingListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            scrollDirection: Axis.horizontal,
            dataSource: category.dataSource,
            loadingIndicator: Container(
              margin: EdgeInsets.all(4.0),
              width: 110,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
            itemBuilder: (context, index, item) {
              return MovieItem(item);
            },
          ),
        ),
      ],
    );
  }
}
