import 'package:device_security_checker/src/platform/method_channel_device_security.dart';

import '../device_security_checker.dart';

/// Entry point for scanning the device's security state.
///
/// Before calling [scan], initialize the plugin once.
///
/// Example:
///
/// ```dart
/// await DeviceSecurityChecker.initialize();
///
/// final report = await DeviceSecurityChecker.scan();
/// ```
class DeviceSecurityChecker {
  DeviceSecurityChecker._();

  static bool _initialized = false;

  /// Initializes the SDK.
  static Future<void> initialize({
    SecurityConfig config = const SecurityConfig(),
  }) async {
    if (_initialized) {
      return;
    }

    await MethodChannelDeviceSecurity.initialize();

    _initialized = true;
  }

  static Future<Map<dynamic, dynamic>> scan() async {
    if (!_initialized) {
      throw Exception("SDK not initialized");
    }

    return await MethodChannelDeviceSecurity.scanDevice();
  }

  /// Returns whether the SDK has been initialized.
  static bool get isInitialized => _initialized;
}
