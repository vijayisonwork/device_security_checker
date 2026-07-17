import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_security_checker/device_security_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DeviceSecurityChecker.initialize();

  final report = await DeviceSecurityChecker.scan();

  print('report: ${report}');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Device Security Checker'),
        ),
      ),
    );
  }
}
