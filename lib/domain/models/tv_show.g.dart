// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TvShowResult> _$tvShowResultSerializer =
    new _$TvShowResultSerializer();
Serializer<TvShow> _$tvShowSerializer = new _$TvShowSerializer();
Serializer<TvShowDetails> _$tvShowDetailsSerializer =
    new _$TvShowDetailsSerializer();
Serializer<CreatedBy> _$createdBySerializer = new _$CreatedBySerializer();
Serializer<LastEpisodeToAir> _$lastEpisodeToAirSerializer =
    new _$LastEpisodeToAirSerializer();
Serializer<Season> _$seasonSerializer = new _$SeasonSerializer();

class _$TvShowResultSerializer implements StructuredSerializer<TvShowResult> {
  @override
  final Iterable<Type> types = const [TvShowResult, _$TvShowResult];
  @override
  final String wireName = 'TvShowResult';

  @override
  Iterable<Object> serialize(Serializers serializers, TvShowResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TvShow)])),
      'total_results',
      serializers.serialize(object.totalResults,
          specifiedType: const FullType(int)),
      'total_pages',
      serializers.serialize(object.totalPages,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  TvShowResult deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TvShowResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(TvShow)]))
              as BuiltList<dynamic>);
          break;
        case 'total_results':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TvShowSerializer implements StructuredSerializer<TvShow> {
  @override
  final Iterable<Type> types = const [TvShow, _$TvShow];
  @override
  final String wireName = 'TvShow';

  @override
  Iterable<Object> serialize(Serializers serializers, TvShow object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'popularity',
      serializers.serialize(object.popularity,
          specifiedType: const FullType(double)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
      'overview',
      serializers.serialize(object.overview,
          specifiedType: const FullType(String)),
      'origin_country',
      serializers.serialize(object.originCountry,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'genre_ids',
      serializers.serialize(object.genreIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'original_language',
      serializers.serialize(object.originalLanguage,
          specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'original_name',
      serializers.serialize(object.originalTitle,
          specifiedType: const FullType(String)),
    ];
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    if (object.backdropPath != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(object.backdropPath,
            specifiedType: const FullType(String)));
    }
    if (object.releaseDate != null) {
      result
        ..add('first_air_date')
        ..add(serializers.serialize(object.releaseDate,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TvShow deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TvShowBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_air_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'origin_country':
          result.originCountry.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_name':
          result.originalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TvShowDetailsSerializer implements StructuredSerializer<TvShowDetails> {
  @override
  final Iterable<Type> types = const [TvShowDetails, _$TvShowDetails];
  @override
  final String wireName = 'TvShowDetails';

  @override
  Iterable<Object> serialize(Serializers serializers, TvShowDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'created_by',
      serializers.serialize(object.createdBy,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CreatedBy)])),
      'episode_run_time',
      serializers.serialize(object.episodeRunTime,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'first_air_date',
      serializers.serialize(object.firstAirDate,
          specifiedType: const FullType(String)),
      'genres',
      serializers.serialize(object.genres,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Genre)])),
      'homepage',
      serializers.serialize(object.homepage,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'in_production',
      serializers.serialize(object.inProduction,
          specifiedType: const FullType(bool)),
      'languages',
      serializers.serialize(object.languages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'name',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'networks',
      serializers.serialize(object.networks,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ProductionCompany)])),
      'number_of_episodes',
      serializers.serialize(object.numberOfEpisodes,
          specifiedType: const FullType(int)),
      'number_of_seasons',
      serializers.serialize(object.numberOfSeasons,
          specifiedType: const FullType(int)),
      'origin_country',
      serializers.serialize(object.originCountry,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'original_language',
      serializers.serialize(object.originalLanguage,
          specifiedType: const FullType(String)),
      'original_name',
      serializers.serialize(object.originalTitle,
          specifiedType: const FullType(String)),
      'overview',
      serializers.serialize(object.overview,
          specifiedType: const FullType(String)),
      'popularity',
      serializers.serialize(object.popularity,
          specifiedType: const FullType(double)),
      'production_companies',
      serializers.serialize(object.productionCompanies,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ProductionCompany)])),
      'seasons',
      serializers.serialize(object.seasons,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Season)])),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'similar',
      serializers.serialize(object.similar,
          specifiedType: const FullType(TvShowResult)),
    ];
    if (object.backdropPath != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(object.backdropPath,
            specifiedType: const FullType(String)));
    }
    if (object.releaseDate != null) {
      result
        ..add('last_air_date')
        ..add(serializers.serialize(object.releaseDate,
            specifiedType: const FullType(String)));
    }
    if (object.lastEpisodeToAir != null) {
      result
        ..add('last_episode_to_air')
        ..add(serializers.serialize(object.lastEpisodeToAir,
            specifiedType: const FullType(LastEpisodeToAir)));
    }
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TvShowDetails deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TvShowDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_by':
          result.createdBy.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CreatedBy)]))
              as BuiltList<dynamic>);
          break;
        case 'episode_run_time':
          result.episodeRunTime.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'first_air_date':
          result.firstAirDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genres':
          result.genres.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Genre)]))
              as BuiltList<dynamic>);
          break;
        case 'homepage':
          result.homepage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'in_production':
          result.inProduction = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'languages':
          result.languages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'last_air_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_episode_to_air':
          result.lastEpisodeToAir.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LastEpisodeToAir))
              as LastEpisodeToAir);
          break;
        case 'name':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'networks':
          result.networks.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductionCompany)]))
              as BuiltList<dynamic>);
          break;
        case 'number_of_episodes':
          result.numberOfEpisodes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'number_of_seasons':
          result.numberOfSeasons = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'origin_country':
          result.originCountry.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_name':
          result.originalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'production_companies':
          result.productionCompanies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductionCompany)]))
              as BuiltList<dynamic>);
          break;
        case 'seasons':
          result.seasons.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Season)]))
              as BuiltList<dynamic>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'similar':
          result.similar.replace(serializers.deserialize(value,
              specifiedType: const FullType(TvShowResult)) as TvShowResult);
          break;
      }
    }

    return result.build();
  }
}

