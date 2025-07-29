import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/auth_provider.dart';
import 'package:myapp/api_service.dart';

// Provider baru untuk mengambil data profil pengguna
final userProfileProvider = FutureProvider<Map<String, dynamic>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getUserProfile();
});

class HomeScreenPage extends ConsumerWidget {
  const HomeScreenPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Tonton provider profil pengguna
    final userProfile = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // Panggil fungsi logout
              ref.read(authStateProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: Center(
        // Gunakan .when untuk menangani state dari FutureProvider
        child: userProfile.when(
          data: (profile) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to your Home Page!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                child: const Icon(Icons.person, size: 50),
              ),
              const SizedBox(height: 20),
              Text(
                'Username: ${profile['username']}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Email: ${profile['email']}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error loading profile: $error'),
        ),
      ),
    );
  }
}
