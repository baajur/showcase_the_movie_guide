import 'package:showcase_the_movie_guide/domain/models/account.dart';

abstract class SettingsRepository {

  Future<String> getSessionId();

  Future<bool> storeSessionId(String sessionId);

  Future<AccountDetails> getAccountDetails();

  Future<bool> storeAccountDetails(AccountDetails accountDetails);
}