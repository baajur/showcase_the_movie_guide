// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FilmResult> _$filmResultSerializer = new _$FilmResultSerializer();
Serializer<Film> _$filmSerializer = new _$FilmSerializer();
Serializer<FilmDetails> _$filmDetailsSerializer = new _$FilmDetailsSerializer();

class _$FilmResultSerializer implements StructuredSerializer<FilmResult> {
  @override
  final Iterable<Type> types = const [FilmResult, _$FilmResult];
  @override
  final String wireName = 'FilmResult';

  @override
  Iterable<Object> serialize(Serializers serializers, FilmResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Film)])),
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
  FilmResult deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FilmResultBuilder();

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
                      const FullType(BuiltList, const [const FullType(Film)]))
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

class _$FilmSerializer implements StructuredSerializer<Film> {
  @override
  final Iterable<Type> types = const [Film, _$Film];
  @override
  final String wireName = 'Film';

  @override
  Iterable<Object> serialize(Serializers serializers, Film object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'adult',
      serializers.serialize(object.adult, specifiedType: const FullType(bool)),
      'overview',
      serializers.serialize(object.overview,
          specifiedType: const FullType(String)),
      'genre_ids',
      serializers.serialize(object.genreIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'original_title',
      serializers.serialize(object.originalTitle,
          specifiedType: const FullType(String)),
      'original_language',
      serializers.serialize(object.originalLanguage,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'popularity',
      serializers.serialize(object.popularity,
          specifiedType: const FullType(double)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'video',
      serializers.serialize(object.video, specifiedType: const FullType(bool)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
    ];
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    if (object.releaseDate != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(object.releaseDate,
            specifiedType: const FullType(String)));
    }
    if (object.backdropPath != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(object.backdropPath,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Film deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FilmBuilder();

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
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'original_title':
          result.originalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$FilmDetailsSerializer implements StructuredSerializer<FilmDetails> {
  @override
  final Iterable<Type> types = const [FilmDetails, _$FilmDetails];
  @override
  final String wireName = 'FilmDetails';

  @override
  Iterable<Object> serialize(Serializers serializers, FilmDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'adult',
      serializers.serialize(object.adult, specifiedType: const FullType(bool)),
      'budget',
      serializers.serialize(object.budget, specifiedType: const FullType(int)),
      'genres',
      serializers.serialize(object.genres,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Genre)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'original_language',
      serializers.serialize(object.originalLanguage,
          specifiedType: const FullType(String)),
      'original_title',
      serializers.serialize(object.originalTitle,
          specifiedType: const FullType(String)),
      'popularity',
      serializers.serialize(object.popularity,
          specifiedType: const FullType(double)),
      'production_companies',
      serializers.serialize(object.productionCompanies,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ProductionCompany)])),
      'production_countries',
      serializers.serialize(object.productionCountries,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ProductionCountry)])),
      'revenue',
      serializers.serialize(object.revenue, specifiedType: const FullType(int)),
      'spoken_languages',
      serializers.serialize(object.spokenLanguages,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SpokenLanguage)])),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'video',
      serializers.serialize(object.video, specifiedType: const FullType(bool)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'similar',
      serializers.serialize(object.similar,
          specifiedType: const FullType(FilmResult)),
    ];
    if (object.backdropPath != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(object.backdropPath,
            specifiedType: const FullType(String)));
    }
    if (object.homepage != null) {
      result
        ..add('homepage')
        ..add(serializers.serialize(object.homepage,
            specifiedType: const FullType(String)));
    }
    if (object.imdbId != null) {
      result
        ..add('imdb_id')
        ..add(serializers.serialize(object.imdbId,
            specifiedType: const FullType(String)));
    }
    if (object.overview != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(object.overview,
            specifiedType: const FullType(String)));
    }
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    if (object.releaseDate != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(object.releaseDate,
            specifiedType: const FullType(String)));
    }
    if (object.runtime != null) {
      result
        ..add('runtime')
        ..add(serializers.serialize(object.runtime,
            specifiedType: const FullType(int)));
    }
    if (object.tagline != null) {
      result
        ..add('tagline')
        ..add(serializers.serialize(object.tagline,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FilmDetails deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FilmDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'budget':
          result.budget = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
        case 'imdb_id':
          result.imdbId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_title':
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
        case 'production_countries':
          result.productionCountries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductionCountry)]))
              as BuiltList<dynamic>);
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'revenue':
          result.revenue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'spoken_languages':
          result.spokenLanguages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SpokenLanguage)]))
              as BuiltList<dynamic>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tagline':
          result.tagline = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
              specifiedType: const FullType(FilmResult)) as FilmResult);
          break;
      }
    }

    return result.build();
  }
}

