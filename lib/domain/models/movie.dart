import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:showcase_the_movie_guide/domain/serializers.dart';

part 'movie.g.dart';

abstract class MovieResult {
  int get page;

  BuiltList<Movie> get results;

  int get totalResults;

  int get totalPages;
}

abstract class Movie {
  @nullable
  String get posterPath;

  String get overview;

  String get releaseDate;

  BuiltList<int> get genreIds;

  int get id;

  String get originalTitle;

  String get originalLanguage;

  String get title;

  @nullable
  String get backdropPath;

  double get popularity;

  int get voteCount;

  double get voteAverage;

  String get fullPosterPath;

  String get fullBackdropPath;

  String get stringType;
}

abstract class MovieDetails {
  @nullable
  String get backdropPath;

  BuiltList<Genre> get genres;

  @nullable
  String get homepage;

  int get id;

  @nullable
  String get originalLanguage;

  String get originalTitle;

  @nullable
  String get overview;

  double get popularity;

  @nullable
  String get posterPath;

  BuiltList<ProductionCompany> get productionCompanies;

  String get releaseDate;

  @nullable
  String get status;

  @nullable
  String get title;

  double get voteAverage;

  int get voteCount;

  MovieResult get similar;
}

abstract class Genre implements Built<Genre, GenreBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  Genre._();

  factory Genre([updates(GenreBuilder b)]) = _$Genre;

  factory Genre.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Genre.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Genre.serializer, this);
  }

  static Serializer<Genre> get serializer => _$genreSerializer;
}

abstract class ProductionCompany
    implements Built<ProductionCompany, ProductionCompanyBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'logo_path')
  String get logoPath;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'origin_country')
  String get originCountry;

  ProductionCompany._();

  factory ProductionCompany([updates(ProductionCompanyBuilder b)]) =
      _$ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ProductionCompany.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ProductionCompany.serializer, this);
  }

  static Serializer<ProductionCompany> get serializer =>
      _$productionCompanySerializer;
}

abstract class ProductionCountry
    implements Built<ProductionCountry, ProductionCountryBuilder> {
  @BuiltValueField(wireName: 'iso_3166_1')
  String get iso31661;

  @BuiltValueField(wireName: 'name')
  String get name;

  ProductionCountry._();

  factory ProductionCountry([updates(ProductionCountryBuilder b)]) =
      _$ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ProductionCountry.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ProductionCountry.serializer, this);
  }

  static Serializer<ProductionCountry> get serializer =>
      _$productionCountrySerializer;
}

abstract class SpokenLanguage
    implements Built<SpokenLanguage, SpokenLanguageBuilder> {
  @BuiltValueField(wireName: 'iso_639_1')
  String get iso6391;

  @BuiltValueField(wireName: 'name')
  String get name;

  SpokenLanguage._();

  factory SpokenLanguage([updates(SpokenLanguageBuilder b)]) = _$SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SpokenLanguage.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SpokenLanguage.serializer, this);
  }

  static Serializer<SpokenLanguage> get serializer =>
      _$spokenLanguageSerializer;
}
