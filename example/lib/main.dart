import 'package:device_security_checker/device_security_checker.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DeviceSecurityChecker.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device Security Checker',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SecurityReport? _report;

  bool _loading = false;

  String? _error;

  @override
  void initState() {
    super.initState();
    _scanDevice();
  }

  Future<void> _scanDevice() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await SecurityService.instance.scan();

      final report = SecurityService.instance.report;

      setState(() {
        _report = report;
      });

      debugPrint(report.toString());
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  bool get _isSecure {
    if (_report == null) return true;

    return !_report!.developerMode &&
        !(_report!.usbDebugging ?? false) &&
        !_report!.debuggerAttached &&
        !_report!.virtualDevice &&
        !_report!.deviceCompromised;
  }

  @override
  Widget build(BuildContext context) {
    final report = _report;

    return Scaffold(
      appBar: AppBar(
        title: const Text("\nDevice Security Checker"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _scanDevice,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      _isSecure ? Icons.verified_user : Icons.warning_rounded,
                      color: _isSecure ? Colors.green : Colors.red,
                      size: 64,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _isSecure
                          ? "Device Appears Secure"
                          : "Security Risks Detected",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            if (_loading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              ),

            if (_error != null)
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),

            if (report != null) ...[
              _StatusTile(
                title: "Developer Mode",
                enabled: report.developerMode,
                unsupported: false,
              ),

              _StatusTile(
                title: "USB Debugging",
                enabled: report.usbDebugging ?? false,
                unsupported: report.usbDebugging == null,
              ),

              _StatusTile(
                title: "Debugger Attached",
                enabled: report.debuggerAttached,
                unsupported: false,
              ),

              _StatusTile(
                title: "Virtual Device",
                enabled: report.virtualDevice,
                unsupported: false,
              ),

              _StatusTile(
                title: "Device Compromised",
                enabled: report.deviceCompromised,
                unsupported: false,
              ),
            ],

            const SizedBox(height: 30),

            FilledButton.icon(
              onPressed: _loading ? null : _scanDevice,
              icon: const Icon(Icons.security),
              label: Text(_loading ? "Scanning..." : "Scan Device"),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusTile extends StatelessWidget {
  final String title;
  final bool enabled;
  final bool unsupported;

  const _StatusTile({
    required this.title,
    required this.enabled,
    required this.unsupported,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSafe = unsupported ? true : !enabled;

    Color color;
    IconData icon;
    String status;

    if (unsupported) {
      color = Colors.grey;
      icon = Icons.remove_circle_outline;
      status = "N/A";
    } else if (isSafe) {
      color = Colors.green;
      icon = Icons.check_circle;
      status = _safeText();
    } else {
      color = Colors.red;
      icon = Icons.cancel;
      status = _dangerText();
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  String _safeText() {
    switch (title) {
      case "Developer Mode":
        return "Disabled";

      case "USB Debugging":
        return "Disabled";

      case "Debugger Attached":
        return "No";

      case "Virtual Device":
        return "No";

      case "Device Compromised":
        return "No";

      default:
        return "Safe";
    }
  }

  String _dangerText() {
    switch (title) {
      case "Developer Mode":
        return "Enabled";

      case "USB Debugging":
        return "Enabled";

      case "Debugger Attached":
        return "Attached";

      case "Virtual Device":
        return "Yes";

      case "Device Compromised":
        return "Yes";

      default:
        return "Detected";
    }
  }
}
