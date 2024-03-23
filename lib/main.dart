import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:tasks/screens/home/main_screen.dart';
import 'package:tasks/screens/menu/menu_screen.dart';
import 'package:tasks/screens/message/message_screen.dart';
import 'package:tasks/utils/theme.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuScreen(),
        '/main': (context) => const MainScreen(),
        '/messages': (context) => const MessagesScreen(),
      },
    );
  }
}
