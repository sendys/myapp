import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/splash_screen.dart'; 

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth App',
      theme: ThemeData(
        primaryColor: const Color(0xFF00BF6D),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00BF6D)), 
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
