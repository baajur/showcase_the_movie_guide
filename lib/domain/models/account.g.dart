// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountDetails> _$accountDetailsSerializer =
    new _$AccountDetailsSerializer();
Serializer<Avatar> _$avatarSerializer = new _$AvatarSerializer();
Serializer<Gravatar> _$gravatarSerializer = new _$GravatarSerializer();

class _$AccountDetailsSerializer
    implements StructuredSerializer<AccountDetails> {
  @override
  final Iterable<Type> types = const [AccountDetails, _$AccountDetails];
  @override
  final String wireName = 'AccountDetails';

  @override
  Iterable<Object> serialize(Serializers serializers, AccountDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'avatar',
      serializers.serialize(object.avatar,
          specifiedType: const FullType(Avatar)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'iso_639_1',
      serializers.serialize(object.iso6391,
          specifiedType: const FullType(String)),
      'iso_3166_1',
      serializers.serialize(object.iso31661,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'include_adult',
      serializers.serialize(object.includeAdult,
          specifiedType: const FullType(bool)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AccountDetails deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'avatar':
          result.avatar.replace(serializers.deserialize(value,
              specifiedType: const FullType(Avatar)) as Avatar);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'iso_639_1':
          result.iso6391 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'iso_3166_1':
          result.iso31661 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'include_adult':
          result.includeAdult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AvatarSerializer implements StructuredSerializer<Avatar> {
  @override
  final Iterable<Type> types = const [Avatar, _$Avatar];
  @override
  final String wireName = 'Avatar';

  @override
  Iterable<Object> serialize(Serializers serializers, Avatar object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'gravatar',
      serializers.serialize(object.gravatar,
          specifiedType: const FullType(Gravatar)),
    ];

    return result;
  }

  @override
  Avatar deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AvatarBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'gravatar':
          result.gravatar.replace(serializers.deserialize(value,
              specifiedType: const FullType(Gravatar)) as Gravatar);
          break;
      }
    }

    return result.build();
  }
}

class _$GravatarSerializer implements StructuredSerializer<Gravatar> {
  @override
  final Iterable<Type> types = const [Gravatar, _$Gravatar];
  @override
  final String wireName = 'Gravatar';

  @override
  Iterable<Object> serialize(Serializers serializers, Gravatar object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hash',
      serializers.serialize(object.hash, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Gravatar deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GravatarBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hash':
          result.hash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AccountDetails extends AccountDetails {
  @override
  final Avatar avatar;
  @override
  final int id;
  @override
  final String iso6391;
  @override
  final String iso31661;
  @override
  final String name;
  @override
  final bool includeAdult;
  @override
  final String username;

  factory _$AccountDetails([void Function(AccountDetailsBuilder) updates]) =>
      (new AccountDetailsBuilder()..update(updates)).build();

  _$AccountDetails._(
      {this.avatar,
      this.id,
      this.iso6391,
      this.iso31661,
      this.name,
      this.includeAdult,
      this.username})
      : super._() {
    if (avatar == null) {
      throw new BuiltValueNullFieldError('AccountDetails', 'avatar');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('AccountDetails', 'id');
    }
    if (iso6391 == null) {
      throw new BuiltValueNullFieldError('AccountDetails', 'iso6391');
    }
    if (iso31661 == null) {
      throw new BuiltValueNullFieldError('AccountDetails', 'iso31661');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('AccountDetails', 'name');
    }
    if (includeAdult == null) {
      throw new BuiltValueNullFieldError('AccountDetails', 'includeAdult');
    }
    if (username == null) {
      throw new BuiltValueNullFieldError('AccountDetails', 'username');
    }
  }

  @override
  AccountDetails rebuild(void Function(AccountDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountDetailsBuilder toBuilder() =>
      new AccountDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountDetails &&
        avatar == other.avatar &&
        id == other.id &&
        iso6391 == other.iso6391 &&
        iso31661 == other.iso31661 &&
        name == other.name &&
        includeAdult == other.includeAdult &&
        username == other.username;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, avatar.hashCode), id.hashCode),
                        iso6391.hashCode),
                    iso31661.hashCode),
                name.hashCode),
            includeAdult.hashCode),
        username.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccountDetails')
          ..add('avatar', avatar)
          ..add('id', id)
          ..add('iso6391', iso6391)
          ..add('iso31661', iso31661)
          ..add('name', name)
          ..add('includeAdult', includeAdult)
          ..add('username', username))
        .toString();
  }
}

