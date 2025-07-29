import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/secure_storage_service.dart';

class ApiService {
  final String _baseUrl = 'https://api.example.com/auth';
  final SecureStorageService _storageService = SecureStorageService();

  // Helper untuk mendapatkan header otentikasi
  Future<Map<String, String>> _getAuthHeaders() async {
    final token = await _storageService.readToken();
    return {
      'Content-Type': 'application/json; charset=UTF-TF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulasi
    if (email == 'test@example.com' && password == 'password') {
      // Di dunia nyata, token ini berasal dari respons server
      final String fakeToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
      
      // Simpan token
      await _storageService.saveToken(fakeToken);

      return {'token': fakeToken, 'message': 'Login successful'};
    } else {
      throw Exception('Invalid credentials');
    }
  }
  
  // Fungsi untuk logout
  Future<void> logout() async {
    // Hapus token dari penyimpanan
    await _storageService.deleteToken();
  }

  // Contoh fungsi yang memerlukan otentikasi
  Future<Map<String, dynamic>> getUserProfile() async {
    // Simulasi
    await Future.delayed(const Duration(seconds: 1));
    final token = await _storageService.readToken();

    if (token != null) {
      // Di dunia nyata, Anda akan melakukan panggilan API seperti ini:
      // final response = await http.get(Uri.parse('$_baseUrl/profile'), headers: await _getAuthHeaders());
      // if (response.statusCode == 200) return jsonDecode(response.body);
      // else throw Exception('Failed to load profile');

      return {'username': 'John Doe', 'email': 'test@example.com'};
    } else {
      throw Exception('Not authenticated');
    }
  }

  // Anda bisa menambahkan fungsi register di sini seperti sebelumnya
  Future<Map<String, dynamic>> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    print('Mendaftarkan pengguna: $fullName, $email');
    return {'message': 'Registration successful'};
  }
}
