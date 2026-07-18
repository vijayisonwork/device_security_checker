import 'package:flutter_test/flutter_test.dart';
import 'package:device_security_checker/device_security_checker.dart';
import 'package:device_security_checker/device_security_checker_platform_interface.dart';
import 'package:device_security_checker/device_security_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceSecurityCheckerPlatform
    with MockPlatformInterfaceMixin
    implements DeviceSecurityCheckerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DeviceSecurityCheckerPlatform initialPlatform =
      DeviceSecurityCheckerPlatform.instance;

  test('$MethodChannelDeviceSecurityChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceSecurityChecker>());
  });
}
