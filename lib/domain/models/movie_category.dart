import 'package:equatable/equatable.dart';

import '../repositories/paged_repository.dart';
import 'movie.dart';

class MovieCategory extends Equatable {
  final String title;
  final DataSource<Movie> dataSource;

  MovieCategory(this.title, this.dataSource);

  @override
  List<Object> get props => [title, dataSource];
}
