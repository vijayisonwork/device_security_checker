import 'package:flutter/services.dart';

import '../../device_security_checker.dart';
import '../constants/channel_constants.dart';
import '../constants/method_constants.dart';

class MethodChannelDeviceSecurity {
  MethodChannelDeviceSecurity._();

  static const MethodChannel _channel = MethodChannel(ChannelConstants.channel);

  static Future<void> initialize() async {
    await _channel.invokeMethod(MethodConstants.initialize);
  }

  static Future<SecurityReport> scanDevice() async {
    final result = await _channel.invokeMethod(MethodConstants.scanDevice);
    return SecurityReport.fromMap(result ?? {});
  }
}