class AccountDetailsBuilder
    implements Builder<AccountDetails, AccountDetailsBuilder> {
  _$AccountDetails _$v;

  AvatarBuilder _avatar;
  AvatarBuilder get avatar => _$this._avatar ??= new AvatarBuilder();
  set avatar(AvatarBuilder avatar) => _$this._avatar = avatar;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _iso6391;
  String get iso6391 => _$this._iso6391;
  set iso6391(String iso6391) => _$this._iso6391 = iso6391;

  String _iso31661;
  String get iso31661 => _$this._iso31661;
  set iso31661(String iso31661) => _$this._iso31661 = iso31661;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _includeAdult;
  bool get includeAdult => _$this._includeAdult;
  set includeAdult(bool includeAdult) => _$this._includeAdult = includeAdult;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  AccountDetailsBuilder();

  AccountDetailsBuilder get _$this {
    if (_$v != null) {
      _avatar = _$v.avatar?.toBuilder();
      _id = _$v.id;
      _iso6391 = _$v.iso6391;
      _iso31661 = _$v.iso31661;
      _name = _$v.name;
      _includeAdult = _$v.includeAdult;
      _username = _$v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AccountDetails;
  }

  @override
  void update(void Function(AccountDetailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccountDetails build() {
    _$AccountDetails _$result;
    try {
      _$result = _$v ??
          new _$AccountDetails._(
              avatar: avatar.build(),
              id: id,
              iso6391: iso6391,
              iso31661: iso31661,
              name: name,
              includeAdult: includeAdult,
              username: username);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'avatar';
        avatar.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AccountDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Avatar extends Avatar {
  @override
  final Gravatar gravatar;

  factory _$Avatar([void Function(AvatarBuilder) updates]) =>
      (new AvatarBuilder()..update(updates)).build();

  _$Avatar._({this.gravatar}) : super._() {
    if (gravatar == null) {
      throw new BuiltValueNullFieldError('Avatar', 'gravatar');
    }
  }

  @override
  Avatar rebuild(void Function(AvatarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvatarBuilder toBuilder() => new AvatarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Avatar && gravatar == other.gravatar;
  }

  @override
  int get hashCode {
    return $jf($jc(0, gravatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Avatar')..add('gravatar', gravatar))
        .toString();
  }
}

class AvatarBuilder implements Builder<Avatar, AvatarBuilder> {
  _$Avatar _$v;

  GravatarBuilder _gravatar;
  GravatarBuilder get gravatar => _$this._gravatar ??= new GravatarBuilder();
  set gravatar(GravatarBuilder gravatar) => _$this._gravatar = gravatar;

  AvatarBuilder();

  AvatarBuilder get _$this {
    if (_$v != null) {
      _gravatar = _$v.gravatar?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Avatar other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Avatar;
  }

  @override
  void update(void Function(AvatarBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Avatar build() {
    _$Avatar _$result;
    try {
      _$result = _$v ?? new _$Avatar._(gravatar: gravatar.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'gravatar';
        gravatar.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Avatar', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Gravatar extends Gravatar {
  @override
  final String hash;

  factory _$Gravatar([void Function(GravatarBuilder) updates]) =>
      (new GravatarBuilder()..update(updates)).build();

  _$Gravatar._({this.hash}) : super._() {
    if (hash == null) {
      throw new BuiltValueNullFieldError('Gravatar', 'hash');
    }
  }

  @override
  Gravatar rebuild(void Function(GravatarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GravatarBuilder toBuilder() => new GravatarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Gravatar && hash == other.hash;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hash.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Gravatar')..add('hash', hash))
        .toString();
  }
}

class GravatarBuilder implements Builder<Gravatar, GravatarBuilder> {
  _$Gravatar _$v;

  String _hash;
  String get hash => _$this._hash;
  set hash(String hash) => _$this._hash = hash;

  GravatarBuilder();

  GravatarBuilder get _$this {
    if (_$v != null) {
      _hash = _$v.hash;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Gravatar other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Gravatar;
  }

  @override
  void update(void Function(GravatarBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Gravatar build() {
    final _$result = _$v ?? new _$Gravatar._(hash: hash);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
