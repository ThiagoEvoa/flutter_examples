package com.example.example

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity(), PluginRegistry.PluginRegistrantCallback{
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
  }

  override fun registerWith(registry: PluginRegistry){
    GeneratedPluginRegistrant.registerWith(registry)
  }
}
