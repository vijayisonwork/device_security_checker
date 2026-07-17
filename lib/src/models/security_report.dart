import '../constants/report_keys.dart';

class SecurityReport {
  final bool developerMode;

  /// Android only.
  final bool? usbDebugging;

  /// True when a debugger is currently attached.
  final bool debuggerAttached;

  /// Android Emulator / iOS Simulator
  final bool virtualDevice;

  /// Android Root / iOS Jailbreak
  final bool deviceCompromised;

  const SecurityReport({
    required this.developerMode,
    required this.usbDebugging,
    required this.debuggerAttached,
    required this.virtualDevice,
    required this.deviceCompromised,
  });

  factory SecurityReport.fromMap(Map<dynamic, dynamic> map) {
    return SecurityReport(
      developerMode: map[ReportKeys.developerMode] ?? false,
      usbDebugging: map[ReportKeys.usbDebugging],
      debuggerAttached: map[ReportKeys.debuggerAttached] ?? false,
      virtualDevice: map[ReportKeys.virtualDevice] ?? false,
      deviceCompromised: map[ReportKeys.deviceCompromised] ?? false,
    );
  }
}
