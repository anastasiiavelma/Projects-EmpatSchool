import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:tasks/screens/menu_screen.dart';
import 'package:tasks/theme/theme.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: basicTheme(),
      debugShowCheckedModeBanner: false,
      home: const MenuScreen(),
    );
  }
}
