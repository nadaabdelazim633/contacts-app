import 'package:flutter/material.dart';
import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.darkBlue,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.gold,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}