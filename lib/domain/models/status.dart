import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:showcase_the_movie_guide/domain/serializers.dart';

part 'status.g.dart';

abstract class Status implements Built<Status, StatusBuilder> {
  @BuiltValueField(wireName: 'status_message')
  String get statusMessage;

  @nullable
  @BuiltValueField(wireName: 'success')
  bool get success;

  @BuiltValueField(wireName: 'status_code')
  int get statusCode;

  Status._();

  factory Status([updates(StatusBuilder b)]) = _$Status;

  factory Status.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Status.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Status.serializer, this);
  }

  static Serializer<Status> get serializer => _$statusSerializer;
}
