package com.vs_plugin.device_security_checker.checker

import android.content.Context
import android.provider.Settings

class DeveloperChecker(
    private val context: Context
) {

    fun isEnabled(): Boolean {
        return try {
            Settings.Global.getInt(
                context.contentResolver,
                Settings.Global.DEVELOPMENT_SETTINGS_ENABLED,
                0
            ) != 0
        } catch (e: Exception) {
            false
        }
    }
}