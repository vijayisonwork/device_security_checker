import 'package:flutter/services.dart';

import '../constants/channel_constants.dart';
import '../constants/method_constants.dart';

class MethodChannelDeviceSecurity {
  MethodChannelDeviceSecurity._();

  static const MethodChannel _channel = MethodChannel(ChannelConstants.channel);

  static Future<void> initialize() async {
    await _channel.invokeMethod(MethodConstants.initialize);
  }

  static Future<Map<dynamic, dynamic>> scanDevice() async {
    final result = await _channel.invokeMethod(MethodConstants.scanDevice);
    return result as Map<dynamic, dynamic>;
  }
}
