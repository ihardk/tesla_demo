import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tesla_demo/constants/theme.dart';
import 'package:tesla_demo/screens/lock_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tesla App Demo',
      theme: themeData,
      home: const LockScreen(),
    );
  }
}
