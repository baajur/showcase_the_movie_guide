import 'package:showcase_the_movie_guide/domain/models/status.dart';

class NetworkNotAvailableException implements Exception {}

class ApiException implements Exception {

  final Status status;

  ApiException(this.status);
}

class UserNotAuthenticatedException implements Exception {}