# Device Security Checker

A Flutter plugin for detecting device security risks such as Developer Mode, USB Debugging, virtual
devices, Rooted and other security indicators.

## ✨ Features

- ✅ Detect Developer Mode
- ✅ Detect USB Debugging (Android)
- ✅ Detect Virtual Devices (Emulator / Simulator)
- ✅ Root Detection (Android)
- ✅ Debugger Detection
- 🚧 Jailbreak Detection
- 🚧 Frida Detection
- 🚧 Play Integrity

## 📱 Platform Support

| Feature            | Android | iOS |
|--------------------|:-------:|:--:|
| Developer Mode     |    ✅    | N/A |
| USB Debugging      |    ✅    | N/A |
| Virtual Device     |    ✅    |  ✅ |
| Root Detection     |    ✅    | N/A |
| Debugger Detection |    ✅    |  ✅ |

## 📦 Installation

```yaml
dependencies:
  device_security_checker: ^1.1.4
```

Run:

```bash
flutter pub get
```

## 🚀 Usage

```dart
import 'package:device_security_checker/device_security_checker.dart';

Future<void> main() async {
  await DeviceSecurityChecker.initialize();

  await SecurityService.instance.scan();

  final report = SecurityService.instance.report;

  print(report.developerMode);
  print(report.usbDebugging);
  print(report.virtualDevice);
  print(report.rooted);
  print(report.debuggerAttached);
}
```

## 📊 Example Output

```text
SecurityReport(
  developerMode: false,
  usbDebugging: false,
  virtualDevice: false,
  rooted: false,
  debuggerAttached: false,
  deviceCompromised: false,
)
```

## 📸 Screenshots

| Device Secure | Developer Mode | USB Debugging |
|---------------|----------------|---------------|
| ![Device Secure](screenshots/device_secure.jpeg) | ![Developer Mode](screenshots/developer_mode.jpeg) | ![USB Debugging](screenshots/usb_debugging.jpeg) |

| Debugger Attached | Virtual Device | Device Compromised |
|-------------------|----------------|--------------------|
| ![Debugger Attached](screenshots/debugger_attached.jpeg) | ![Virtual Device](screenshots/virtual_device.jpeg) | ![Device Compromised](screenshots/device_compromised.jpeg) |

## 🛣 Roadmap

- [x] Developer Mode Detection (Android)
- [x] USB Debugging Detection (Android)
- [x] Virtual Device Detection (both)
- [x] Root Detection (Android)
- [x] Debugger Detection (both)

### Planned

- [ ] Jailbreak Detection (iOS)
- [ ] Frida Detection (both)
- [ ] Play Integrity API (Android)

## 🤝 Contributing

Contributions, bug reports, and feature requests are welcome.

## 📄 License

This project is licensed under the MIT License.