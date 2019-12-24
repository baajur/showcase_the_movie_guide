import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/models/film.dart';
import 'package:showcase_the_movie_guide/domain/models/movie.dart';
import 'package:showcase_the_movie_guide/domain/models/request_token.dart';
import 'package:showcase_the_movie_guide/domain/models/session_id.dart';
import 'package:showcase_the_movie_guide/domain/models/status.dart';
import 'package:showcase_the_movie_guide/domain/models/tv_show.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  FilmResult,
  FilmDetails,
  TvShowResult,
  TvShowDetails,
  AccountDetails,
  RequestToken,
  SessionId,
  Status
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