class _$CreatedBySerializer implements StructuredSerializer<CreatedBy> {
  @override
  final Iterable<Type> types = const [CreatedBy, _$CreatedBy];
  @override
  final String wireName = 'CreatedBy';

  @override
  Iterable<Object> serialize(Serializers serializers, CreatedBy object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'credit_id',
      serializers.serialize(object.creditId,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'profile_path',
      serializers.serialize(object.profilePath,
          specifiedType: const FullType(String)),
    ];
    if (object.gender != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(object.gender,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CreatedBy deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreatedByBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'profile_path':
          result.profilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LastEpisodeToAirSerializer
    implements StructuredSerializer<LastEpisodeToAir> {
  @override
  final Iterable<Type> types = const [LastEpisodeToAir, _$LastEpisodeToAir];
  @override
  final String wireName = 'LastEpisodeToAir';

  @override
  Iterable<Object> serialize(Serializers serializers, LastEpisodeToAir object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'air_date',
      serializers.serialize(object.airDate,
          specifiedType: const FullType(String)),
      'episode_number',
      serializers.serialize(object.episodeNumber,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'overview',
      serializers.serialize(object.overview,
          specifiedType: const FullType(String)),
      'production_code',
      serializers.serialize(object.productionCode,
          specifiedType: const FullType(String)),
      'season_number',
      serializers.serialize(object.seasonNumber,
          specifiedType: const FullType(int)),
      'show_id',
      serializers.serialize(object.showId, specifiedType: const FullType(int)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
    ];
    if (object.stillPath != null) {
      result
        ..add('still_path')
        ..add(serializers.serialize(object.stillPath,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LastEpisodeToAir deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LastEpisodeToAirBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'air_date':
          result.airDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'episode_number':
          result.episodeNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'production_code':
          result.productionCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'season_number':
          result.seasonNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'show_id':
          result.showId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'still_path':
          result.stillPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SeasonSerializer implements StructuredSerializer<Season> {
  @override
  final Iterable<Type> types = const [Season, _$Season];
  @override
  final String wireName = 'Season';

  @override
  Iterable<Object> serialize(Serializers serializers, Season object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'episode_count',
      serializers.serialize(object.episodeCount,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'overview',
      serializers.serialize(object.overview,
          specifiedType: const FullType(String)),
      'season_number',
      serializers.serialize(object.seasonNumber,
          specifiedType: const FullType(int)),
    ];
    if (object.airDate != null) {
      result
        ..add('air_date')
        ..add(serializers.serialize(object.airDate,
            specifiedType: const FullType(String)));
    }
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Season deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeasonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'air_date':
          result.airDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'episode_count':
          result.episodeCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'season_number':
          result.seasonNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TvShowResult extends TvShowResult {
  @override
  final int page;
  @override
  final BuiltList<TvShow> results;
  @override
  final int totalResults;
  @override
  final int totalPages;

  factory _$TvShowResult([void Function(TvShowResultBuilder) updates]) =>
      (new TvShowResultBuilder()..update(updates)).build();

  _$TvShowResult._(
      {this.page, this.results, this.totalResults, this.totalPages})
      : super._() {
    if (page == null) {
      throw new BuiltValueNullFieldError('TvShowResult', 'page');
    }
    if (results == null) {
      throw new BuiltValueNullFieldError('TvShowResult', 'results');
    }
    if (totalResults == null) {
      throw new BuiltValueNullFieldError('TvShowResult', 'totalResults');
    }
    if (totalPages == null) {
      throw new BuiltValueNullFieldError('TvShowResult', 'totalPages');
    }
  }

  @override
  TvShowResult rebuild(void Function(TvShowResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TvShowResultBuilder toBuilder() => new TvShowResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TvShowResult &&
        page == other.page &&
        results == other.results &&
        totalResults == other.totalResults &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, page.hashCode), results.hashCode),
            totalResults.hashCode),
        totalPages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TvShowResult')
          ..add('page', page)
          ..add('results', results)
          ..add('totalResults', totalResults)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class TvShowResultBuilder
    implements Builder<TvShowResult, TvShowResultBuilder> {
  _$TvShowResult _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  ListBuilder<TvShow> _results;
  ListBuilder<TvShow> get results =>
      _$this._results ??= new ListBuilder<TvShow>();
  set results(ListBuilder<TvShow> results) => _$this._results = results;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  TvShowResultBuilder();

  TvShowResultBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _results = _$v.results?.toBuilder();
      _totalResults = _$v.totalResults;
      _totalPages = _$v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TvShowResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TvShowResult;
  }

  @override
  void update(void Function(TvShowResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TvShowResult build() {
    _$TvShowResult _$result;
    try {
      _$result = _$v ??
          new _$TvShowResult._(
              page: page,
              results: results.build(),
              totalResults: totalResults,
              totalPages: totalPages);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TvShowResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TvShow extends TvShow {
  @override
  final String posterPath;
  @override
  final double popularity;
  @override
  final int id;
  @override
  final String backdropPath;
  @override
  final double voteAverage;
  @override
  final String overview;
  @override
  final String releaseDate;
  @override
  final BuiltList<String> originCountry;
  @override
  final BuiltList<int> genreIds;
  @override
  final String originalLanguage;
  @override
  final int voteCount;
  @override
  final String title;
  @override
  final String originalTitle;

  factory _$TvShow([void Function(TvShowBuilder) updates]) =>
      (new TvShowBuilder()..update(updates)).build();

  _$TvShow._(
      {this.posterPath,
      this.popularity,
      this.id,
      this.backdropPath,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.originCountry,
      this.genreIds,
      this.originalLanguage,
      this.voteCount,
      this.title,
      this.originalTitle})
      : super._() {
    if (popularity == null) {
      throw new BuiltValueNullFieldError('TvShow', 'popularity');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('TvShow', 'id');
    }
    if (voteAverage == null) {
      throw new BuiltValueNullFieldError('TvShow', 'voteAverage');
    }
    if (overview == null) {
      throw new BuiltValueNullFieldError('TvShow', 'overview');
    }
    if (originCountry == null) {
      throw new BuiltValueNullFieldError('TvShow', 'originCountry');
    }
    if (genreIds == null) {
      throw new BuiltValueNullFieldError('TvShow', 'genreIds');
    }
    if (originalLanguage == null) {
      throw new BuiltValueNullFieldError('TvShow', 'originalLanguage');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('TvShow', 'voteCount');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('TvShow', 'title');
    }
    if (originalTitle == null) {
      throw new BuiltValueNullFieldError('TvShow', 'originalTitle');
    }
  }

  @override
  TvShow rebuild(void Function(TvShowBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TvShowBuilder toBuilder() => new TvShowBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TvShow &&
        posterPath == other.posterPath &&
        popularity == other.popularity &&
        id == other.id &&
        backdropPath == other.backdropPath &&
        voteAverage == other.voteAverage &&
        overview == other.overview &&
        releaseDate == other.releaseDate &&
        originCountry == other.originCountry &&
        genreIds == other.genreIds &&
        originalLanguage == other.originalLanguage &&
        voteCount == other.voteCount &&
        title == other.title &&
        originalTitle == other.originalTitle;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, posterPath.hashCode),
                                                    popularity.hashCode),
                                                id.hashCode),
                                            backdropPath.hashCode),
                                        voteAverage.hashCode),
                                    overview.hashCode),
                                releaseDate.hashCode),
                            originCountry.hashCode),
                        genreIds.hashCode),
                    originalLanguage.hashCode),
                voteCount.hashCode),
            title.hashCode),
        originalTitle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TvShow')
          ..add('posterPath', posterPath)
          ..add('popularity', popularity)
          ..add('id', id)
          ..add('backdropPath', backdropPath)
          ..add('voteAverage', voteAverage)
          ..add('overview', overview)
          ..add('releaseDate', releaseDate)
          ..add('originCountry', originCountry)
          ..add('genreIds', genreIds)
          ..add('originalLanguage', originalLanguage)
          ..add('voteCount', voteCount)
          ..add('title', title)
          ..add('originalTitle', originalTitle))
        .toString();
  }
}

class TvShowBuilder implements Builder<TvShow, TvShowBuilder> {
  _$TvShow _$v;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  double _popularity;
  double get popularity => _$this._popularity;
  set popularity(double popularity) => _$this._popularity = popularity;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  ListBuilder<String> _originCountry;
  ListBuilder<String> get originCountry =>
      _$this._originCountry ??= new ListBuilder<String>();
  set originCountry(ListBuilder<String> originCountry) =>
      _$this._originCountry = originCountry;

  ListBuilder<int> _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int> genreIds) => _$this._genreIds = genreIds;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  TvShowBuilder();

  TvShowBuilder get _$this {
    if (_$v != null) {
      _posterPath = _$v.posterPath;
      _popularity = _$v.popularity;
      _id = _$v.id;
      _backdropPath = _$v.backdropPath;
      _voteAverage = _$v.voteAverage;
      _overview = _$v.overview;
      _releaseDate = _$v.releaseDate;
      _originCountry = _$v.originCountry?.toBuilder();
      _genreIds = _$v.genreIds?.toBuilder();
      _originalLanguage = _$v.originalLanguage;
      _voteCount = _$v.voteCount;
      _title = _$v.title;
      _originalTitle = _$v.originalTitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TvShow other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TvShow;
  }

  @override
  void update(void Function(TvShowBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TvShow build() {
    _$TvShow _$result;
    try {
      _$result = _$v ??
          new _$TvShow._(
              posterPath: posterPath,
              popularity: popularity,
              id: id,
              backdropPath: backdropPath,
              voteAverage: voteAverage,
              overview: overview,
              releaseDate: releaseDate,
              originCountry: originCountry.build(),
              genreIds: genreIds.build(),
              originalLanguage: originalLanguage,
              voteCount: voteCount,
              title: title,
              originalTitle: originalTitle);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'originCountry';
        originCountry.build();
        _$failedField = 'genreIds';
        genreIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TvShow', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TvShowDetails extends TvShowDetails {
  @override
  final String backdropPath;
  @override
  final BuiltList<CreatedBy> createdBy;
  @override
  final BuiltList<int> episodeRunTime;
  @override
  final String firstAirDate;
  @override
  final BuiltList<Genre> genres;
  @override
  final String homepage;
  @override
  final int id;
  @override
  final bool inProduction;
  @override
  final BuiltList<String> languages;
  @override
  final String releaseDate;
  @override
  final LastEpisodeToAir lastEpisodeToAir;
  @override
  final String title;
  @override
  final BuiltList<ProductionCompany> networks;
  @override
  final int numberOfEpisodes;
  @override
  final int numberOfSeasons;
  @override
  final BuiltList<String> originCountry;
  @override
  final String originalLanguage;
  @override
  final String originalTitle;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  final String posterPath;
  @override
  final BuiltList<ProductionCompany> productionCompanies;
  @override
  final BuiltList<Season> seasons;
  @override
  final String status;
  @override
  final String type;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  @override
  final TvShowResult similar;

  factory _$TvShowDetails([void Function(TvShowDetailsBuilder) updates]) =>
      (new TvShowDetailsBuilder()..update(updates)).build();

  _$TvShowDetails._(
      {this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.releaseDate,
      this.lastEpisodeToAir,
      this.title,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.seasons,
      this.status,
      this.type,
      this.voteAverage,
      this.voteCount,
      this.similar})
      : super._() {
    if (createdBy == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'createdBy');
    }
    if (episodeRunTime == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'episodeRunTime');
    }
    if (firstAirDate == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'firstAirDate');
    }
    if (genres == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'genres');
    }
    if (homepage == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'homepage');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'id');
    }
    if (inProduction == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'inProduction');
    }
    if (languages == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'languages');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'title');
    }
    if (networks == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'networks');
    }
    if (numberOfEpisodes == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'numberOfEpisodes');
    }
    if (numberOfSeasons == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'numberOfSeasons');
    }
    if (originCountry == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'originCountry');
    }
    if (originalLanguage == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'originalLanguage');
    }
    if (originalTitle == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'originalTitle');
    }
    if (overview == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'overview');
    }
    if (popularity == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'popularity');
    }
    if (productionCompanies == null) {
      throw new BuiltValueNullFieldError(
          'TvShowDetails', 'productionCompanies');
    }
    if (seasons == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'seasons');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'status');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'type');
    }
    if (voteAverage == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'voteAverage');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'voteCount');
    }
    if (similar == null) {
      throw new BuiltValueNullFieldError('TvShowDetails', 'similar');
    }
  }

  @override
  TvShowDetails rebuild(void Function(TvShowDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TvShowDetailsBuilder toBuilder() => new TvShowDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TvShowDetails &&
        backdropPath == other.backdropPath &&
        createdBy == other.createdBy &&
        episodeRunTime == other.episodeRunTime &&
        firstAirDate == other.firstAirDate &&
        genres == other.genres &&
        homepage == other.homepage &&
        id == other.id &&
        inProduction == other.inProduction &&
        languages == other.languages &&
        releaseDate == other.releaseDate &&
        lastEpisodeToAir == other.lastEpisodeToAir &&
        title == other.title &&
        networks == other.networks &&
        numberOfEpisodes == other.numberOfEpisodes &&
        numberOfSeasons == other.numberOfSeasons &&
        originCountry == other.originCountry &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        overview == other.overview &&
        popularity == other.popularity &&
        posterPath == other.posterPath &&
        productionCompanies == other.productionCompanies &&
        seasons == other.seasons &&
        status == other.status &&
        type == other.type &&
        voteAverage == other.voteAverage &&
        voteCount == other.voteCount &&
        similar == other.similar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, backdropPath.hashCode), createdBy.hashCode), episodeRunTime.hashCode), firstAirDate.hashCode), genres.hashCode), homepage.hashCode), id.hashCode), inProduction.hashCode), languages.hashCode),
                                                                                releaseDate.hashCode),
                                                                            lastEpisodeToAir.hashCode),
                                                                        title.hashCode),
                                                                    networks.hashCode),
                                                                numberOfEpisodes.hashCode),
                                                            numberOfSeasons.hashCode),
                                                        originCountry.hashCode),
                                                    originalLanguage.hashCode),
                                                originalTitle.hashCode),
                                            overview.hashCode),
                                        popularity.hashCode),
                                    posterPath.hashCode),
                                productionCompanies.hashCode),
                            seasons.hashCode),
                        status.hashCode),
                    type.hashCode),
                voteAverage.hashCode),
            voteCount.hashCode),
        similar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TvShowDetails')
          ..add('backdropPath', backdropPath)
          ..add('createdBy', createdBy)
          ..add('episodeRunTime', episodeRunTime)
          ..add('firstAirDate', firstAirDate)
          ..add('genres', genres)
          ..add('homepage', homepage)
          ..add('id', id)
          ..add('inProduction', inProduction)
          ..add('languages', languages)
          ..add('releaseDate', releaseDate)
          ..add('lastEpisodeToAir', lastEpisodeToAir)
          ..add('title', title)
          ..add('networks', networks)
          ..add('numberOfEpisodes', numberOfEpisodes)
          ..add('numberOfSeasons', numberOfSeasons)
          ..add('originCountry', originCountry)
          ..add('originalLanguage', originalLanguage)
          ..add('originalTitle', originalTitle)
          ..add('overview', overview)
          ..add('popularity', popularity)
          ..add('posterPath', posterPath)
          ..add('productionCompanies', productionCompanies)
          ..add('seasons', seasons)
          ..add('status', status)
          ..add('type', type)
          ..add('voteAverage', voteAverage)
          ..add('voteCount', voteCount)
          ..add('similar', similar))
        .toString();
  }
}

