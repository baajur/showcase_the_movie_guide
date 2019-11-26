// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SessionId> _$sessionIdSerializer = new _$SessionIdSerializer();

class _$SessionIdSerializer implements StructuredSerializer<SessionId> {
  @override
  final Iterable<Type> types = const [SessionId, _$SessionId];
  @override
  final String wireName = 'SessionId';

  @override
  Iterable<Object> serialize(Serializers serializers, SessionId object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'session_id',
      serializers.serialize(object.sessionId,
          specifiedType: const FullType(String)),
    ];
    if (object.requestToken != null) {
      result
        ..add('request_token')
        ..add(serializers.serialize(object.requestToken,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SessionId deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SessionIdBuilder();

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
        case 'session_id':
          result.sessionId = serializers.deserialize(value,
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

class _$SessionId extends SessionId {
  @override
  final bool success;
  @override
  final String sessionId;
  @override
  final String requestToken;

  factory _$SessionId([void Function(SessionIdBuilder) updates]) =>
      (new SessionIdBuilder()..update(updates)).build();

  _$SessionId._({this.success, this.sessionId, this.requestToken}) : super._() {
    if (success == null) {
      throw new BuiltValueNullFieldError('SessionId', 'success');
    }
    if (sessionId == null) {
      throw new BuiltValueNullFieldError('SessionId', 'sessionId');
    }
  }

  @override
  SessionId rebuild(void Function(SessionIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionIdBuilder toBuilder() => new SessionIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionId &&
        success == other.success &&
        sessionId == other.sessionId &&
        requestToken == other.requestToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, success.hashCode), sessionId.hashCode),
        requestToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SessionId')
          ..add('success', success)
          ..add('sessionId', sessionId)
          ..add('requestToken', requestToken))
        .toString();
  }
}

class SessionIdBuilder implements Builder<SessionId, SessionIdBuilder> {
  _$SessionId _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _sessionId;
  String get sessionId => _$this._sessionId;
  set sessionId(String sessionId) => _$this._sessionId = sessionId;

  String _requestToken;
  String get requestToken => _$this._requestToken;
  set requestToken(String requestToken) => _$this._requestToken = requestToken;

  SessionIdBuilder();

  SessionIdBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _sessionId = _$v.sessionId;
      _requestToken = _$v.requestToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionId other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SessionId;
  }

  @override
  void update(void Function(SessionIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SessionId build() {
    final _$result = _$v ??
        new _$SessionId._(
            success: success, sessionId: sessionId, requestToken: requestToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
