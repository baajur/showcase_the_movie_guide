import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:showcase_the_movie_guide/res/constants.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/domain/serializers.dart';

part 'tv_show.g.dart';

abstract class TvShowResult
    implements Built<TvShowResult, TvShowResultBuilder>, MovieResult {
  @BuiltValueField(wireName: 'page')
  int get page;

  @BuiltValueField(wireName: 'results')
  BuiltList<TvShow> get results;

  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  TvShowResult._();

  factory TvShowResult([updates(TvShowResultBuilder b)]) = _$TvShowResult;

  factory TvShowResult.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TvShowResult.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TvShowResult.serializer, this);
  }

  static Serializer<TvShowResult> get serializer => _$tvShowResultSerializer;
}

abstract class TvShow implements Built<TvShow, TvShowBuilder>, Movie {
  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'overview')
  String get overview;

  @nullable
  @BuiltValueField(wireName: 'first_air_date')
  String get releaseDate;

  @BuiltValueField(wireName: 'origin_country')
  BuiltList<String> get originCountry;

  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @BuiltValueField(wireName: 'name')
  String get title;

  @BuiltValueField(wireName: 'original_name')
  String get originalTitle;

  TvShow._();

  factory TvShow([updates(TvShowBuilder b)]) = _$TvShow;

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TvShow.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TvShow.serializer, this);
  }

  static Serializer<TvShow> get serializer => _$tvShowSerializer;

  String get fullPosterPath =>
      posterPath != null ? TMDB_IMAGE_BASE_URL + posterPath : 'null';

  String get fullBackdropPath =>
      backdropPath != null ? TMDB_IMAGE_BASE_URL + backdropPath : 'null';

  @override
  String get stringType => 'tv';
}

abstract class TvShowDetails
    implements Built<TvShowDetails, TvShowDetailsBuilder>, MovieDetails {
  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @BuiltValueField(wireName: 'created_by')
  BuiltList<CreatedBy> get createdBy;

  @BuiltValueField(wireName: 'episode_run_time')
  BuiltList<int> get episodeRunTime;

  @BuiltValueField(wireName: 'first_air_date')
  String get firstAirDate;

  @BuiltValueField(wireName: 'genres')
  BuiltList<Genre> get genres;

  @BuiltValueField(wireName: 'homepage')
  String get homepage;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'in_production')
  bool get inProduction;

  @BuiltValueField(wireName: 'languages')
  BuiltList<String> get languages;

  @nullable
  @BuiltValueField(wireName: 'last_air_date')
  String get releaseDate;

  @nullable
  @BuiltValueField(wireName: 'last_episode_to_air')
  LastEpisodeToAir get lastEpisodeToAir;

  @BuiltValueField(wireName: 'name')
  String get title;

  @BuiltValueField(wireName: 'networks')
  BuiltList<ProductionCompany> get networks;

  @BuiltValueField(wireName: 'number_of_episodes')
  int get numberOfEpisodes;

  @BuiltValueField(wireName: 'number_of_seasons')
  int get numberOfSeasons;

  @BuiltValueField(wireName: 'origin_country')
  BuiltList<String> get originCountry;

  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @BuiltValueField(wireName: 'original_name')
  String get originalTitle;

  @BuiltValueField(wireName: 'overview')
  String get overview;

  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'production_companies')
  BuiltList<ProductionCompany> get productionCompanies;

  @BuiltValueField(wireName: 'seasons')
  BuiltList<Season> get seasons;

  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  TvShowResult get similar;

  TvShowDetails._();

  factory TvShowDetails([updates(TvShowDetailsBuilder b)]) = _$TvShowDetails;

  factory TvShowDetails.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TvShowDetails.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TvShowDetails.serializer, this);
  }

  static Serializer<TvShowDetails> get serializer => _$tvShowDetailsSerializer;
}

abstract class CreatedBy implements Built<CreatedBy, CreatedByBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'credit_id')
  String get creditId;

  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'gender')
  int get gender;

  @BuiltValueField(wireName: 'profile_path')
  String get profilePath;

  CreatedBy._();

  factory CreatedBy([updates(CreatedByBuilder b)]) = _$CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CreatedBy.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(CreatedBy.serializer, this);
  }

  static Serializer<CreatedBy> get serializer => _$createdBySerializer;
}

abstract class LastEpisodeToAir
    implements Built<LastEpisodeToAir, LastEpisodeToAirBuilder> {
  @BuiltValueField(wireName: 'air_date')
  String get airDate;

  @BuiltValueField(wireName: 'episode_number')
  int get episodeNumber;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'overview')
  String get overview;

  @BuiltValueField(wireName: 'production_code')
  String get productionCode;

  @BuiltValueField(wireName: 'season_number')
  int get seasonNumber;

  @BuiltValueField(wireName: 'show_id')
  int get showId;

  @nullable
  @BuiltValueField(wireName: 'still_path')
  String get stillPath;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  LastEpisodeToAir._();

  factory LastEpisodeToAir([updates(LastEpisodeToAirBuilder b)]) =
      _$LastEpisodeToAir;

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LastEpisodeToAir.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LastEpisodeToAir.serializer, this);
  }

  static Serializer<LastEpisodeToAir> get serializer =>
      _$lastEpisodeToAirSerializer;
}

abstract class Season implements Built<Season, SeasonBuilder> {
  @nullable
  @BuiltValueField(wireName: 'air_date')
  String get airDate;

  @BuiltValueField(wireName: 'episode_count')
  int get episodeCount;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'overview')
  String get overview;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'season_number')
  int get seasonNumber;

  Season._();

  factory Season([updates(SeasonBuilder b)]) = _$Season;

  factory Season.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Season.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Season.serializer, this);
  }

  static Serializer<Season> get serializer => _$seasonSerializer;
}
