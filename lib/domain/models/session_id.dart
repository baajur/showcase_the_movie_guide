import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:showcase_the_movie_guide/domain/serializers.dart';

part 'session_id.g.dart';

abstract class SessionId implements Built<SessionId, SessionIdBuilder> {
  @BuiltValueField(wireName: 'success')
  bool get success;

  @BuiltValueField(wireName: 'session_id')
  String get sessionId;

  @nullable
  @BuiltValueField(wireName: 'request_token')
  String get requestToken;

  SessionId._();

  factory SessionId([updates(SessionIdBuilder b)]) = _$SessionId;

  factory SessionId.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SessionId.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SessionId.serializer, this);
  }

  static Serializer<SessionId> get serializer => _$sessionIdSerializer;
}