class _$FilmResult extends FilmResult {
  @override
  final int page;
  @override
  final BuiltList<Film> results;
  @override
  final int totalResults;
  @override
  final int totalPages;

  factory _$FilmResult([void Function(FilmResultBuilder) updates]) =>
      (new FilmResultBuilder()..update(updates)).build();

  _$FilmResult._({this.page, this.results, this.totalResults, this.totalPages})
      : super._() {
    if (page == null) {
      throw new BuiltValueNullFieldError('FilmResult', 'page');
    }
    if (results == null) {
      throw new BuiltValueNullFieldError('FilmResult', 'results');
    }
    if (totalResults == null) {
      throw new BuiltValueNullFieldError('FilmResult', 'totalResults');
    }
    if (totalPages == null) {
      throw new BuiltValueNullFieldError('FilmResult', 'totalPages');
    }
  }

  @override
  FilmResult rebuild(void Function(FilmResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilmResultBuilder toBuilder() => new FilmResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilmResult &&
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
    return (newBuiltValueToStringHelper('FilmResult')
          ..add('page', page)
          ..add('results', results)
          ..add('totalResults', totalResults)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class FilmResultBuilder implements Builder<FilmResult, FilmResultBuilder> {
  _$FilmResult _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  ListBuilder<Film> _results;
  ListBuilder<Film> get results => _$this._results ??= new ListBuilder<Film>();
  set results(ListBuilder<Film> results) => _$this._results = results;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  FilmResultBuilder();

  FilmResultBuilder get _$this {
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
  void replace(FilmResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FilmResult;
  }

  @override
  void update(void Function(FilmResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FilmResult build() {
    _$FilmResult _$result;
    try {
      _$result = _$v ??
          new _$FilmResult._(
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
            'FilmResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Film extends Film {
  @override
  final String posterPath;
  @override
  final bool adult;
  @override
  final String overview;
  @override
  final String releaseDate;
  @override
  final BuiltList<int> genreIds;
  @override
  final int id;
  @override
  final String originalTitle;
  @override
  final String originalLanguage;
  @override
  final String title;
  @override
  final String backdropPath;
  @override
  final double popularity;
  @override
  final int voteCount;
  @override
  final bool video;
  @override
  final double voteAverage;

  factory _$Film([void Function(FilmBuilder) updates]) =>
      (new FilmBuilder()..update(updates)).build();

  _$Film._(
      {this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage})
      : super._() {
    if (adult == null) {
      throw new BuiltValueNullFieldError('Film', 'adult');
    }
    if (overview == null) {
      throw new BuiltValueNullFieldError('Film', 'overview');
    }
    if (genreIds == null) {
      throw new BuiltValueNullFieldError('Film', 'genreIds');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Film', 'id');
    }
    if (originalTitle == null) {
      throw new BuiltValueNullFieldError('Film', 'originalTitle');
    }
    if (originalLanguage == null) {
      throw new BuiltValueNullFieldError('Film', 'originalLanguage');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Film', 'title');
    }
    if (popularity == null) {
      throw new BuiltValueNullFieldError('Film', 'popularity');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('Film', 'voteCount');
    }
    if (video == null) {
      throw new BuiltValueNullFieldError('Film', 'video');
    }
    if (voteAverage == null) {
      throw new BuiltValueNullFieldError('Film', 'voteAverage');
    }
  }

  @override
  Film rebuild(void Function(FilmBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilmBuilder toBuilder() => new FilmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Film &&
        posterPath == other.posterPath &&
        adult == other.adult &&
        overview == other.overview &&
        releaseDate == other.releaseDate &&
        genreIds == other.genreIds &&
        id == other.id &&
        originalTitle == other.originalTitle &&
        originalLanguage == other.originalLanguage &&
        title == other.title &&
        backdropPath == other.backdropPath &&
        popularity == other.popularity &&
        voteCount == other.voteCount &&
        video == other.video &&
        voteAverage == other.voteAverage;
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
                                                            0,
                                                            posterPath
                                                                .hashCode),
                                                        adult.hashCode),
                                                    overview.hashCode),
                                                releaseDate.hashCode),
                                            genreIds.hashCode),
                                        id.hashCode),
                                    originalTitle.hashCode),
                                originalLanguage.hashCode),
                            title.hashCode),
                        backdropPath.hashCode),
                    popularity.hashCode),
                voteCount.hashCode),
            video.hashCode),
        voteAverage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Film')
          ..add('posterPath', posterPath)
          ..add('adult', adult)
          ..add('overview', overview)
          ..add('releaseDate', releaseDate)
          ..add('genreIds', genreIds)
          ..add('id', id)
          ..add('originalTitle', originalTitle)
          ..add('originalLanguage', originalLanguage)
          ..add('title', title)
          ..add('backdropPath', backdropPath)
          ..add('popularity', popularity)
          ..add('voteCount', voteCount)
          ..add('video', video)
          ..add('voteAverage', voteAverage))
        .toString();
  }
}

