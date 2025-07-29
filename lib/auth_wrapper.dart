import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/auth_provider.dart';
import 'package:myapp/bottom_nav_screen.dart';
import 'package:myapp/loginPage.dart';
import 'package:myapp/splash_screen.dart'; // <-- Impor Splash Screen

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    switch (authState) {
      case AuthStatus.authenticated:
        return const BottomNavScreen();
      case AuthStatus.unauthenticated:
      case AuthStatus.error:
      case AuthStatus.authenticating:
        return LoginPage();
      case AuthStatus.loading:
        // Gunakan SplashScreen di sini
        return const SplashScreen();
    }
  }
}
