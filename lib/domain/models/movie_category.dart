import 'package:equatable/equatable.dart';
import 'package:showcase_the_movie_guide/domain/repositories/paged_repository.dart';

import 'movie.dart';

class MovieCategory extends Equatable {
  final String category;
  final DataSource<Movie> dataSource;

  MovieCategory(this.category, this.dataSource);

  @override
  List<Object> get props => [category, dataSource];
}
