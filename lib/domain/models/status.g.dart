// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Status> _$statusSerializer = new _$StatusSerializer();

class _$StatusSerializer implements StructuredSerializer<Status> {
  @override
  final Iterable<Type> types = const [Status, _$Status];
  @override
  final String wireName = 'Status';

  @override
  Iterable<Object> serialize(Serializers serializers, Status object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status_message',
      serializers.serialize(object.statusMessage,
          specifiedType: const FullType(String)),
      'status_code',
      serializers.serialize(object.statusCode,
          specifiedType: const FullType(int)),
    ];
    if (object.success != null) {
      result
        ..add('success')
        ..add(serializers.serialize(object.success,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  Status deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status_message':
          result.statusMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'status_code':
          result.statusCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Status extends Status {
  @override
  final String statusMessage;
  @override
  final bool success;
  @override
  final int statusCode;

  factory _$Status([void Function(StatusBuilder) updates]) =>
      (new StatusBuilder()..update(updates)).build();

  _$Status._({this.statusMessage, this.success, this.statusCode}) : super._() {
    if (statusMessage == null) {
      throw new BuiltValueNullFieldError('Status', 'statusMessage');
    }
    if (statusCode == null) {
      throw new BuiltValueNullFieldError('Status', 'statusCode');
    }
  }

  @override
  Status rebuild(void Function(StatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusBuilder toBuilder() => new StatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Status &&
        statusMessage == other.statusMessage &&
        success == other.success &&
        statusCode == other.statusCode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, statusMessage.hashCode), success.hashCode),
        statusCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Status')
          ..add('statusMessage', statusMessage)
          ..add('success', success)
          ..add('statusCode', statusCode))
        .toString();
  }
}

class StatusBuilder implements Builder<Status, StatusBuilder> {
  _$Status _$v;

  String _statusMessage;
  String get statusMessage => _$this._statusMessage;
  set statusMessage(String statusMessage) =>
      _$this._statusMessage = statusMessage;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  int _statusCode;
  int get statusCode => _$this._statusCode;
  set statusCode(int statusCode) => _$this._statusCode = statusCode;

  StatusBuilder();

  StatusBuilder get _$this {
    if (_$v != null) {
      _statusMessage = _$v.statusMessage;
      _success = _$v.success;
      _statusCode = _$v.statusCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Status other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Status;
  }

  @override
  void update(void Function(StatusBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Status build() {
    final _$result = _$v ??
        new _$Status._(
            statusMessage: statusMessage,
            success: success,
            statusCode: statusCode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
