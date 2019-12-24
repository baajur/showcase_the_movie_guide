import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:showcase_the_movie_guide/res/constants.dart';
import 'package:showcase_the_movie_guide/domain/serializers.dart';

import 'movie.dart';

part 'film.g.dart';

abstract class FilmResult
    implements Built<FilmResult, FilmResultBuilder>, MovieResult {
  @BuiltValueField(wireName: 'page')
  int get page;

  @BuiltValueField(wireName: 'results')
  BuiltList<Film> get results;

  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  FilmResult._();

  factory FilmResult([updates(FilmResultBuilder b)]) = _$FilmResult;

  factory FilmResult.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(FilmResult.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(FilmResult.serializer, this);
  }

  static Serializer<FilmResult> get serializer => _$filmResultSerializer;
}

abstract class Film implements Built<Film, FilmBuilder>, Movie {
  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @BuiltValueField(wireName: 'overview')
  String get overview;

  @nullable
  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @BuiltValueField(wireName: 'video')
  bool get video;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  Film._();

  factory Film([updates(FilmBuilder b)]) = _$Film;

  factory Film.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Film.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Film.serializer, this);
  }

  static Serializer<Film> get serializer => _$filmSerializer;

  String get fullPosterPath =>
      posterPath != null ? TMDB_IMAGE_BASE_URL + posterPath : 'null';

  String get fullBackdropPath =>
      backdropPath != null ? TMDB_IMAGE_BASE_URL + backdropPath : 'null';

  @override
  String get stringType => 'movie';
}

abstract class FilmDetails
    implements Built<FilmDetails, FilmDetailsBuilder>, MovieDetails {
  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @BuiltValueField(wireName: 'budget')
  int get budget;

  @BuiltValueField(wireName: 'genres')
  BuiltList<Genre> get genres;

  @nullable
  @BuiltValueField(wireName: 'homepage')
  String get homepage;

  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'imdb_id')
  String get imdbId;

  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @nullable
  @BuiltValueField(wireName: 'overview')
  String get overview;

  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'production_companies')
  BuiltList<ProductionCompany> get productionCompanies;

  @BuiltValueField(wireName: 'production_countries')
  BuiltList<ProductionCountry> get productionCountries;

  @nullable
  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @BuiltValueField(wireName: 'revenue')
  int get revenue;

  @nullable
  @BuiltValueField(wireName: 'runtime')
  int get runtime;

  @BuiltValueField(wireName: 'spoken_languages')
  BuiltList<SpokenLanguage> get spokenLanguages;

  @BuiltValueField(wireName: 'status')
  String get status;

  @nullable
  @BuiltValueField(wireName: 'tagline')
  String get tagline;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'video')
  bool get video;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  FilmResult get similar;

  FilmDetails._();

  factory FilmDetails([updates(FilmDetailsBuilder b)]) = _$FilmDetails;

  factory FilmDetails.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(FilmDetails.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(FilmDetails.serializer, this);
  }

  static Serializer<FilmDetails> get serializer => _$filmDetailsSerializer;
}
