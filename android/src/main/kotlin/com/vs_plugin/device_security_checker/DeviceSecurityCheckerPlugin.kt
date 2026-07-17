package com.vs_plugin.device_security_checker

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.vs_plugin.device_security_checker.utils.Constants
import com.vs_plugin.device_security_checker.security.SecurityDispatcher

/** DeviceSecurityCheckerPlugin */
class DeviceSecurityCheckerPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var dispatcher: SecurityDispatcher

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    dispatcher = SecurityDispatcher(flutterPluginBinding.applicationContext)

    channel = MethodChannel(flutterPluginBinding.binaryMessenger, Constants.CHANNEL)
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    dispatcher.dispatch(call, result)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
