import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcase_the_movie_guide/domain/models/account.dart';
import 'package:showcase_the_movie_guide/domain/repositories/settings_repository.dart';

const _KEY_SESSION_ID = 'sessionId';
const _KEY_ACCOUNT_DETAILS = 'accountDetails';

class LocalSettingsRepository implements SettingsRepository {
  SharedPreferences prefs;

  @override
  Future<String> getSessionId() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs.getString(_KEY_SESSION_ID);
  }

  @override
  Future<bool> storeSessionId(String sessionId) async {
    prefs ??= await SharedPreferences.getInstance();
    return await prefs.setString(_KEY_SESSION_ID, sessionId);
  }

  @override
  Future<AccountDetails> getAccountDetails() async {
    prefs ??= await SharedPreferences.getInstance();

    final accountDetails = AccountDetails.fromJson(
        json.decode(prefs.getString(_KEY_ACCOUNT_DETAILS)));
    return accountDetails;
  }

  @override
  Future<bool> storeAccountDetails(AccountDetails accountDetails) async {
    prefs ??= await SharedPreferences.getInstance();
    final accountDetailsJson = json.encode(accountDetails.toJson());
    return await prefs.setString(_KEY_ACCOUNT_DETAILS, accountDetailsJson);
  }
}
