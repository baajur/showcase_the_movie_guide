import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/request_token.dart';
import '../../../domain/models/session_id.dart';
import '../../../domain/models/status.dart';
import '../showcase_http_client.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: TMDB_API_BASE_URL + 'authentication')
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @GET('/token/new')
  Future<RequestToken> createRequestToken();

  @POST('/token/validate_with_login')
  Future<RequestToken> validateTokenWithLogin(
      @Body() Map<String, String> body);

  @POST('/session/new')
  Future<SessionId> createSessionId(@Body() Map<String, String> body);

  @DELETE('/session')
  Future<Status> deleteSession(@Field('session_id') String sessionId);
}
