package br.com.mottu.mottu

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

private const val CHANNEL = "br.com.mottu/test"
private const val MOTTU_CHANNEL = "MOTTU"

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { methodCall, result ->
            if (methodCall.method == MOTTU_CHANNEL) {
                val message = context.getString(R.string.sky_limit)
                result.success(message)
            }
        }
    }
}
