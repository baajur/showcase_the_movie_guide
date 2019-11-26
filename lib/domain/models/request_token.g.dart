// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RequestToken> _$requestTokenSerializer =
    new _$RequestTokenSerializer();

class _$RequestTokenSerializer implements StructuredSerializer<RequestToken> {
  @override
  final Iterable<Type> types = const [RequestToken, _$RequestToken];
  @override
  final String wireName = 'RequestToken';

  @override
  Iterable<Object> serialize(Serializers serializers, RequestToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'expires_at',
      serializers.serialize(object.expiresAt,
          specifiedType: const FullType(String)),
      'request_token',
      serializers.serialize(object.requestToken,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  RequestToken deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RequestTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'expires_at':
          result.expiresAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'request_token':
          result.requestToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RequestToken extends RequestToken {
  @override
  final bool success;
  @override
  final String expiresAt;
  @override
  final String requestToken;

  factory _$RequestToken([void Function(RequestTokenBuilder) updates]) =>
      (new RequestTokenBuilder()..update(updates)).build();

  _$RequestToken._({this.success, this.expiresAt, this.requestToken})
      : super._() {
    if (success == null) {
      throw new BuiltValueNullFieldError('RequestToken', 'success');
    }
    if (expiresAt == null) {
      throw new BuiltValueNullFieldError('RequestToken', 'expiresAt');
    }
    if (requestToken == null) {
      throw new BuiltValueNullFieldError('RequestToken', 'requestToken');
    }
  }

  @override
  RequestToken rebuild(void Function(RequestTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestTokenBuilder toBuilder() => new RequestTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestToken &&
        success == other.success &&
        expiresAt == other.expiresAt &&
        requestToken == other.requestToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, success.hashCode), expiresAt.hashCode),
        requestToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RequestToken')
          ..add('success', success)
          ..add('expiresAt', expiresAt)
          ..add('requestToken', requestToken))
        .toString();
  }
}

class RequestTokenBuilder
    implements Builder<RequestToken, RequestTokenBuilder> {
  _$RequestToken _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _expiresAt;
  String get expiresAt => _$this._expiresAt;
  set expiresAt(String expiresAt) => _$this._expiresAt = expiresAt;

  String _requestToken;
  String get requestToken => _$this._requestToken;
  set requestToken(String requestToken) => _$this._requestToken = requestToken;

  RequestTokenBuilder();

  RequestTokenBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _expiresAt = _$v.expiresAt;
      _requestToken = _$v.requestToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestToken other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RequestToken;
  }

  @override
  void update(void Function(RequestTokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RequestToken build() {
    final _$result = _$v ??
        new _$RequestToken._(
            success: success, expiresAt: expiresAt, requestToken: requestToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
