package com.example.example

import android.os.Bundle
import android.os.Handler
import android.os.Looper

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val channel: String = "my_channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        Handler(Looper.getMainLooper()).post {
            MethodChannel(flutterView, channel)
                    .setMethodCallHandler { call, result ->
                        if (call.method == "getMessage") {
                            result.success(getMessage())
                        } else {
                            result.notImplemented()
                        }
                    }
        }
    }

    private fun getMessage(): String {
        return "Android Channel"
    }
}
