import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'request_token.g.dart';

abstract class RequestToken implements Built<RequestToken, RequestTokenBuilder> {
  @BuiltValueField(wireName: 'success') 
  bool get success;
  @BuiltValueField(wireName: 'expires_at') 
  String get expiresAt;
  @BuiltValueField(wireName: 'request_token') 
  String get requestToken;

  RequestToken._();

  factory RequestToken([updates(RequestTokenBuilder b)]) = _$RequestToken;

  factory RequestToken.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(RequestToken.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(RequestToken.serializer, this);
  }

  static Serializer<RequestToken> get serializer => _$requestTokenSerializer;
}
