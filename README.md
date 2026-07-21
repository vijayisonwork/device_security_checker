# Device Security Checker

A Flutter plugin for detecting device security risks such as Developer Mode, USB Debugging, virtual
devices, Rooted and other security indicators.

## ✨ Features

- ✅ Detect Developer Mode
- ✅ Detect USB Debugging (Android)
- ✅ Detect Virtual Devices (Emulator / Simulator)
- ✅ Debugger Detection
- ✅ Root Detection (Android)
- 🚧 Jailbreak Detection
- 🚧 Frida Detection
- 🚧 Play Integrity

## 📱 Platform Support

| Feature            | Android | iOS |
|--------------------|:-------:|:---:|
| Developer Mode     |    ✅    | 🚧  |
| USB Debugging      |    ✅    | N/A |
| Virtual Device     |    ✅    |  ✅  |
| Debugger Detection |    ✅    | 🚧  |
| Root Detection     |    ✅   | 🚧  |

## 📦 Installation

```yaml
dependencies:
  device_security_checker: ^1.1.3
```

Run:

```bash
flutter pub get
```

## 🚀 Usage

## dart

## final report = await DeviceSecurityChecker.scanDevice();

## print(report.developerMode);
## print(report.usbDebugging);
## print(report.rooted);
## print(report.virtualDevice);

## 📊 Example Output

```text
SecurityReport(
  developerMode: false,
  usbDebugging: false,
  virtualDevice: false,
  rooted: false,
  deviceCompromised: false,
  debuggerAttached: false,
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

- [x] Developer Mode Detection
- [x] USB Debugging Detection
- [x] Virtual Device Detection
- [x] Debugger Detection
- [x] Root Detection
- [ ] Jailbreak Detection
- [ ] Frida Detection
- [ ] Magisk Detection
- [ ] Play Integrity Support

## 🤝 Contributing

Contributions, bug reports, and feature requests are welcome.

## 📄 License

This project is licensed under the MIT License.