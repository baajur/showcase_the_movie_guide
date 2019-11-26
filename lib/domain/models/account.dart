import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:showcase_the_movie_guide/data/network/showcase_http_client.dart';

import '../serializers.dart';

part 'account.g.dart';

abstract class AccountDetails
    implements Built<AccountDetails, AccountDetailsBuilder> {
  @BuiltValueField(wireName: 'avatar')
  Avatar get avatar;
  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'iso_639_1')
  String get iso6391;
  @BuiltValueField(wireName: 'iso_3166_1')
  String get iso31661;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'include_adult')
  bool get includeAdult;
  @BuiltValueField(wireName: 'username')
  String get username;

  AccountDetails._();

  factory AccountDetails([updates(AccountDetailsBuilder b)]) = _$AccountDetails;

  factory AccountDetails.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AccountDetails.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AccountDetails.serializer, this);
  }

  static Serializer<AccountDetails> get serializer =>
      _$accountDetailsSerializer;
}

abstract class Avatar implements Built<Avatar, AvatarBuilder> {
  @BuiltValueField(wireName: 'gravatar')
  Gravatar get gravatar;

  Avatar._();

  factory Avatar([updates(AvatarBuilder b)]) = _$Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Avatar.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Avatar.serializer, this);
  }

  static Serializer<Avatar> get serializer => _$avatarSerializer;
}

abstract class Gravatar implements Built<Gravatar, GravatarBuilder> {
  @BuiltValueField(wireName: 'hash')
  String get hash;

  Gravatar._();

  factory Gravatar([updates(GravatarBuilder b)]) = _$Gravatar;

  factory Gravatar.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Gravatar.serializer, json);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Gravatar.serializer, this);
  }

  static Serializer<Gravatar> get serializer => _$gravatarSerializer;

  String get fullPath => GRAVATAR_AVATAR_BASE_URL + hash;
}