class FilmBuilder implements Builder<Film, FilmBuilder> {
  _$Film _$v;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  ListBuilder<int> _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int> genreIds) => _$this._genreIds = genreIds;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  double _popularity;
  double get popularity => _$this._popularity;
  set popularity(double popularity) => _$this._popularity = popularity;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  bool _video;
  bool get video => _$this._video;
  set video(bool video) => _$this._video = video;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  FilmBuilder();

  FilmBuilder get _$this {
    if (_$v != null) {
      _posterPath = _$v.posterPath;
      _adult = _$v.adult;
      _overview = _$v.overview;
      _releaseDate = _$v.releaseDate;
      _genreIds = _$v.genreIds?.toBuilder();
      _id = _$v.id;
      _originalTitle = _$v.originalTitle;
      _originalLanguage = _$v.originalLanguage;
      _title = _$v.title;
      _backdropPath = _$v.backdropPath;
      _popularity = _$v.popularity;
      _voteCount = _$v.voteCount;
      _video = _$v.video;
      _voteAverage = _$v.voteAverage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Film other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Film;
  }

  @override
  void update(void Function(FilmBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Film build() {
    _$Film _$result;
    try {
      _$result = _$v ??
          new _$Film._(
              posterPath: posterPath,
              adult: adult,
              overview: overview,
              releaseDate: releaseDate,
              genreIds: genreIds.build(),
              id: id,
              originalTitle: originalTitle,
              originalLanguage: originalLanguage,
              title: title,
              backdropPath: backdropPath,
              popularity: popularity,
              voteCount: voteCount,
              video: video,
              voteAverage: voteAverage);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genreIds';
        genreIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Film', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FilmDetails extends FilmDetails {
  @override
  final bool adult;
  @override
  final String backdropPath;
  @override
  final int budget;
  @override
  final BuiltList<Genre> genres;
  @override
  final String homepage;
  @override
  final int id;
  @override
  final String imdbId;
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
  final BuiltList<ProductionCountry> productionCountries;
  @override
  final String releaseDate;
  @override
  final int revenue;
  @override
  final int runtime;
  @override
  final BuiltList<SpokenLanguage> spokenLanguages;
  @override
  final String status;
  @override
  final String tagline;
  @override
  final String title;
  @override
  final bool video;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  @override
  final FilmResult similar;

  factory _$FilmDetails([void Function(FilmDetailsBuilder) updates]) =>
      (new FilmDetailsBuilder()..update(updates)).build();

  _$FilmDetails._(
      {this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.similar})
      : super._() {
    if (adult == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'adult');
    }
    if (budget == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'budget');
    }
    if (genres == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'genres');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'id');
    }
    if (originalLanguage == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'originalLanguage');
    }
    if (originalTitle == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'originalTitle');
    }
    if (popularity == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'popularity');
    }
    if (productionCompanies == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'productionCompanies');
    }
    if (productionCountries == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'productionCountries');
    }
    if (revenue == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'revenue');
    }
    if (spokenLanguages == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'spokenLanguages');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'status');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'title');
    }
    if (video == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'video');
    }
    if (voteAverage == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'voteAverage');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'voteCount');
    }
    if (similar == null) {
      throw new BuiltValueNullFieldError('FilmDetails', 'similar');
    }
  }

  @override
  FilmDetails rebuild(void Function(FilmDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilmDetailsBuilder toBuilder() => new FilmDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilmDetails &&
        adult == other.adult &&
        backdropPath == other.backdropPath &&
        budget == other.budget &&
        genres == other.genres &&
        homepage == other.homepage &&
        id == other.id &&
        imdbId == other.imdbId &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        overview == other.overview &&
        popularity == other.popularity &&
        posterPath == other.posterPath &&
        productionCompanies == other.productionCompanies &&
        productionCountries == other.productionCountries &&
        releaseDate == other.releaseDate &&
        revenue == other.revenue &&
        runtime == other.runtime &&
        spokenLanguages == other.spokenLanguages &&
        status == other.status &&
        tagline == other.tagline &&
        title == other.title &&
        video == other.video &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc(0, adult.hashCode), backdropPath.hashCode), budget.hashCode), genres.hashCode), homepage.hashCode), id.hashCode),
                                                                                imdbId.hashCode),
                                                                            originalLanguage.hashCode),
                                                                        originalTitle.hashCode),
                                                                    overview.hashCode),
                                                                popularity.hashCode),
                                                            posterPath.hashCode),
                                                        productionCompanies.hashCode),
                                                    productionCountries.hashCode),
                                                releaseDate.hashCode),
                                            revenue.hashCode),
                                        runtime.hashCode),
                                    spokenLanguages.hashCode),
                                status.hashCode),
                            tagline.hashCode),
                        title.hashCode),
                    video.hashCode),
                voteAverage.hashCode),
            voteCount.hashCode),
        similar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FilmDetails')
          ..add('adult', adult)
          ..add('backdropPath', backdropPath)
          ..add('budget', budget)
          ..add('genres', genres)
          ..add('homepage', homepage)
          ..add('id', id)
          ..add('imdbId', imdbId)
          ..add('originalLanguage', originalLanguage)
          ..add('originalTitle', originalTitle)
          ..add('overview', overview)
          ..add('popularity', popularity)
          ..add('posterPath', posterPath)
          ..add('productionCompanies', productionCompanies)
          ..add('productionCountries', productionCountries)
          ..add('releaseDate', releaseDate)
          ..add('revenue', revenue)
          ..add('runtime', runtime)
          ..add('spokenLanguages', spokenLanguages)
          ..add('status', status)
          ..add('tagline', tagline)
          ..add('title', title)
          ..add('video', video)
          ..add('voteAverage', voteAverage)
          ..add('voteCount', voteCount)
          ..add('similar', similar))
        .toString();
  }
}