class TvShowDetailsBuilder
    implements Builder<TvShowDetails, TvShowDetailsBuilder> {
  _$TvShowDetails _$v;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  ListBuilder<CreatedBy> _createdBy;
  ListBuilder<CreatedBy> get createdBy =>
      _$this._createdBy ??= new ListBuilder<CreatedBy>();
  set createdBy(ListBuilder<CreatedBy> createdBy) =>
      _$this._createdBy = createdBy;

  ListBuilder<int> _episodeRunTime;
  ListBuilder<int> get episodeRunTime =>
      _$this._episodeRunTime ??= new ListBuilder<int>();
  set episodeRunTime(ListBuilder<int> episodeRunTime) =>
      _$this._episodeRunTime = episodeRunTime;

  String _firstAirDate;
  String get firstAirDate => _$this._firstAirDate;
  set firstAirDate(String firstAirDate) => _$this._firstAirDate = firstAirDate;

  ListBuilder<Genre> _genres;
  ListBuilder<Genre> get genres => _$this._genres ??= new ListBuilder<Genre>();
  set genres(ListBuilder<Genre> genres) => _$this._genres = genres;

  String _homepage;
  String get homepage => _$this._homepage;
  set homepage(String homepage) => _$this._homepage = homepage;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  bool _inProduction;
  bool get inProduction => _$this._inProduction;
  set inProduction(bool inProduction) => _$this._inProduction = inProduction;

  ListBuilder<String> _languages;
  ListBuilder<String> get languages =>
      _$this._languages ??= new ListBuilder<String>();
  set languages(ListBuilder<String> languages) => _$this._languages = languages;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  LastEpisodeToAirBuilder _lastEpisodeToAir;
  LastEpisodeToAirBuilder get lastEpisodeToAir =>
      _$this._lastEpisodeToAir ??= new LastEpisodeToAirBuilder();
  set lastEpisodeToAir(LastEpisodeToAirBuilder lastEpisodeToAir) =>
      _$this._lastEpisodeToAir = lastEpisodeToAir;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ListBuilder<ProductionCompany> _networks;
  ListBuilder<ProductionCompany> get networks =>
      _$this._networks ??= new ListBuilder<ProductionCompany>();
  set networks(ListBuilder<ProductionCompany> networks) =>
      _$this._networks = networks;

  int _numberOfEpisodes;
  int get numberOfEpisodes => _$this._numberOfEpisodes;
  set numberOfEpisodes(int numberOfEpisodes) =>
      _$this._numberOfEpisodes = numberOfEpisodes;

  int _numberOfSeasons;
  int get numberOfSeasons => _$this._numberOfSeasons;
  set numberOfSeasons(int numberOfSeasons) =>
      _$this._numberOfSeasons = numberOfSeasons;

  ListBuilder<String> _originCountry;
  ListBuilder<String> get originCountry =>
      _$this._originCountry ??= new ListBuilder<String>();
  set originCountry(ListBuilder<String> originCountry) =>
      _$this._originCountry = originCountry;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  double _popularity;
  double get popularity => _$this._popularity;
  set popularity(double popularity) => _$this._popularity = popularity;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  ListBuilder<ProductionCompany> _productionCompanies;
  ListBuilder<ProductionCompany> get productionCompanies =>
      _$this._productionCompanies ??= new ListBuilder<ProductionCompany>();
  set productionCompanies(ListBuilder<ProductionCompany> productionCompanies) =>
      _$this._productionCompanies = productionCompanies;

  ListBuilder<Season> _seasons;
  ListBuilder<Season> get seasons =>
      _$this._seasons ??= new ListBuilder<Season>();
  set seasons(ListBuilder<Season> seasons) => _$this._seasons = seasons;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  TvShowResultBuilder _similar;
  TvShowResultBuilder get similar =>
      _$this._similar ??= new TvShowResultBuilder();
  set similar(TvShowResultBuilder similar) => _$this._similar = similar;

  TvShowDetailsBuilder();

  TvShowDetailsBuilder get _$this {
    if (_$v != null) {
      _backdropPath = _$v.backdropPath;
      _createdBy = _$v.createdBy?.toBuilder();
      _episodeRunTime = _$v.episodeRunTime?.toBuilder();
      _firstAirDate = _$v.firstAirDate;
      _genres = _$v.genres?.toBuilder();
      _homepage = _$v.homepage;
      _id = _$v.id;
      _inProduction = _$v.inProduction;
      _languages = _$v.languages?.toBuilder();
      _releaseDate = _$v.releaseDate;
      _lastEpisodeToAir = _$v.lastEpisodeToAir?.toBuilder();
      _title = _$v.title;
      _networks = _$v.networks?.toBuilder();
      _numberOfEpisodes = _$v.numberOfEpisodes;
      _numberOfSeasons = _$v.numberOfSeasons;
      _originCountry = _$v.originCountry?.toBuilder();
      _originalLanguage = _$v.originalLanguage;
      _originalTitle = _$v.originalTitle;
      _overview = _$v.overview;
      _popularity = _$v.popularity;
      _posterPath = _$v.posterPath;
      _productionCompanies = _$v.productionCompanies?.toBuilder();
      _seasons = _$v.seasons?.toBuilder();
      _status = _$v.status;
      _type = _$v.type;
      _voteAverage = _$v.voteAverage;
      _voteCount = _$v.voteCount;
      _similar = _$v.similar?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TvShowDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TvShowDetails;
  }

  @override
  void update(void Function(TvShowDetailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TvShowDetails build() {
    _$TvShowDetails _$result;
    try {
      _$result = _$v ??
          new _$TvShowDetails._(
              backdropPath: backdropPath,
              createdBy: createdBy.build(),
              episodeRunTime: episodeRunTime.build(),
              firstAirDate: firstAirDate,
              genres: genres.build(),
              homepage: homepage,
              id: id,
              inProduction: inProduction,
              languages: languages.build(),
              releaseDate: releaseDate,
              lastEpisodeToAir: _lastEpisodeToAir?.build(),
              title: title,
              networks: networks.build(),
              numberOfEpisodes: numberOfEpisodes,
              numberOfSeasons: numberOfSeasons,
              originCountry: originCountry.build(),
              originalLanguage: originalLanguage,
              originalTitle: originalTitle,
              overview: overview,
              popularity: popularity,
              posterPath: posterPath,
              productionCompanies: productionCompanies.build(),
              seasons: seasons.build(),
              status: status,
              type: type,
              voteAverage: voteAverage,
              voteCount: voteCount,
              similar: similar.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'createdBy';
        createdBy.build();
        _$failedField = 'episodeRunTime';
        episodeRunTime.build();

        _$failedField = 'genres';
        genres.build();

        _$failedField = 'languages';
        languages.build();

        _$failedField = 'lastEpisodeToAir';
        _lastEpisodeToAir?.build();

        _$failedField = 'networks';
        networks.build();

        _$failedField = 'originCountry';
        originCountry.build();

        _$failedField = 'productionCompanies';
        productionCompanies.build();
        _$failedField = 'seasons';
        seasons.build();

        _$failedField = 'similar';
        similar.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TvShowDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CreatedBy extends CreatedBy {
  @override
  final int id;
  @override
  final String creditId;
  @override
  final String name;
  @override
  final int gender;
  @override
  final String profilePath;

  factory _$CreatedBy([void Function(CreatedByBuilder) updates]) =>
      (new CreatedByBuilder()..update(updates)).build();

  _$CreatedBy._(
      {this.id, this.creditId, this.name, this.gender, this.profilePath})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('CreatedBy', 'id');
    }
    if (creditId == null) {
      throw new BuiltValueNullFieldError('CreatedBy', 'creditId');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('CreatedBy', 'name');
    }
    if (profilePath == null) {
      throw new BuiltValueNullFieldError('CreatedBy', 'profilePath');
    }
  }

  @override
  CreatedBy rebuild(void Function(CreatedByBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatedByBuilder toBuilder() => new CreatedByBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatedBy &&
        id == other.id &&
        creditId == other.creditId &&
        name == other.name &&
        gender == other.gender &&
        profilePath == other.profilePath;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), creditId.hashCode), name.hashCode),
            gender.hashCode),
        profilePath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreatedBy')
          ..add('id', id)
          ..add('creditId', creditId)
          ..add('name', name)
          ..add('gender', gender)
          ..add('profilePath', profilePath))
        .toString();
  }
}

class CreatedByBuilder implements Builder<CreatedBy, CreatedByBuilder> {
  _$CreatedBy _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _creditId;
  String get creditId => _$this._creditId;
  set creditId(String creditId) => _$this._creditId = creditId;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  String _profilePath;
  String get profilePath => _$this._profilePath;
  set profilePath(String profilePath) => _$this._profilePath = profilePath;

  CreatedByBuilder();

  CreatedByBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _creditId = _$v.creditId;
      _name = _$v.name;
      _gender = _$v.gender;
      _profilePath = _$v.profilePath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatedBy other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreatedBy;
  }

  @override
  void update(void Function(CreatedByBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreatedBy build() {
    final _$result = _$v ??
        new _$CreatedBy._(
            id: id,
            creditId: creditId,
            name: name,
            gender: gender,
            profilePath: profilePath);
    replace(_$result);
    return _$result;
  }
}

class _$LastEpisodeToAir extends LastEpisodeToAir {
  @override
  final String airDate;
  @override
  final int episodeNumber;
  @override
  final int id;
  @override
  final String name;
  @override
  final String overview;
  @override
  final String productionCode;
  @override
  final int seasonNumber;
  @override
  final int showId;
  @override
  final String stillPath;
  @override
  final double voteAverage;
  @override
  final int voteCount;

  factory _$LastEpisodeToAir(
          [void Function(LastEpisodeToAirBuilder) updates]) =>
      (new LastEpisodeToAirBuilder()..update(updates)).build();

  _$LastEpisodeToAir._(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.seasonNumber,
      this.showId,
      this.stillPath,
      this.voteAverage,
      this.voteCount})
      : super._() {
    if (airDate == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'airDate');
    }
    if (episodeNumber == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'episodeNumber');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'name');
    }
    if (overview == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'overview');
    }
    if (productionCode == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'productionCode');
    }
    if (seasonNumber == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'seasonNumber');
    }
    if (showId == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'showId');
    }
    if (voteAverage == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'voteAverage');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('LastEpisodeToAir', 'voteCount');
    }
  }

  @override
  LastEpisodeToAir rebuild(void Function(LastEpisodeToAirBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LastEpisodeToAirBuilder toBuilder() =>
      new LastEpisodeToAirBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LastEpisodeToAir &&
        airDate == other.airDate &&
        episodeNumber == other.episodeNumber &&
        id == other.id &&
        name == other.name &&
        overview == other.overview &&
        productionCode == other.productionCode &&
        seasonNumber == other.seasonNumber &&
        showId == other.showId &&
        stillPath == other.stillPath &&
        voteAverage == other.voteAverage &&
        voteCount == other.voteCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, airDate.hashCode),
                                            episodeNumber.hashCode),
                                        id.hashCode),
                                    name.hashCode),
                                overview.hashCode),
                            productionCode.hashCode),
                        seasonNumber.hashCode),
                    showId.hashCode),
                stillPath.hashCode),
            voteAverage.hashCode),
        voteCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LastEpisodeToAir')
          ..add('airDate', airDate)
          ..add('episodeNumber', episodeNumber)
          ..add('id', id)
          ..add('name', name)
          ..add('overview', overview)
          ..add('productionCode', productionCode)
          ..add('seasonNumber', seasonNumber)
          ..add('showId', showId)
          ..add('stillPath', stillPath)
          ..add('voteAverage', voteAverage)
          ..add('voteCount', voteCount))
        .toString();
  }
}

