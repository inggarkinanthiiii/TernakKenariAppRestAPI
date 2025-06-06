    // lib/models/request/login_request_model.dart

    class LoginRequestModel {
      final String email;
      final String password;

      LoginRequestModel({
        required this.email,
        required this.password,
      });

      // Metode `toJson` untuk mengubah objek menjadi Map (untuk dikirim sebagai JSON ke API)
      Map<String, dynamic> toJson() {
        return {
          'email': email,
          'password': password,
        };
      }

      // Factory constructor untuk membuat objek dari Map (jika diperlukan untuk parsing dari JSON)
      factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
        return LoginRequestModel(
          email: json['email'] as String,
          password: json['password'] as String,
        );
      }
    }
    