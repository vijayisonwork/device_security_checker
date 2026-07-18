import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_security_checker_method_channel.dart';

abstract class DeviceSecurityCheckerPlatform extends PlatformInterface {
  /// Constructs a DeviceSecurityCheckerPlatform.
  DeviceSecurityCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceSecurityCheckerPlatform _instance =
      MethodChannelDeviceSecurityChecker();

  /// The default instance of [DeviceSecurityCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceSecurityChecker].
  static DeviceSecurityCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceSecurityCheckerPlatform] when
  /// they register themselves.
  static set instance(DeviceSecurityCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