class LastEpisodeToAirBuilder
    implements Builder<LastEpisodeToAir, LastEpisodeToAirBuilder> {
  _$LastEpisodeToAir _$v;

  String _airDate;
  String get airDate => _$this._airDate;
  set airDate(String airDate) => _$this._airDate = airDate;

  int _episodeNumber;
  int get episodeNumber => _$this._episodeNumber;
  set episodeNumber(int episodeNumber) => _$this._episodeNumber = episodeNumber;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  String _productionCode;
  String get productionCode => _$this._productionCode;
  set productionCode(String productionCode) =>
      _$this._productionCode = productionCode;

  int _seasonNumber;
  int get seasonNumber => _$this._seasonNumber;
  set seasonNumber(int seasonNumber) => _$this._seasonNumber = seasonNumber;

  int _showId;
  int get showId => _$this._showId;
  set showId(int showId) => _$this._showId = showId;

  String _stillPath;
  String get stillPath => _$this._stillPath;
  set stillPath(String stillPath) => _$this._stillPath = stillPath;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  LastEpisodeToAirBuilder();

  LastEpisodeToAirBuilder get _$this {
    if (_$v != null) {
      _airDate = _$v.airDate;
      _episodeNumber = _$v.episodeNumber;
      _id = _$v.id;
      _name = _$v.name;
      _overview = _$v.overview;
      _productionCode = _$v.productionCode;
      _seasonNumber = _$v.seasonNumber;
      _showId = _$v.showId;
      _stillPath = _$v.stillPath;
      _voteAverage = _$v.voteAverage;
      _voteCount = _$v.voteCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LastEpisodeToAir other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LastEpisodeToAir;
  }

  @override
  void update(void Function(LastEpisodeToAirBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LastEpisodeToAir build() {
    final _$result = _$v ??
        new _$LastEpisodeToAir._(
            airDate: airDate,
            episodeNumber: episodeNumber,
            id: id,
            name: name,
            overview: overview,
            productionCode: productionCode,
            seasonNumber: seasonNumber,
            showId: showId,
            stillPath: stillPath,
            voteAverage: voteAverage,
            voteCount: voteCount);
    replace(_$result);
    return _$result;
  }
}

class _$Season extends Season {
  @override
  final String airDate;
  @override
  final int episodeCount;
  @override
  final int id;
  @override
  final String name;
  @override
  final String overview;
  @override
  final String posterPath;
  @override
  final int seasonNumber;

  factory _$Season([void Function(SeasonBuilder) updates]) =>
      (new SeasonBuilder()..update(updates)).build();

  _$Season._(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber})
      : super._() {
    if (episodeCount == null) {
      throw new BuiltValueNullFieldError('Season', 'episodeCount');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Season', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Season', 'name');
    }
    if (overview == null) {
      throw new BuiltValueNullFieldError('Season', 'overview');
    }
    if (seasonNumber == null) {
      throw new BuiltValueNullFieldError('Season', 'seasonNumber');
    }
  }

  @override
  Season rebuild(void Function(SeasonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeasonBuilder toBuilder() => new SeasonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Season &&
        airDate == other.airDate &&
        episodeCount == other.episodeCount &&
        id == other.id &&
        name == other.name &&
        overview == other.overview &&
        posterPath == other.posterPath &&
        seasonNumber == other.seasonNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, airDate.hashCode), episodeCount.hashCode),
                        id.hashCode),
                    name.hashCode),
                overview.hashCode),
            posterPath.hashCode),
        seasonNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Season')
          ..add('airDate', airDate)
          ..add('episodeCount', episodeCount)
          ..add('id', id)
          ..add('name', name)
          ..add('overview', overview)
          ..add('posterPath', posterPath)
          ..add('seasonNumber', seasonNumber))
        .toString();
  }
}

class SeasonBuilder implements Builder<Season, SeasonBuilder> {
  _$Season _$v;

  String _airDate;
  String get airDate => _$this._airDate;
  set airDate(String airDate) => _$this._airDate = airDate;

  int _episodeCount;
  int get episodeCount => _$this._episodeCount;
  set episodeCount(int episodeCount) => _$this._episodeCount = episodeCount;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  int _seasonNumber;
  int get seasonNumber => _$this._seasonNumber;
  set seasonNumber(int seasonNumber) => _$this._seasonNumber = seasonNumber;

  SeasonBuilder();

  SeasonBuilder get _$this {
    if (_$v != null) {
      _airDate = _$v.airDate;
      _episodeCount = _$v.episodeCount;
      _id = _$v.id;
      _name = _$v.name;
      _overview = _$v.overview;
      _posterPath = _$v.posterPath;
      _seasonNumber = _$v.seasonNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Season other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Season;
  }

  @override
  void update(void Function(SeasonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Season build() {
    final _$result = _$v ??
        new _$Season._(
            airDate: airDate,
            episodeCount: episodeCount,
            id: id,
            name: name,
            overview: overview,
            posterPath: posterPath,
            seasonNumber: seasonNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
