package com.vs_plugin.device_security_checker.security

import android.content.Context
import com.vs_plugin.device_security_checker.checker.DeveloperChecker
import com.vs_plugin.device_security_checker.checker.UsbDebugChecker
import com.vs_plugin.device_security_checker.checker.EmulatorChecker
import com.vs_plugin.device_security_checker.checker.RootChecker
import com.vs_plugin.device_security_checker.checker.DebuggerChecker
import com.vs_plugin.device_security_checker.utils.Constants

class SecurityScanner(private val context: Context) {
    private val developerChecker = DeveloperChecker(context)
    private val usbDebugChecker = UsbDebugChecker(context)
    private val emulatorChecker = EmulatorChecker()
    private val rootChecker = RootChecker(context)
    private val debuggerChecker = DebuggerChecker()

    fun scan(): Map<String, Any?> {
        val rooted = rootChecker.isRooted()

        val compromised = rooted

        return mapOf(
            Constants.KEY_DEVELOPER_MODE to developerChecker.isEnabled(),
            Constants.KEY_USB_DEBUGGING to usbDebugChecker.isEnabled(),
            Constants.KEY_VIRTUAL_DEVICE to emulatorChecker.isEmulator(),
            Constants.KEY_ROOTED to rooted,
            Constants.KEY_DEBUGGER_ATTACHED to debuggerChecker.checkDebuggerAttached(),
            Constants.KEY_DEVICE_COMPROMISED to compromised
        )
    }
}