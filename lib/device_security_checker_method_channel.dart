import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_security_checker_platform_interface.dart';

/// An implementation of [DeviceSecurityCheckerPlatform] that uses method channels.
class MethodChannelDeviceSecurityChecker extends DeviceSecurityCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_security_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
