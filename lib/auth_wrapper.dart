import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/auth_provider.dart';
import 'package:myapp/homeScreenPage.dart';
import 'package:myapp/loginPage.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    switch (authState) {
      case AuthStatus.authenticated:
        return const HomeScreenPage(title: 'Home');
      case AuthStatus.unauthenticated:
      case AuthStatus.error:
        return const LoginPage();
      case AuthStatus.loading:
      default:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
