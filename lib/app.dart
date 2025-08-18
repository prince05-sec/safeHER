import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home/home_page.dart';

class SafeHERApp extends StatelessWidget {
  const SafeHERApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}