class FilmDetailsBuilder implements Builder<FilmDetails, FilmDetailsBuilder> {
  _$FilmDetails _$v;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  int _budget;
  int get budget => _$this._budget;
  set budget(int budget) => _$this._budget = budget;

  ListBuilder<Genre> _genres;
  ListBuilder<Genre> get genres => _$this._genres ??= new ListBuilder<Genre>();
  set genres(ListBuilder<Genre> genres) => _$this._genres = genres;

  String _homepage;
  String get homepage => _$this._homepage;
  set homepage(String homepage) => _$this._homepage = homepage;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _imdbId;
  String get imdbId => _$this._imdbId;
  set imdbId(String imdbId) => _$this._imdbId = imdbId;

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

  ListBuilder<ProductionCountry> _productionCountries;
  ListBuilder<ProductionCountry> get productionCountries =>
      _$this._productionCountries ??= new ListBuilder<ProductionCountry>();
  set productionCountries(ListBuilder<ProductionCountry> productionCountries) =>
      _$this._productionCountries = productionCountries;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  int _revenue;
  int get revenue => _$this._revenue;
  set revenue(int revenue) => _$this._revenue = revenue;

  int _runtime;
  int get runtime => _$this._runtime;
  set runtime(int runtime) => _$this._runtime = runtime;

