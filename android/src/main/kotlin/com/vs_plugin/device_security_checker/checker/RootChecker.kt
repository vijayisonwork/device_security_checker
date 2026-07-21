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

        if (checkBusyBox()) {
            reasons.add(RootDetectionType.BUSYBOX)
        }

        if (checkWhichSu()) {
            reasons.add(RootDetectionType.WHICH_SU)
        }

        if (checkMagiskApp()) {
            reasons.add(RootDetectionType.MAGISK_APP)
        }

        return reasons
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

    private fun checkTestKeys(): Boolean {
        return Build.TAGS?.contains("test-keys") == true
    }

    private fun checkBusyBox(): Boolean {
        val paths = arrayOf(
            "/system/bin/busybox",
            "/system/xbin/busybox",
            "/sbin/busybox"
        )

        return paths.any { File(it).exists() }
    }

    private fun checkWhichSu(): Boolean {
        return try {
            val process = Runtime.getRuntime().exec("which su")
            process.inputStream.bufferedReader().use { reader ->
                reader.readLine()?.isNotBlank() == true
            }
        } catch (e: Exception) {
            false
        }
    }

    private fun checkMagiskApp(): Boolean {
        val packages = listOf(
            "com.topjohnwu.magisk",
            "io.github.vvb2060.magisk"
        )

        return packages.any { packageName ->
            try {
                context.packageManager.getPackageInfo(packageName, 0)
                true
            } catch (_: Exception) {
                false
            }
        }
    }

    private val suBinaryPaths = listOf(
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

    private val dangerousPaths = listOf(
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

    private val magiskPaths = listOf(
        "/sbin/magisk",
        "/data/adb/magisk",
        "/cache/magisk.log",
        "/init.magisk.rc"
    )

    private fun fileExists(paths: List<String>): Boolean =
        paths.any { File(it).exists() }

    private fun fileExists(paths: List<String>): Boolean =
        paths.any { File(it).exists() }

    private fun checkSuBinary() = fileExists(suBinaryPaths)

    private fun checkDangerousPaths() = fileExists(dangerousPaths)

    private fun checkMagiskFiles() = fileExists(magiskPaths)
}