import 'package:device_security_checker/device_security_checker.dart';

class SecurityService {
  SecurityService._();

  static final SecurityService instance = SecurityService._();

  SecurityReport? _report;

  SecurityReport? get report => _report;

  bool get isScanned => _report != null;

  Future<void> scan() async {
    _report = await DeviceSecurityChecker.scan();
  }

  Future<void> refresh() async {
    await scan();
  }
}
