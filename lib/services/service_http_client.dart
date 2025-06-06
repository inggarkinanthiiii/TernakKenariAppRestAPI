// lib/services/service_http_client.dart
import 'dart:convert'; // Untuk jsonEncode
import 'package:http/http.dart' as http;

class ServiceHttpClient {
  final String _baseUrl = 'https://api.your_domain.com'; // Ganti dengan base URL API Anda

  Future<http.Response> get(String endpoint) async {
    final uri = Uri.parse('$_baseUrl/$endpoint');
    return await http.get(uri);
  }

  Future<http.Response> postWithToken(String endpoint, Map<String, dynamic> jsonBody) async {
    // Asumsi Anda memiliki cara untuk mendapatkan token
    String? token = "your_token_here";

    final uri = Uri.parse('$_baseUrl/$endpoint');
    return await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(jsonBody),
    );
  }

  // Tambahkan metode lain seperti POST, PUT, DELETE jika diperlukan
}