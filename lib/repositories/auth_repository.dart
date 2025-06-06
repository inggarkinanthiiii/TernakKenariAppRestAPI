    // lib/repositories/auth_repository.dart
    import 'package:ternakkenari/services/service_http_client.dart'; // Impor ServiceHttpClient
    import 'package:ternakkenari/models/request/login_request_model.dart'; // Impor LoginRequestModel (asumsi path)
    import 'package:ternakkenari/models/request/register_request_model.dart'; // Impor RegisterRequestModel (asumsi path)
    import 'dart:convert'; // Untuk jsonDecode jika parsing respons JSON

    class AuthRepository {
      final ServiceHttpClient serviceHttpClient; // Tambahkan properti untuk ServiceHttpClient

      // Constructor untuk menginisialisasi ServiceHttpClient
      AuthRepository({required this.serviceHttpClient});

      // Contoh metode login
      Future<dynamic> login(LoginRequestModel requestModel) async {
        try {
          // Asumsi ServiceHttpClient memiliki metode post
          final response = await serviceHttpClient.postWithToken(
            '/auth/login', // Ganti dengan endpoint API login Anda
            requestModel.toJson(), // Mengubah request model menjadi Map JSON
          );

          if (response.statusCode == 200) {
            // Parsing respons JSON jika berhasil
            return jsonDecode(response.body); // Anda mungkin perlu membuat model respons login
          } else {
            // Handle error, misalnya dengan melempar exception atau mengembalikan pesan error
            throw Exception('Failed to login: ${response.statusCode} - ${response.body}');
          }
        } catch (e) {
          throw Exception('Error during login: $e');
        }
      }

      // Contoh metode register
      Future<dynamic> register(RegisterRequestModel requestModel) async {
        try {
          final response = await serviceHttpClient.postWithToken(
            '/auth/register', // Ganti dengan endpoint API register Anda
            requestModel.toJson(),
          );

          if (response.statusCode == 200) {
            return jsonDecode(response.body); // Anda mungkin perlu membuat model respons register
          } else {
            throw Exception('Failed to register: ${response.statusCode} - ${response.body}');
          }
        } catch (e) {
          throw Exception('Error during registration: $e');
        }
      }

      // Tambahkan metode otentikasi lainnya (misalnya, logout, refresh token, dll.)
    }
    