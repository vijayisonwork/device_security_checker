package com.vs_plugin.device_security_checker.checker

import android.provider.Settings
import android.os.Debug

class DebuggerChecker() {

    fun isDebuggerAttached(): Boolean {
        return Debug.isDebuggerConnected()
    }

    private fun isWaitingForDebugger(): Boolean {
        return Debug.waitingForDebugger()
    }

    private fun checkDebuggerAttached(): Boolean {
        return Debug.isDebuggerConnected() ||
                Debug.waitingForDebugger()
    }
}