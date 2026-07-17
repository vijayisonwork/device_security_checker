package com.vs_plugin.device_security_checker.security

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.vs_plugin.device_security_checker.utils.Constants
import android.content.Context

class SecurityDispatcher(private val context: Context) {
    private val scanner = SecurityScanner(context)

    fun dispatch(
        call: MethodCall,
        result: MethodChannel.Result
    ) {

        when (call.method) {
            Constants.METHOD_INITIALIZE -> {
                result.success(null)
            }

            Constants.METHOD_SCAN_DEVICE -> {
                result.success(scanner.scan())
            }

            else -> result.notImplemented()
        }
    }
}