import '../constants/report_keys.dart';

class SecurityReport {
  final bool? developerMode;

  /// Android only.
  final bool? usbDebugging;

  /// True when a debugger is currently attached.
  final bool debuggerAttached;

  /// Android Emulator / iOS Simulator
  final bool virtualDevice;

  /// Device Routed Android
  final bool rooted;

  /// Device Jail Broken iOS
  final bool jailBroken;

  /// Android Root / iOS Jailbreak
  final bool deviceCompromised;

  const SecurityReport({
    required this.developerMode,
    required this.usbDebugging,
    required this.debuggerAttached,
    required this.virtualDevice,
    required this.rooted,
    required this.jailBroken,
    required this.deviceCompromised,
  });

  factory SecurityReport.fromMap(Map<dynamic, dynamic> map) {
    return SecurityReport(
      developerMode: map[ReportKeys.developerMode],
      usbDebugging: map[ReportKeys.usbDebugging],
      debuggerAttached: map[ReportKeys.debuggerAttached] ?? false,
      virtualDevice: map[ReportKeys.virtualDevice] ?? false,
      rooted: map[ReportKeys.rooted] ?? false,
      jailBroken: map[ReportKeys.jailBroken] ?? false,
      deviceCompromised: map[ReportKeys.deviceCompromised] ?? false,
    );
  }

  @override
  String toString() {
    return '''
SecurityReport(
  developerMode: $developerMode,
  usbDebugging: $usbDebugging,
  debuggerAttached: $debuggerAttached,
  virtualDevice: $virtualDevice,
  rooted: $rooted,
  jailBroken: $jailBroken,
  deviceCompromised: $deviceCompromised,
)
''';
  }
}
