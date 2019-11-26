package app.vs.showcasethemovieguide

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

private const val CHANNEL = "app.vs.showcasethemovieguide/auth"

private const val QUERY_REQUEST_TOKEN = "request_token"
private const val QUERY_APPROVED = "approved"

class MainActivity : FlutterActivity() {

    private val sharedData = mutableMapOf<String, String>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getSharedData") {
                result.success(sharedData)
                sharedData.clear()
            }
        }
    }

    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)
        handleIntent(intent)
    }

    private fun handleIntent(intent: Intent?) {
        intent?.data?.let {
            val requestToken = it.getQueryParameter(QUERY_REQUEST_TOKEN)
            val approved = it.getQueryParameter(QUERY_APPROVED)

            if (requestToken != null && approved != null) {
                sharedData[QUERY_REQUEST_TOKEN] = requestToken
                sharedData[QUERY_APPROVED] = approved
            }
        }
    }
}
