
import 'device_security_checker_platform_interface.dart';

class DeviceSecurityChecker {
  Future<String?> getPlatformVersion() {
    return DeviceSecurityCheckerPlatform.instance.getPlatformVersion();
  }
}
