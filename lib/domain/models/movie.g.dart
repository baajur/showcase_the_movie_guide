// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Genre> _$genreSerializer = new _$GenreSerializer();
Serializer<ProductionCompany> _$productionCompanySerializer =
    new _$ProductionCompanySerializer();
Serializer<ProductionCountry> _$productionCountrySerializer =
    new _$ProductionCountrySerializer();
Serializer<SpokenLanguage> _$spokenLanguageSerializer =
    new _$SpokenLanguageSerializer();

class _$GenreSerializer implements StructuredSerializer<Genre> {
  @override
  final Iterable<Type> types = const [Genre, _$Genre];
  @override
  final String wireName = 'Genre';

  @override
  Iterable<Object> serialize(Serializers serializers, Genre object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Genre deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GenreBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductionCompanySerializer
    implements StructuredSerializer<ProductionCompany> {
  @override
  final Iterable<Type> types = const [ProductionCompany, _$ProductionCompany];
  @override
  final String wireName = 'ProductionCompany';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductionCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'origin_country',
      serializers.serialize(object.originCountry,
          specifiedType: const FullType(String)),
    ];
    if (object.logoPath != null) {
      result
        ..add('logo_path')
        ..add(serializers.serialize(object.logoPath,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ProductionCompany deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductionCompanyBuilder();

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
        case 'logo_path':
          result.logoPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'origin_country':
          result.originCountry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductionCountrySerializer
    implements StructuredSerializer<ProductionCountry> {
  @override
  final Iterable<Type> types = const [ProductionCountry, _$ProductionCountry];
  @override
  final String wireName = 'ProductionCountry';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductionCountry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'iso_3166_1',
      serializers.serialize(object.iso31661,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ProductionCountry deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductionCountryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'iso_3166_1':
          result.iso31661 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SpokenLanguageSerializer
    implements StructuredSerializer<SpokenLanguage> {
  @override
  final Iterable<Type> types = const [SpokenLanguage, _$SpokenLanguage];
  @override
  final String wireName = 'SpokenLanguage';

  @override
  Iterable<Object> serialize(Serializers serializers, SpokenLanguage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'iso_639_1',
      serializers.serialize(object.iso6391,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SpokenLanguage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SpokenLanguageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'iso_639_1':
          result.iso6391 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Genre extends Genre {
  @override
  final int id;
  @override
  final String name;

  factory _$Genre([void Function(GenreBuilder) updates]) =>
      (new GenreBuilder()..update(updates)).build();

  _$Genre._({this.id, this.name}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Genre', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Genre', 'name');
    }
  }

  @override
  Genre rebuild(void Function(GenreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenreBuilder toBuilder() => new GenreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Genre && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Genre')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GenreBuilder implements Builder<Genre, GenreBuilder> {
  _$Genre _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GenreBuilder();

  GenreBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Genre other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Genre;
  }

  @override
  void update(void Function(GenreBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Genre build() {
    final _$result = _$v ?? new _$Genre._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$ProductionCompany extends ProductionCompany {
  @override
  final int id;
  @override
  final String logoPath;
  @override
  final String name;
  @override
  final String originCountry;

  factory _$ProductionCompany(
          [void Function(ProductionCompanyBuilder) updates]) =>
      (new ProductionCompanyBuilder()..update(updates)).build();

  _$ProductionCompany._({this.id, this.logoPath, this.name, this.originCountry})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ProductionCompany', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('ProductionCompany', 'name');
    }
    if (originCountry == null) {
      throw new BuiltValueNullFieldError('ProductionCompany', 'originCountry');
    }
  }

  @override
  ProductionCompany rebuild(void Function(ProductionCompanyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductionCompanyBuilder toBuilder() =>
      new ProductionCompanyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductionCompany &&
        id == other.id &&
        logoPath == other.logoPath &&
        name == other.name &&
        originCountry == other.originCountry;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), logoPath.hashCode), name.hashCode),
        originCountry.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductionCompany')
          ..add('id', id)
          ..add('logoPath', logoPath)
          ..add('name', name)
          ..add('originCountry', originCountry))
        .toString();
  }
}

class ProductionCompanyBuilder
    implements Builder<ProductionCompany, ProductionCompanyBuilder> {
  _$ProductionCompany _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _logoPath;
  String get logoPath => _$this._logoPath;
  set logoPath(String logoPath) => _$this._logoPath = logoPath;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _originCountry;
  String get originCountry => _$this._originCountry;
  set originCountry(String originCountry) =>
      _$this._originCountry = originCountry;

  ProductionCompanyBuilder();

  ProductionCompanyBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _logoPath = _$v.logoPath;
      _name = _$v.name;
      _originCountry = _$v.originCountry;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductionCompany other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductionCompany;
  }

  @override
  void update(void Function(ProductionCompanyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductionCompany build() {
    final _$result = _$v ??
        new _$ProductionCompany._(
            id: id,
            logoPath: logoPath,
            name: name,
            originCountry: originCountry);
    replace(_$result);
    return _$result;
  }
}

class _$ProductionCountry extends ProductionCountry {
  @override
  final String iso31661;
  @override
  final String name;

  factory _$ProductionCountry(
          [void Function(ProductionCountryBuilder) updates]) =>
      (new ProductionCountryBuilder()..update(updates)).build();

  _$ProductionCountry._({this.iso31661, this.name}) : super._() {
    if (iso31661 == null) {
      throw new BuiltValueNullFieldError('ProductionCountry', 'iso31661');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('ProductionCountry', 'name');
    }
  }

  @override
  ProductionCountry rebuild(void Function(ProductionCountryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductionCountryBuilder toBuilder() =>
      new ProductionCountryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductionCountry &&
        iso31661 == other.iso31661 &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, iso31661.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductionCountry')
          ..add('iso31661', iso31661)
          ..add('name', name))
        .toString();
  }
}

class ProductionCountryBuilder
    implements Builder<ProductionCountry, ProductionCountryBuilder> {
  _$ProductionCountry _$v;

  String _iso31661;
  String get iso31661 => _$this._iso31661;
  set iso31661(String iso31661) => _$this._iso31661 = iso31661;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ProductionCountryBuilder();

  ProductionCountryBuilder get _$this {
    if (_$v != null) {
      _iso31661 = _$v.iso31661;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductionCountry other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductionCountry;
  }

  @override
  void update(void Function(ProductionCountryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductionCountry build() {
    final _$result =
        _$v ?? new _$ProductionCountry._(iso31661: iso31661, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$SpokenLanguage extends SpokenLanguage {
  @override
  final String iso6391;
  @override
  final String name;

  factory _$SpokenLanguage([void Function(SpokenLanguageBuilder) updates]) =>
      (new SpokenLanguageBuilder()..update(updates)).build();

  _$SpokenLanguage._({this.iso6391, this.name}) : super._() {
    if (iso6391 == null) {
      throw new BuiltValueNullFieldError('SpokenLanguage', 'iso6391');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('SpokenLanguage', 'name');
    }
  }

  @override
  SpokenLanguage rebuild(void Function(SpokenLanguageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpokenLanguageBuilder toBuilder() =>
      new SpokenLanguageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpokenLanguage &&
        iso6391 == other.iso6391 &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, iso6391.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SpokenLanguage')
          ..add('iso6391', iso6391)
          ..add('name', name))
        .toString();
  }
}

class SpokenLanguageBuilder
    implements Builder<SpokenLanguage, SpokenLanguageBuilder> {
  _$SpokenLanguage _$v;

  String _iso6391;
  String get iso6391 => _$this._iso6391;
  set iso6391(String iso6391) => _$this._iso6391 = iso6391;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  SpokenLanguageBuilder();

  SpokenLanguageBuilder get _$this {
    if (_$v != null) {
      _iso6391 = _$v.iso6391;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpokenLanguage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SpokenLanguage;
  }

  @override
  void update(void Function(SpokenLanguageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SpokenLanguage build() {
    final _$result =
        _$v ?? new _$SpokenLanguage._(iso6391: iso6391, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
