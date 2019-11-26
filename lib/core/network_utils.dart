import 'package:connectivity/connectivity.dart';
import 'package:showcase_the_movie_guide/core/network_info.dart';

class NetworkUtils implements NetworkInfo {
  @override
  Future<bool> isNetworkAvailable() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    return false;
  }
}
