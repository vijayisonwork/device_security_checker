package com.vs_plugin.device_security_checker.checker

import android.content.Context
import android.provider.Settings

class UsbDebugChecker(
    private val context: Context
) {

    fun isEnabled(): Boolean {
        return try {
            Settings.Global.getInt(
                context.contentResolver,
                Settings.Global.ADB_ENABLED,
                0
            ) != 0
        } catch (e: Exception) {
            false
        }
    }
}