  ListBuilder<SpokenLanguage> _spokenLanguages;
  ListBuilder<SpokenLanguage> get spokenLanguages =>
      _$this._spokenLanguages ??= new ListBuilder<SpokenLanguage>();
  set spokenLanguages(ListBuilder<SpokenLanguage> spokenLanguages) =>
      _$this._spokenLanguages = spokenLanguages;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _tagline;
  String get tagline => _$this._tagline;
  set tagline(String tagline) => _$this._tagline = tagline;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _video;
  bool get video => _$this._video;
  set video(bool video) => _$this._video = video;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  FilmResultBuilder _similar;
  FilmResultBuilder get similar => _$this._similar ??= new FilmResultBuilder();
  set similar(FilmResultBuilder similar) => _$this._similar = similar;

  FilmDetailsBuilder();

  FilmDetailsBuilder get _$this {
    if (_$v != null) {
      _adult = _$v.adult;
      _backdropPath = _$v.backdropPath;
      _budget = _$v.budget;
      _genres = _$v.genres?.toBuilder();
      _homepage = _$v.homepage;
      _id = _$v.id;
      _imdbId = _$v.imdbId;
      _originalLanguage = _$v.originalLanguage;
      _originalTitle = _$v.originalTitle;
      _overview = _$v.overview;
      _popularity = _$v.popularity;
      _posterPath = _$v.posterPath;
      _productionCompanies = _$v.productionCompanies?.toBuilder();
      _productionCountries = _$v.productionCountries?.toBuilder();
      _releaseDate = _$v.releaseDate;
      _revenue = _$v.revenue;
      _runtime = _$v.runtime;
      _spokenLanguages = _$v.spokenLanguages?.toBuilder();
      _status = _$v.status;
      _tagline = _$v.tagline;
      _title = _$v.title;
      _video = _$v.video;
      _voteAverage = _$v.voteAverage;
      _voteCount = _$v.voteCount;
      _similar = _$v.similar?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilmDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FilmDetails;
  }

  @override
  void update(void Function(FilmDetailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FilmDetails build() {
    _$FilmDetails _$result;
    try {
      _$result = _$v ??
          new _$FilmDetails._(
              adult: adult,
              backdropPath: backdropPath,
              budget: budget,
              genres: genres.build(),
              homepage: homepage,
              id: id,
              imdbId: imdbId,
              originalLanguage: originalLanguage,
              originalTitle: originalTitle,
              overview: overview,
              popularity: popularity,
              posterPath: posterPath,
              productionCompanies: productionCompanies.build(),
              productionCountries: productionCountries.build(),
              releaseDate: releaseDate,
              revenue: revenue,
              runtime: runtime,
              spokenLanguages: spokenLanguages.build(),
              status: status,
              tagline: tagline,
              title: title,
              video: video,
              voteAverage: voteAverage,
              voteCount: voteCount,
              similar: similar.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genres';
        genres.build();

        _$failedField = 'productionCompanies';
        productionCompanies.build();
        _$failedField = 'productionCountries';
        productionCountries.build();

        _$failedField = 'spokenLanguages';
        spokenLanguages.build();

        _$failedField = 'similar';
        similar.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FilmDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
