package com.vs_plugin.device_security_checker.checker

import android.os.Build

class EmulatorChecker {

    fun isEmulator(): Boolean {

        return (
                Build.FINGERPRINT.startsWith("generic") ||
                        Build.FINGERPRINT.contains("vbox") ||
                        Build.FINGERPRINT.contains("test-keys") ||

                        Build.MODEL.contains("google_sdk") ||
                        Build.MODEL.contains("Emulator") ||
                        Build.MODEL.contains("Android SDK built for x86") ||

                        Build.MANUFACTURER.contains("Genymotion") ||

                        Build.BRAND.startsWith("generic") &&
                        Build.DEVICE.startsWith("generic") ||

                        Build.PRODUCT.contains("sdk") ||
                        Build.PRODUCT.contains("sdk_google") ||
                        Build.PRODUCT.contains("sdk_x86") ||
                        Build.PRODUCT.contains("vbox86p") ||
                        Build.PRODUCT.contains("emulator") ||
                        Build.PRODUCT.contains("simulator")
                )
    }
}