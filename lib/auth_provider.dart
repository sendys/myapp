import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/api_service.dart';
import 'package:myapp/secure_storage_service.dart';

// Enum untuk merepresentasikan status otentikasi
enum AuthStatus { authenticated, unauthenticated, loading, error }

// Provider untuk SecureStorageService
final secureStorageProvider = Provider<SecureStorageService>((ref) => SecureStorageService());

// Provider untuk ApiService, yang sekarang membutuhkan SecureStorageService
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

// State Notifier untuk status otentikasi
class AuthStateNotifier extends StateNotifier<AuthStatus> {
  final ApiService _apiService;
  final SecureStorageService _storageService;

  AuthStateNotifier(this._apiService, this._storageService) : super(AuthStatus.loading) {
    _checkAuthStatus();
  }

  // Periksa apakah token ada saat aplikasi dimulai
  Future<void> _checkAuthStatus() async {
    final token = await _storageService.readToken();
    state = token != null ? AuthStatus.authenticated : AuthStatus.unauthenticated;
  }

  Future<void> login(String email, String password) async {
    state = AuthStatus.loading;
    try {
      await _apiService.login(email, password);
      state = AuthStatus.authenticated;
    } catch (e) {
      state = AuthStatus.error;
    }
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    state = AuthStatus.loading;
    try {
      await _apiService.register(fullName: fullName, email: email, password: password);
      // Setelah registrasi, pengguna masih perlu login
      state = AuthStatus.unauthenticated; 
    } catch(e) {
        state = AuthStatus.error;
    }
  }

  Future<void> logout() async {
    state = AuthStatus.loading;
    await _apiService.logout();
    state = AuthStatus.unauthenticated;
  }
}

// Provider untuk AuthStateNotifier
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthStatus>(
  (ref) => AuthStateNotifier(
    ref.watch(apiServiceProvider),
    ref.watch(secureStorageProvider),
  ),
);
