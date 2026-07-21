package com.vs_plugin.device_security_checker.utils

enum class RootDetectionType {
    SU_BINARY,
    ROOT_APP,
    DANGEROUS_PATH,
    TEST_KEYS,
    BUSYBOX,
    WHICH_SU,
    MAGISK_APP,
    MAGISK_FILES
}