package com.vs_plugin.device_security_checker.checker

import android.content.Context
import android.content.pm.PackageManager
import java.io.File
import android.os.Build
import com.vs_plugin.device_security_checker.utils.RootDetectionType

class RootChecker(
    private val context: Context
) {

    fun isRooted(): Boolean {
        return detectRootReasons().isNotEmpty()
    }

    private fun detectRootReasons(): Set<RootDetectionType> {

        val reasons = mutableSetOf<RootDetectionType>()

        if (checkSuBinary()) {
            reasons.add(RootDetectionType.SU_BINARY)
        }

        if (checkRootApps()) {
            reasons.add(RootDetectionType.ROOT_APP)
        }

        if (checkDangerousPaths()) {
            reasons.add(RootDetectionType.DANGEROUS_PATH)
        }

        if (checkTestKeys()) {
            reasons.add(RootDetectionType.TEST_KEYS)
        }

        return reasons
    }

    private fun checkSuBinary(): Boolean {

        val paths = arrayOf(
            "/system/bin/su",
            "/system/xbin/su",
            "/sbin/su",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/xbin/su",
            "/data/local/bin/su",
            "/data/local/su",
            "/vendor/bin/su"
        )

        return paths.any { path ->
            java.io.File(path).exists()
        }
    }

    private fun checkRootApps(): Boolean {

        val packages = arrayOf(
            "com.topjohnwu.magisk",
            "eu.chainfire.supersu",
            "com.koushikdutta.superuser",
            "com.thirdparty.superuser",
            "com.yellowes.su",
            "com.noshufou.android.su"
        )

        val packageManager = context.packageManager

        return packages.any { packageName ->
            try {
                packageManager.getPackageInfo(packageName, 0)
                true
            } catch (_: PackageManager.NameNotFoundException) {
                false
            }
        }
    }

    private fun checkDangerousPaths(): Boolean {

        val paths = arrayOf(
            "/system/app/Superuser.apk",
            "/system/etc/init.d",
            "/system/bin/.ext",
            "/system/xbin/daemonsu",
            "/su/bin",
            "/system/usr/we-need-root",
            "/cache/su",
            "/data/su",
            "/dev/com.koushikdutta.superuser.daemon"
        )

        return paths.any { path ->
            File(path).exists()
        }
    }

    private fun checkTestKeys(): Boolean {
        return Build.TAGS?.contains("test-keys") == true
    }
}